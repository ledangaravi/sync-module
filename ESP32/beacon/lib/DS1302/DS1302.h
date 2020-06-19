#ifndef _DS1302_H_
#define _DS1302_H_

#include <time.h>
#include <string.h>
#include "esp_err.h"
// #include "esp_system.h"
#include "driver/spi_master.h"
#include "driver/gpio.h"

#define PIN_NUM_MOSI GPIO_NUM_23
#define PIN_NUM_CLK  GPIO_NUM_18
#define PIN_NUM_CS   GPIO_NUM_5

#ifdef __cplusplus
extern "C" {
#endif

void spi_init(spi_device_handle_t* spi);
uint8_t  decimalToBCD (int decimal);
int BCDToDecimal(uint8_t BCD);
void DS1302_write_protect(spi_device_handle_t* spi, bool write_protect);
void DS1302_set_time(spi_device_handle_t* spi, struct tm ts);
struct tm DS1302_get_time(spi_device_handle_t* spi);


#ifdef __cplusplus
}
#endif

#endif  /* _DS1302_H_ */