// code adapted from https://github.com/espressif/esp-idf/blob/release/v4.0/examples/peripherals/rmt_nec_tx_rx/main/infrared_nec_main.c
#ifndef _LED_TX_H_
#define _LED_TX_H_

#include <string.h>
#include "esp_err.h"
#include "esp_log.h"
#include "driver/rmt.h"
#include "driver/gpio.h"

#define RMT_NEC_TX_CHANNEL    RMT_CHANNEL_0                 /*!< RMT channel for transmitter */
#define RMT_CAM_TX_CHANNEL    RMT_CHANNEL_1                 /*!< RMT channel for transmitter */
#define RMT_NEC_TX_GPIO_NUM   GPIO_NUM_27                   /*!< GPIO number for transmitter signal */
#define RMT_CAM_TX_GPIO_NUM   GPIO_NUM_2                    /*!< GPIO number for transmitter signal */
#define RMT_CLK_DIV      250                                /*!< RMT counter clock divider */
#define RMT_TICK_100_US    (80000000/RMT_CLK_DIV/10000)     /*!< RMT counter value for 10 us.(Source clock is APB clock) */

#define NEC_HEADER_HIGH_US    9000                          /*!< NEC protocol header: positive 9ms */
#define NEC_HEADER_LOW_US     4500                          /*!< NEC protocol header: negative 4.5ms*/
#define NEC_BIT_ONE_HIGH_US    560                          /*!< NEC protocol data bit 1: positive 0.56ms */
#define NEC_BIT_ONE_LOW_US    (2250-NEC_BIT_ONE_HIGH_US)    /*!< NEC protocol data bit 1: negative 1.69ms */
#define NEC_BIT_ZERO_HIGH_US   560                          /*!< NEC protocol data bit 0: positive 0.56ms */
#define NEC_BIT_ZERO_LOW_US   (1120-NEC_BIT_ZERO_HIGH_US)   /*!< NEC protocol data bit 0: negative 0.56ms */
#define NEC_BIT_END            560                          /*!< NEC protocol end: positive 0.56ms */

#define CAM_BIT_ONE_HIGH_US   100000    //100ms
#define CAM_BIT_ONE_LOW_US    200000    //200ms
#define CAM_BIT_ZERO_HIGH_US  100000    //100ms
#define CAM_BIT_ZERO_LOW_US   100000    //100ms
#define CAM_BIT_END           100000    //100ms

#define NEC_DATA_ITEM_NUM   64  /*!< NEC code item number: header + 62bit data + end */ //62 data bits due to ringbuffer size limit in receiver
#define CAM_DATA_ITEM_NUM   129  /*!< CAM code item number: 2*64bit data + end */


#ifdef __cplusplus
extern "C" {
#endif

/*
 * @brief Build register value of waveform for NEC one data bit
 */
inline void nec_fill_item_level(rmt_item32_t* item, uint32_t high_us, uint32_t low_us);
inline void cam_fill_item_level(rmt_item32_t* item, uint32_t duration_us, uint32_t level);

/*
 * @brief Generate NEC header value: active 9ms + negative 4.5ms
 */
void nec_fill_item_header(rmt_item32_t* item);

/*
 * @brief Generate NEC data bit 1: positive 0.56ms + negative 1.69ms
 */
void nec_fill_item_bit_one(rmt_item32_t* item);

/*
 * @brief Generate NEC data bit 0: positive 0.56ms + negative 0.56ms
 */
void nec_fill_item_bit_zero(rmt_item32_t* item);

/*
 * @brief Generate NEC end signal: positive 0.56ms
 */
void nec_fill_item_end(rmt_item32_t* item);

/*
 * @brief RMT transmitter initialization
 */
void nec_tx_init();
void cam_tx_init();

void nec_tx_unix_time(uint64_t ts);
void cam_tx_unix_time(uint64_t ts);

#ifdef __cplusplus
}
#endif

#endif  /* _LED_TX_H_ */