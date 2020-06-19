#include "DS1302.h"

/**
 * @brief SPI initialisation. Configure 3 wire mode for DS1302
 *
 * @param spi SPI device handle
 */
void spi_init(spi_device_handle_t* spi)
{
    spi_bus_config_t busconfig = {
        .mosi_io_num = PIN_NUM_MOSI,
        .miso_io_num = -1,              //half-duplex mode
        .sclk_io_num = PIN_NUM_CLK,
        .quadwp_io_num = -1,
        .quadhd_io_num = -1,
        .max_transfer_sz=9
    };
    spi_device_interface_config_t deviceconfig = {
        .mode = 0,          //CPOL=0, CPHA=0
        .cs_ena_pretrans = 1,
        .cs_ena_posttrans = 1,
        .clock_speed_hz = 400000, //400 kHz
        .input_delay_ns = 0,
        .spics_io_num = PIN_NUM_CS,
        .flags = (SPI_DEVICE_3WIRE | SPI_DEVICE_HALFDUPLEX | SPI_DEVICE_BIT_LSBFIRST | SPI_DEVICE_POSITIVE_CS),
        .queue_size=1

    };
    ESP_ERROR_CHECK(spi_bus_initialize(VSPI_HOST, &busconfig, 0));  //DMA not supported in half-duplex mode
    ESP_ERROR_CHECK(spi_bus_add_device(VSPI_HOST, &deviceconfig, spi));
}

uint8_t  decimalToBCD (int decimal)
{
   return (uint8_t) (((decimal/10) << 4) | (decimal % 10));
}

int BCDToDecimal(uint8_t BCD)
{
   return (int) (((BCD>>4)*10) + (BCD & 0xF));
}

void DS1302_write_protect(spi_device_handle_t* spi, bool write_protect)
{
    uint8_t spi_tx[2];
    spi_tx[0] = 0b10001110;     //write protect register
    spi_tx[1] = write_protect ? 0b10000000 : 0b00000000;

    spi_transaction_t t;
    memset(&t, 0, sizeof(t));       //Zero out the transaction
    t.length = 2*8;
    t.tx_buffer = &spi_tx;
    ESP_ERROR_CHECK(spi_device_polling_transmit(*spi, &t));
}


void DS1302_set_time(spi_device_handle_t* spi, struct tm ts)
{
    //date units in BCD
    uint8_t spi_tx[9];
    spi_tx[0] = 0b10111110;     //select calendar, burst mode, write
    spi_tx[1] = decimalToBCD(ts.tm_sec);     //clock halt (1 bit) - 10 seconds (3 bits) - seconds (4 bits)
    spi_tx[2] = decimalToBCD(ts.tm_min);     //0 - 10 minutes (3 bits) - minutes (4 bits)
    spi_tx[3] = decimalToBCD(ts.tm_hour);     //000 - 10 hour (2 bits) - hour (4 bits)
    spi_tx[4] = decimalToBCD(ts.tm_mday);     //00 - 10 date (2 bits) - date (1-31) (4 bits)
    spi_tx[5] = decimalToBCD(ts.tm_mon + 1);     //000 - 10 month (1 bit) - month (1-12) (4 bits)
    spi_tx[6] = decimalToBCD(ts.tm_wday + 1);     //00000 - day of week, starting with Sunday (1-7) (3 bits)
    spi_tx[7] = decimalToBCD(ts.tm_year + 1900 - 2000);     //10 year (4 bits) - year (4 bits)
    spi_tx[8] = 0b00000000;     //no write protect

    spi_transaction_t t;
    memset(&t, 0, sizeof(t));       //Zero out the transaction
    t.length = 9*8;
    t.tx_buffer = &spi_tx;
    ESP_ERROR_CHECK(spi_device_polling_transmit(*spi, &t));
}

struct tm DS1302_get_time(spi_device_handle_t* spi)
{
    uint8_t spi_rx[8];
    uint8_t spi_cmd = 0b10111111;     //select calendar, read burst mode
    spi_transaction_t t;
    memset(&t, 0, sizeof(t));       //Zero out the transaction
    t.length = 9*8;
    t.rxlength = 8*8;
    t.tx_buffer = &spi_cmd;
    t.rx_buffer = &spi_rx;
    ESP_ERROR_CHECK(spi_device_polling_transmit(*spi, &t));

    struct tm ts;
    ts.tm_sec   = BCDToDecimal(spi_rx[0] & 0x7F);
    ts.tm_min   = BCDToDecimal(spi_rx[1] & 0x7F);
    ts.tm_hour  = BCDToDecimal(spi_rx[2] & 0x3F);
    ts.tm_mday  = BCDToDecimal(spi_rx[3] & 0x3F);
    ts.tm_mon   = BCDToDecimal(spi_rx[4] & 0x1F) - 1;
    ts.tm_wday  = BCDToDecimal(spi_rx[5] & 0x7) - 1;        //days since Sunday: 0-6
    ts.tm_year  = BCDToDecimal(spi_rx[6]) + 2000 - 1900;

    return ts;
}
