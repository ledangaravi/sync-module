// code adapted from https://github.com/espressif/esp-idf/blob/release/v4.0/examples/peripherals/rmt_nec_tx_rx/main/infrared_nec_main.c
#include "led_tx.h"


/*
 * @brief Build register value of waveform for NEC one data bit
 */
inline void nec_fill_item_level(rmt_item32_t* item, uint32_t high_us, uint32_t low_us)
{
    item->level0 = 1;
    item->duration0 = (high_us) * RMT_TICK_100_US / 100;
    item->level1 = 0;
    item->duration1 = (low_us) * RMT_TICK_100_US / 100;
}

inline void cam_fill_item_level(rmt_item32_t* item, uint32_t duration_us, uint32_t level)
{
    item->level0 = level;
    item->duration0 = duration_us / 2 * RMT_TICK_100_US / 100;
    item->level1 = level;
    item->duration1 = duration_us / 2 * RMT_TICK_100_US / 100;
}

/*
 * @brief Generate NEC header value: active 9ms + negative 4.5ms
 */
void nec_fill_item_header(rmt_item32_t* item)
{
    nec_fill_item_level(item, NEC_HEADER_HIGH_US, NEC_HEADER_LOW_US);
}

/*
 * @brief Generate NEC data bit 1: positive 0.56ms + negative 1.69ms
 */
void nec_fill_item_bit_one(rmt_item32_t* item)
{
    nec_fill_item_level(item, NEC_BIT_ONE_HIGH_US, NEC_BIT_ONE_LOW_US);
}

/*
 * @brief Generate NEC data bit 0: positive 0.56ms + negative 0.56ms
 */
void nec_fill_item_bit_zero(rmt_item32_t* item)
{
    nec_fill_item_level(item, NEC_BIT_ZERO_HIGH_US, NEC_BIT_ZERO_LOW_US);
}

/*
 * @brief Generate NEC end signal: positive 0.56ms
 */
void nec_fill_item_end(rmt_item32_t* item)
{
    nec_fill_item_level(item, NEC_BIT_END, 0x7fff);
}

/*
 * @brief RMT transmitter initialization
 */
void nec_tx_init()
{
    rmt_config_t rmt_tx;
    rmt_tx.channel = RMT_NEC_TX_CHANNEL;
    rmt_tx.gpio_num = RMT_NEC_TX_GPIO_NUM;
    rmt_tx.mem_block_num = 1;
    rmt_tx.clk_div = RMT_CLK_DIV;
    rmt_tx.tx_config.loop_en = false;
    rmt_tx.tx_config.carrier_duty_percent = 50;
    rmt_tx.tx_config.carrier_freq_hz = 38000;
    rmt_tx.tx_config.carrier_level = 1;
    rmt_tx.tx_config.carrier_en = true;
    rmt_tx.tx_config.idle_level = 0;
    rmt_tx.tx_config.idle_output_en = true;
    rmt_tx.rmt_mode = RMT_MODE_TX;
    rmt_config(&rmt_tx);
    rmt_driver_install(rmt_tx.channel, 0, 0);
}

void cam_tx_init()
{
    rmt_config_t rmt_tx;
    rmt_tx.channel = RMT_CAM_TX_CHANNEL;
    rmt_tx.gpio_num = RMT_CAM_TX_GPIO_NUM;
    rmt_tx.mem_block_num = 1;
    rmt_tx.clk_div = RMT_CLK_DIV;
    rmt_tx.tx_config.loop_en = false;
    rmt_tx.tx_config.carrier_en = false;
    rmt_tx.tx_config.idle_level = 0;
    rmt_tx.tx_config.idle_output_en = true;
    rmt_tx.rmt_mode = RMT_MODE_TX;
    rmt_config(&rmt_tx);
    rmt_driver_install(rmt_tx.channel, 0, 0);
}

void nec_tx_unix_time(uint64_t ts)
{
    rmt_item32_t items[NEC_DATA_ITEM_NUM];
    nec_fill_item_header(&items[0]);
    for (int i = 1; i < NEC_DATA_ITEM_NUM-1; i++)
    {
        if (ts & 1)
        {
            nec_fill_item_bit_one(&items[i]);
        } else
        {
            nec_fill_item_bit_zero(&items[i]);
        }
        ts >>= 1;
    }
    nec_fill_item_end(&items[NEC_DATA_ITEM_NUM-1]);

    //Send data according to the waveform items.
    rmt_write_items(RMT_NEC_TX_CHANNEL, &items[0], NEC_DATA_ITEM_NUM, true);
    //Wait until sending is done.
    rmt_wait_tx_done(RMT_NEC_TX_CHANNEL, portMAX_DELAY);
}


void cam_tx_unix_time(uint64_t ts)
{
    rmt_item32_t items[CAM_DATA_ITEM_NUM];
    for (int i = 0; i < CAM_DATA_ITEM_NUM-1; i+=2)
    {
        if (ts & 1)
        {
            cam_fill_item_level(&items[i], CAM_BIT_ONE_HIGH_US, 1);
            cam_fill_item_level(&items[i+1], CAM_BIT_ONE_LOW_US, 0);
        } else
        {
            cam_fill_item_level(&items[i], CAM_BIT_ZERO_HIGH_US, 1);
            cam_fill_item_level(&items[i+1], CAM_BIT_ZERO_LOW_US, 0);
        }
        ts >>= 1;
    }
    cam_fill_item_level(&items[CAM_DATA_ITEM_NUM-1], CAM_BIT_END, 1);

    //Send data according to the waveform items.
    rmt_write_items(RMT_CAM_TX_CHANNEL, &items[0], CAM_DATA_ITEM_NUM, true);
    //Wait until sending is done.
    rmt_wait_tx_done(RMT_CAM_TX_CHANNEL, portMAX_DELAY);
}
