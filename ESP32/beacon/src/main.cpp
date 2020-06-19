#include "PCA9632.h"
#include "DS1302.h"
#include "led_tx.h"
// #include "my_ntp.h"

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"
#include "driver/adc.h"
#include "driver/spi_master.h"
#include "driver/rtc_io.h"
#include "esp32/rom/uart.h"
#include "esp_adc_cal.h"
#include "esp_sleep.h"

#define LED_CAM      GPIO_NUM_2
#define LED_CAM_MID  GPIO_NUM_4
#define LED_CAM_MAX  GPIO_NUM_19

#define LED_IR_EN       GPIO_NUM_33
#define LED_IR          GPIO_NUM_27
#define LED_IR_MID      GPIO_NUM_26
#define LED_IR_MAX      GPIO_NUM_25

#define ADC_DEFAULT_VREF    1100
#define ADC_NO_OF_SAMPLES   64

// static const adc_unit_t adc_unit = ADC_UNIT_1;
static const adc1_channel_t adc_channel = ADC1_CHANNEL_7;     //GPIO35 if ADC1
// static const adc_atten_t adc_atten = ADC_ATTEN_DB_11;
static esp_adc_cal_characteristics_t *adc_chars;

spi_device_handle_t spi;

void gpio_led_init()
{
    gpio_pad_select_gpio(LED_CAM_MID);
    gpio_set_direction(LED_CAM_MID, GPIO_MODE_OUTPUT);
    gpio_pad_select_gpio(LED_CAM_MAX);
    gpio_set_direction(LED_CAM_MAX, GPIO_MODE_OUTPUT);

    gpio_pad_select_gpio(LED_IR_EN);
    gpio_set_direction(LED_IR_EN, GPIO_MODE_OUTPUT);
    gpio_pad_select_gpio(LED_IR_MID);
    gpio_set_direction(LED_IR_MID, GPIO_MODE_OUTPUT);
    gpio_pad_select_gpio(LED_IR_MAX);
    gpio_set_direction(LED_IR_MAX, GPIO_MODE_OUTPUT);
}

void adc_init()
{
    adc1_config_width(ADC_WIDTH_BIT_12);
    adc1_config_channel_atten(adc_channel, ADC_ATTEN_DB_11);
    esp_adc_cal_characterize(ADC_UNIT_1, ADC_ATTEN_DB_11, ADC_WIDTH_BIT_12, ADC_DEFAULT_VREF, adc_chars);
}

uint32_t get_battery_voltage_mV()
{
    uint32_t adc_reading = 0;
    for (int i = 0; i < ADC_NO_OF_SAMPLES; i++)
    {
        adc_reading += adc1_get_raw(adc_channel);
    }
    adc_reading /= ADC_NO_OF_SAMPLES;
    //Convert adc_reading to voltage in mV
    uint32_t voltage_mV = esp_adc_cal_raw_to_voltage(adc_reading, adc_chars);
    //adjust for potential divider
    voltage_mV = voltage_mV * 416 / 100;
    return voltage_mV;
}


extern "C" void app_main()
{
    gpio_led_init();

    //Characterize ADC
    adc_chars = (esp_adc_cal_characteristics_t*) calloc(1, sizeof(esp_adc_cal_characteristics_t));
    adc_init();

    ESP_ERROR_CHECK(i2c_master_init());
    PCA9632_init();

    spi_init(&spi);

    nec_tx_init();
    cam_tx_init();

    struct tm ts = DS1302_get_time(&spi);




    gpio_set_level(LED_CAM_MID, 1);
    gpio_set_level(LED_CAM_MAX, 0);

    gpio_set_level(LED_IR_MID, 0);
    gpio_set_level(LED_IR_MAX, 1);
    gpio_set_level(LED_IR_EN, 1);




    while (1) {

        // cam_tx_unix_time(0);
        nec_tx_unix_time(0);


        // PCA9632_init();
        // PCA9632_RGB(0, 255, 0, 0.01);
        // PCA9632_blink(.99, 10);
        // vTaskDelay(pdMS_TO_TICKS(20000));

        // PCA9632_RGB(0, 0, 255, 0.01);
        // PCA9632_blink(.99, 10);

        // esp_sleep_enable_timer_wakeup(20000000);
        // esp_light_sleep_start();


        // PCA9632_off();
        // esp_sleep_enable_timer_wakeup(20000000);
        // esp_deep_sleep_start();




    }
}


