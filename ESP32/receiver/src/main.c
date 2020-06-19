// code adapted from https://github.com/espressif/esp-idf/blob/release/v4.0/examples/peripherals/rmt_nec_tx_rx/main/infrared_nec_main.c

#include <stdio.h>
#include <string.h>
#include <time.h>
#include <sys/unistd.h>
#include <sys/stat.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "freertos/semphr.h"
#include "esp_err.h"
#include "esp_log.h"
#include "esp_vfs_fat.h"
#include "driver/sdspi_host.h"
#include "driver/sdmmc_host.h"
#include "driver/rmt.h"
#include "driver/gpio.h"
#include "sdmmc_cmd.h"

#define LED_GPIO GPIO_NUM_13

static const char* NEC_TAG = "NEC";

//CHOOSE SELF TEST OR NORMAL TEST
#define RMT_RX_SELF_TEST   0

/******************************************************/
/*****                SELF TEST:                  *****/
/*Connect RMT_TX_GPIO_NUM with RMT_RX_GPIO_NUM        */
/*TX task will send NEC data with carrier disabled    */
/*RX task will print NEC data it receives.            */
/******************************************************/
#if RMT_RX_SELF_TEST
#define RMT_RX_ACTIVE_LEVEL  1   /*!< Data bit is active high for self test mode */
#define RMT_TX_CARRIER_EN    0   /*!< Disable carrier for self test mode  */
#else
//Test with infrared LED, we have to enable carrier for transmitter
//When testing via IR led, the receiver waveform is usually active-low.
#define RMT_RX_ACTIVE_LEVEL  0   /*!< If we connect with a IR receiver, the data is active low */
#define RMT_TX_CARRIER_EN    1   /*!< Enable carrier for IR transmitter test with IR led */
#endif

#define RMT_TX_CHANNEL    1     /*!< RMT channel for transmitter */
#define RMT_TX_GPIO_NUM  32     /*!< GPIO number for transmitter signal */
#define RMT_RX_CHANNEL    0     /*!< RMT channel for receiver */
#define RMT_RX_GPIO_NUM  14     /*!< GPIO number for receiver */
#define RMT_CLK_DIV      100    /*!< RMT counter clock divider */
#define RMT_TICK_10_US    (80000000/RMT_CLK_DIV/100000)   /*!< RMT counter value for 10 us.(Source clock is APB clock) */

#define NEC_HEADER_HIGH_US    9000                         /*!< NEC protocol header: positive 9ms */
#define NEC_HEADER_LOW_US     4500                         /*!< NEC protocol header: negative 4.5ms*/
#define NEC_END_HIGH_US        560                         /*!< NEC protocol header: positive 9ms */
#define NEC_END_LOW_US           0                         /*!< NEC protocol header: negative 4.5ms*/
#define NEC_BIT_ONE_HIGH_US    560                         /*!< NEC protocol data bit 1: positive 0.56ms */
#define NEC_BIT_ONE_LOW_US    (2250-NEC_BIT_ONE_HIGH_US)   /*!< NEC protocol data bit 1: negative 1.69ms */
#define NEC_BIT_ZERO_HIGH_US   560                         /*!< NEC protocol data bit 0: positive 0.56ms */
#define NEC_BIT_ZERO_LOW_US   (1120-NEC_BIT_ZERO_HIGH_US)  /*!< NEC protocol data bit 0: negative 0.56ms */
#define NEC_BIT_END            560                         /*!< NEC protocol end: positive 0.56ms */
#define NEC_BIT_MARGIN         100                          /*!< NEC parse margin time */

#define NEC_ITEM_DURATION(d)  ((d & 0x7fff)*10/RMT_TICK_10_US)  /*!< Parse duration time from memory register value */
#define NEC_DATA_ITEM_NUM   66  /*!< NEC code item number: header + 64bit data + end */
#define RMT_TX_DATA_NUM  1    /*!< NEC tx test data number */
#define rmt_item32_tIMEOUT_US  9500   /*!< RMT receiver timeout value(us) */

/**********************************************  SD START   *************************************************/

#define PIN_NUM_MISO 19
#define PIN_NUM_MOSI 18
#define PIN_NUM_CLK  5
#define PIN_NUM_CS   4

/**********************************************  WiFi START   *************************************************/
#include <inttypes.h>

#include <string.h>
#include <time.h>
#include <sys/time.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event_loop.h"
#include "esp_log.h"
#include "esp_attr.h"
#include "esp_sleep.h"
#include "nvs_flash.h"

#include "lwip/err.h"
#include "lwip/apps/sntp.h"

/* The examples use simple WiFi configuration that you can set via
   'make menuconfig'.
   If you'd rather not, just change the below entries to strings with
   the config you want - ie #define EXAMPLE_WIFI_SSID "mywifissid"
*/
#define EXAMPLE_WIFI_SSID "VM6766956"
#define EXAMPLE_WIFI_PASS "mpJqfkhT7myy"

/* FreeRTOS event group to signal when we are connected & ready to make a request */
static EventGroupHandle_t wifi_event_group;

/* The event group allows multiple bits for each event,
   but we only care about one event - are we connected
   to the AP with an IP? */
const int CONNECTED_BIT = BIT0;

static const char *TAG = "example";


static void obtain_time(void);
static void initialize_sntp(void);
static void initialise_wifi(void);
static esp_err_t event_handler(void *ctx, system_event_t *event);

int64_t xx_time_get_time() {
	struct timeval tv;
	gettimeofday(&tv, NULL);
	return (tv.tv_sec * 1000LL + (tv.tv_usec / 1000LL));
}

static void obtain_time(void)
{
    ESP_ERROR_CHECK( nvs_flash_init() );
    initialise_wifi();
    xEventGroupWaitBits(wifi_event_group, CONNECTED_BIT,
                        false, true, portMAX_DELAY);
    initialize_sntp();

    // wait for time to be set
    time_t now = 0;
    struct tm timeinfo = { 0 };
    int retry = 0;
    const int retry_count = 60;
    while(timeinfo.tm_year < (2016 - 1900) && ++retry < retry_count) {
        ESP_LOGI(TAG, "Waiting for system time to be set... (%d/%d)", retry, retry_count);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
        time(&now);
        localtime_r(&now, &timeinfo);
    }

    ESP_ERROR_CHECK( esp_wifi_stop() );
}

static void initialize_sntp(void)
{
    ESP_LOGI(TAG, "Initializing SNTP");
    sntp_setoperatingmode(SNTP_OPMODE_POLL);
    sntp_setservername(0, "pool.ntp.org");
	sntp_setservername(1, "europe.pool.ntp.org");
	sntp_setservername(2, "uk.pool.ntp.org ");
	sntp_setservername(3, "us.pool.ntp.org");
	sntp_setservername(4, "time1.google.com");
    sntp_init();
}

static void initialise_wifi(void)
{
    tcpip_adapter_init();
    wifi_event_group = xEventGroupCreate();
    ESP_ERROR_CHECK( esp_event_loop_init(event_handler, NULL) );
    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK( esp_wifi_init(&cfg) );
    ESP_ERROR_CHECK( esp_wifi_set_storage(WIFI_STORAGE_RAM) );
    wifi_config_t wifi_config = {
        .sta = {
            .ssid = EXAMPLE_WIFI_SSID,
            .password = EXAMPLE_WIFI_PASS,
        },
    };
    ESP_LOGI(TAG, "Setting WiFi configuration SSID %s...", wifi_config.sta.ssid);
    ESP_ERROR_CHECK( esp_wifi_set_mode(WIFI_MODE_STA) );
    ESP_ERROR_CHECK( esp_wifi_set_config(ESP_IF_WIFI_STA, &wifi_config) );
    ESP_ERROR_CHECK( esp_wifi_start() );
}

static esp_err_t event_handler(void *ctx, system_event_t *event)
{
    switch(event->event_id) {
    case SYSTEM_EVENT_STA_START:
        esp_wifi_connect();
        break;
    case SYSTEM_EVENT_STA_GOT_IP:
        xEventGroupSetBits(wifi_event_group, CONNECTED_BIT);
        break;
    case SYSTEM_EVENT_STA_DISCONNECTED:
        /* This is a workaround as ESP32 WiFi libs don't currently
           auto-reassociate. */
        esp_wifi_connect();
        xEventGroupClearBits(wifi_event_group, CONNECTED_BIT);
        break;
    default:
        break;
    }
    return ESP_OK;
}


/**********************************************  WiFi end   *************************************************/



/*
 * @brief Check whether duration is around target_us
 */
inline bool nec_check_in_range(int duration_ticks, int target_us, int margin_us)
{
    if(( NEC_ITEM_DURATION(duration_ticks) < (target_us + margin_us))
        && ( NEC_ITEM_DURATION(duration_ticks) > (target_us - margin_us))) {
        return true;
    } else {
        return false;
    }
}

/*
 * @brief Check whether this value represents an NEC header
 */
static bool nec_header_if(rmt_item32_t* item)
{
    if((item->level0 == RMT_RX_ACTIVE_LEVEL && item->level1 != RMT_RX_ACTIVE_LEVEL)
        && nec_check_in_range(item->duration0, NEC_HEADER_HIGH_US, NEC_BIT_MARGIN)
        && nec_check_in_range(item->duration1, NEC_HEADER_LOW_US, NEC_BIT_MARGIN)) {
        return true;
    }
    return false;
}

/*
 * @brief Check whether this value represents an NEC data bit 1
 */
static bool nec_bit_one_if(rmt_item32_t* item)
{
    if((item->level0 == RMT_RX_ACTIVE_LEVEL && item->level1 != RMT_RX_ACTIVE_LEVEL)
        && nec_check_in_range(item->duration0, NEC_BIT_ONE_HIGH_US, NEC_BIT_MARGIN)
        && nec_check_in_range(item->duration1, NEC_BIT_ONE_LOW_US, NEC_BIT_MARGIN)) {
        return true;
    }
    return false;
}

/*
 * @brief Check whether this value represents an NEC data bit 0
 */
static bool nec_bit_zero_if(rmt_item32_t* item)
{
    if((item->level0 == RMT_RX_ACTIVE_LEVEL && item->level1 != RMT_RX_ACTIVE_LEVEL)
        && nec_check_in_range(item->duration0, NEC_BIT_ZERO_HIGH_US, NEC_BIT_MARGIN)
        && nec_check_in_range(item->duration1, NEC_BIT_ZERO_LOW_US, NEC_BIT_MARGIN)) {
        return true;
    }
    return false;
}


/*
 * @brief Check whether this value represents an NEC end
 */
static bool nec_end_if(rmt_item32_t* item)
{
    if((item->level0 == RMT_RX_ACTIVE_LEVEL && item->level1 != RMT_RX_ACTIVE_LEVEL)
        && nec_check_in_range(item->duration0, NEC_END_HIGH_US, NEC_BIT_MARGIN)
        && nec_check_in_range(item->duration1, NEC_END_LOW_US, NEC_BIT_MARGIN)) {
        return true;
    }
    return false;
}


/*
 * @brief RMT receiver initialization
 */
static void nec_rx_init()
{
    rmt_config_t rmt_rx;
    rmt_rx.channel = RMT_RX_CHANNEL;
    rmt_rx.gpio_num = RMT_RX_GPIO_NUM;
    rmt_rx.clk_div = RMT_CLK_DIV;
    rmt_rx.mem_block_num = 1;
    rmt_rx.rmt_mode = RMT_MODE_RX;
    rmt_rx.rx_config.filter_en = true;
    rmt_rx.rx_config.filter_ticks_thresh = 100;
    rmt_rx.rx_config.idle_threshold = rmt_item32_tIMEOUT_US / 10 * (RMT_TICK_10_US);
    rmt_config(&rmt_rx);
    rmt_driver_install(rmt_rx.channel, 1000, 0);
}

void blink(int on_ms, int off_ms, int repeat)
{
    for (int i = 0; i < repeat; i++)
    {
        gpio_set_level(LED_GPIO, 1);
        vTaskDelay(on_ms / portTICK_PERIOD_MS);
        gpio_set_level(LED_GPIO, 0);
        vTaskDelay(off_ms / portTICK_PERIOD_MS);
    }
}

void app_main()
{
    gpio_pad_select_gpio(LED_GPIO);
    /* Set the GPIO as a push/pull output */
    gpio_set_direction(LED_GPIO, GPIO_MODE_OUTPUT);


    sdmmc_host_t host = SDSPI_HOST_DEFAULT();
    sdspi_slot_config_t slot_config = SDSPI_SLOT_CONFIG_DEFAULT();
    slot_config.gpio_miso = PIN_NUM_MISO;
    slot_config.gpio_mosi = PIN_NUM_MOSI;
    slot_config.gpio_sck  = PIN_NUM_CLK;
    slot_config.gpio_cs   = PIN_NUM_CS;

    // Options for mounting the filesystem.
    // If format_if_mount_failed is set to true, SD card will be partitioned and
    // formatted in case when mounting fails.
    esp_vfs_fat_sdmmc_mount_config_t mount_config = {
        .format_if_mount_failed = false,
        .max_files = 5,
        .allocation_unit_size = 16 * 1024
    };
    // Use settings defined above to initialize SD card and mount FAT filesystem.
    // Note: esp_vfs_fat_sdmmc_mount is an all-in-one convenience function.
    // Please check its source code and implement error recovery when developing
    // production applications.
    sdmmc_card_t* card;
    esp_err_t ret = esp_vfs_fat_sdmmc_mount("/sdcard", &host, &slot_config, &mount_config, &card);

    if (ret != ESP_OK) {
        if (ret == ESP_FAIL) {
            ESP_LOGE(TAG, "Failed to mount filesystem. "
                "If you want the card to be formatted, set format_if_mount_failed = true.");
        } else {
            ESP_LOGE(TAG, "Failed to initialize the card (%s). "
                "Make sure SD card lines have pull-up resistors in place.", esp_err_to_name(ret));
        }
        return;
    }

    // Card has been initialized, print its properties
    sdmmc_card_print_info(stdout, card);

    // Check if destination file exists
    int filecount=0;
    char filepath[32];
    sprintf(filepath, "/sdcard/log_%d.csv", filecount);
    struct stat st;
    while(stat(filepath, &st) == 0)
    {
        filecount++;
        sprintf(filepath, "/sdcard/log_%d.csv", filecount);
    }

    // Use POSIX and C standard library functions to work with files.
    // First create a file.
    ESP_LOGI(TAG, "Opening file");
    FILE* f = fopen(filepath, "w");
    if (f == NULL) {
        ESP_LOGE(TAG, "Failed to open file for writing");
        return;
    }
    fprintf(f, "local,received,diff,correction,header_duration0,header_duration1,high_min,high_max,low_short_min,low_short_max,low_long_min,low_long_max,high_avg,low_short_avg,low_long_avg\n");
    fclose(f);
    ESP_LOGI(TAG, "File written");
    vTaskDelay(pdMS_TO_TICKS(2000));


    time_t now;
    struct tm timeinfo;
    char strftime_buf[64];
    obtain_time();
    setenv("TZ", "GMTGMT-1,M3.4.0/01,M10.4.0/02", 1);
    tzset();
    localtime_r(&now, &timeinfo);
    strftime(strftime_buf, sizeof(strftime_buf), "%c", &timeinfo);
    ESP_LOGI(TAG, "The current date/time is: %s", strftime_buf);
    if (xx_time_get_time() < 1590325529559)
    {
        //time not set
        blink(500,500,30);
    } else
    {
        blink(1000,500,1);
    }



    int64_t ts_millis;
    int channel = RMT_RX_CHANNEL;
    nec_rx_init();
    RingbufHandle_t rb = NULL;
    //get RMT RX ringbuffer
    rmt_get_ringbuf_handle(channel, &rb);
    rmt_rx_start(channel, 1);


    // header_duration0_min,header_duration0_max,header_duration1_min,header_duration1_max,
    // zero_duration0_min,zero_duration0_max,zero_duration1_min,zero_duration1_max,
    // one_duration0_min,one_duration0_max,one_duration1_min,one_duration1_max,
    // end_duration0_min,end_duration0_max


    while(1)
    {
        size_t rx_size = 0;
        //try to receive data from ringbuffer.
        //RMT driver will push all the data it receives to its ringbuffer.
        //We just need to parse the value and return the spaces of ringbuffer.
        rmt_item32_t* item = (rmt_item32_t*) xRingbufferReceive(rb, &rx_size, 1000);
        if (item)
        {
            ts_millis = xx_time_get_time();
            uint64_t ts = 0;
            int count_ones = 0;
            int count_zeros = 0;
            // printf("size: %u\n", rx_size);
            int header_duration0 = 0;
            int header_duration1 = 0;

            int high_min = 0x7FFFFFFF;
            int high_max = 0;
            int low_short_min = 0x7FFFFFFF;
            int low_short_max = 0;
            int low_long_min = 0x7FFFFFFF;
            int low_long_max = 0;


            int high = 0;
            int low_short = 0;
            int low_long = 0;

            int count_high = 0;
            int count_low_short = 0;
            int count_low_long = 0;

            // int zero_duration0_min = 0x7FFFFFFF;
            // int zero_duration0_max = 0;
            // int zero_duration1_min = 0x7FFFFFFF;
            // int zero_duration1_max = 0;

            // int one_duration0_min = 0x7FFFFFFF;
            // int one_duration0_max = 0;
            // int one_duration1_min = 0x7FFFFFFF;
            // int one_duration1_max = 0;

            // int end_duration0_min = 0x7FFFFFFF;
            // int end_duration0_max = 0;
            if (nec_header_if(item))
            {
                header_duration0 = (item)->duration0;
                header_duration1 = (item)->duration1;
                // printf("header: \tduration0: %u\tlevel0: %u\tduration1: %u\tlevel1: %u\n", (item)->duration0, (item)->level0, (item)->duration1, (item)->level1);
                for(int i = 1; i < rx_size / 4 ; i++)
                {
                    if (nec_bit_one_if(item + i))
                    {
                        ts |= ((uint64_t) 1 << (i-1));
                        count_ones++;
                        // if ((item+i)->duration0 < one_duration0_min) one_duration0_min = (item+i)->duration0;
                        // if ((item+i)->duration0 > one_duration0_max) one_duration0_max = (item+i)->duration0;
                        // if ((item+i)->duration1 < one_duration1_min) one_duration1_min = (item+i)->duration1;
                        // if ((item+i)->duration1 > one_duration1_max) one_duration1_max = (item+i)->duration1;
                        if ((item+i)->duration0 < high_min) high_min = (item+i)->duration0;
                        if ((item+i)->duration0 > high_max) high_max = (item+i)->duration0;
                        if ((item+i)->duration1 < low_long_min) low_long_min = (item+i)->duration1;
                        if ((item+i)->duration1 > low_long_max) low_long_max = (item+i)->duration1;
                        high += (item+i)->duration0;
                        count_high++;
                        low_long += (item+i)->duration1;
                        count_low_long++;
                        // printf("one(%d): \tduration0: %u\tlevel0: %u\tduration1: %u\tlevel1: %u\n",i-1, (item + i)->duration0, (item + i)->level0, (item + i)->duration1, (item + i)->level1);
                    } else if (nec_bit_zero_if(item + i))
                    {
                        count_zeros++;
                        // if ((item+i)->duration0 < zero_duration0_min) zero_duration0_min = (item+i)->duration0;
                        // if ((item+i)->duration0 > zero_duration0_max) zero_duration0_max = (item+i)->duration0;
                        // if ((item+i)->duration1 < zero_duration1_min) zero_duration1_min = (item+i)->duration1;
                        // if ((item+i)->duration1 > zero_duration1_max) zero_duration1_max = (item+i)->duration1;
                        if ((item+i)->duration0 < high_min) high_min = (item+i)->duration0;
                        if ((item+i)->duration0 > high_max) high_max = (item+i)->duration0;
                        if ((item+i)->duration1 < low_short_min) low_short_min = (item+i)->duration1;
                        if ((item+i)->duration1 > low_short_max) low_short_max = (item+i)->duration1;
                        high += (item+i)->duration0;
                        count_high++;
                        low_short += (item+i)->duration1;
                        count_low_short++;
                        // printf("zero(%d): \tduration0: %u\tlevel0: %u\tduration1: %u\tlevel1: %u\n",i-1, (item + i)->duration0, (item + i)->level0, (item + i)->duration1, (item + i)->level1);
                    } else if (nec_end_if(item + i))
                    {
                        // if ((item+i)->duration0 < end_duration0_min) end_duration0_min = (item+i)->duration0;
                        // if ((item+i)->duration0 > end_duration0_max) end_duration0_max = (item+i)->duration0;
                        if ((item+i)->duration0 < high_min) high_min = (item+i)->duration0;
                        if ((item+i)->duration0 > high_max) high_max = (item+i)->duration0;
                        high += (item+i)->duration0;
                        count_high++;
                        break;
                        // printf("end(%d): \tduration0: %u\tlevel0: %u\tduration1: %u\tlevel1: %u\n",i-1, (item + i)->duration0, (item + i)->level0, (item + i)->duration1, (item + i)->level1);
                    } else
                    {
                        printf("other(%d): \tduration0: %u\tlevel0: %u\tduration1: %u\tlevel1: %u\n",i-1, (item + i)->duration0, (item + i)->level0, (item + i)->duration1, (item + i)->level1);
                    }
                }

                uint64_t correction_ms = (NEC_HEADER_HIGH_US + NEC_HEADER_LOW_US
                                        + (NEC_BIT_ONE_HIGH_US + NEC_BIT_ONE_LOW_US) * count_ones
                                        + (NEC_BIT_ONE_HIGH_US + NEC_END_LOW_US) * count_zeros) / 1000;
                ts += correction_ms;

                blink(100,10,1);
                int64_t diff = ts_millis - (int64_t) ts;
                // if(diff > 200 || diff < -200)
                // {
                //     blink(500,500,5);
                // } else
                // {
                //     blink(2000,10,1);
                // }
                // printf("%u\n", ts);
                // printf("%s", asctime(localtime((time_t*) &ts)));
                printf("local: %lld\treceived:%llu\tdiff:%lld\n", ts_millis, ts, diff);
                printf("correction:%llu\n", correction_ms);


                FILE* f = fopen(filepath, "a");
                if (f == NULL) {
                    ESP_LOGE(TAG, "Failed to open file for writing");
                    return;
                }
                fprintf(f, "%lld,%llu,%lld,%llu,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n", ts_millis, ts, ts_millis - (int64_t) ts, correction_ms,
                    header_duration0,header_duration1,
                    high_min,high_max,low_short_min,low_short_max,low_long_min,low_long_max,
                    high/count_high, low_short/count_low_short, low_long/count_low_long);
                fclose(f);

                // printf("zero_duration0_min: %d\n", zero_duration0_min-448);
                // printf("zero_duration0_max: %d\n", zero_duration0_max-448);
                // printf("zero_duration1_min: %d\n", zero_duration1_min-448);
                // printf("zero_duration1_max: %d\n", zero_duration1_max-448);
                // printf("one_duration0_min: %d\n", one_duration0_min-448);
                // printf("one_duration0_max: %d\n", one_duration0_max-448);
                // printf("one_duration1_min: %d\n", one_duration1_min-1352);
                // printf("one_duration1_max: %d\n", one_duration1_max-1352);
            }
            vRingbufferReturnItem(rb, (void*) item);
        }
    }
}
