#ifndef _PCA9632_H_
#define _PCA9632_H_

#include "esp_err.h"
#include "driver/gpio.h"
#include "driver/i2c.h"

#define I2C_MASTER_SCL_IO GPIO_NUM_22               /*!< gpio number for I2C master clock */
#define I2C_MASTER_SDA_IO GPIO_NUM_21               /*!< gpio number for I2C master data  */
#define I2C_MASTER_NUM I2C_NUM_0                    /*!< I2C port number for master dev */
#define I2C_MASTER_FREQ_HZ 100000                   /*!< I2C master clock frequency */
#define I2C_MASTER_TX_BUF_DISABLE 0                 /*!< I2C master doesn't need buffer */
#define I2C_MASTER_RX_BUF_DISABLE 0                 /*!< I2C master doesn't need buffer */
#define I2C_TIMEOUT (1000 / portTICK_RATE_MS)
#define I2C_ACK_CHECK_EN 0x1                        /*!< I2C master will check ack from slave*/
#define I2C_ACK_CHECK_DIS 0x0                       /*!< I2C master will not check ack from slave */

#define PCA9632_ADDR 0x62   //1100010(R/W)


#ifdef __cplusplus
extern "C" {
#endif

esp_err_t i2c_write(uint8_t addr, uint8_t *data_wr, size_t size);
esp_err_t i2c_master_init();
void PCA9632_init();
void PCA9632_off();
void PCA9632_blink(float duty_cycle, float period);
void PCA9632_RGB(uint8_t r, uint8_t g, uint8_t b, float brightness);


#ifdef __cplusplus
}
#endif

#endif  /* _PCA9632_H_ */