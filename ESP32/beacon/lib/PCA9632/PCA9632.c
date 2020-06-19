#include "PCA9632.h"

/**
 * @brief I2C write
 *
 * ___________________________________________________________________
 * | start | slave_addr + wr_bit + ack | write n bytes + ack  | stop |
 * --------|---------------------------|----------------------|------|
 *
 * @param addr slave device adress
 * @param data_wr pointer to data buffer
 * @param size number of bytes to send
 *
 * @return
 *     - ESP_OK Success
 *     - ESP_ERR_INVALID_ARG Parameter error
 *     - ESP_FAIL Sending command error, slave doesn't ACK the transfer.
 *     - ESP_ERR_INVALID_STATE I2C driver not installed or not in master mode.
 *     - ESP_ERR_TIMEOUT Operation timeout because the bus is busy.
 */
esp_err_t i2c_write(uint8_t addr, uint8_t *data_wr, size_t size)
{
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (addr << 1) | I2C_MASTER_WRITE, I2C_ACK_CHECK_EN);
    i2c_master_write(cmd, data_wr, size, I2C_ACK_CHECK_EN);
    i2c_master_stop(cmd);
    esp_err_t ret = i2c_master_cmd_begin(I2C_MASTER_NUM, cmd, I2C_TIMEOUT);
    i2c_cmd_link_delete(cmd);
    return ret;
}

/**
 * @brief i2c master initialization
 */
esp_err_t i2c_master_init()
{
    i2c_config_t conf;
    conf.mode = I2C_MODE_MASTER;
    conf.sda_io_num = I2C_MASTER_SDA_IO;
    conf.sda_pullup_en = GPIO_PULLUP_ENABLE;
    conf.scl_io_num = I2C_MASTER_SCL_IO;
    conf.scl_pullup_en = GPIO_PULLUP_ENABLE;
    conf.master.clk_speed = I2C_MASTER_FREQ_HZ;
    i2c_param_config(I2C_MASTER_NUM, &conf);
    return i2c_driver_install(I2C_MASTER_NUM, conf.mode,
                              I2C_MASTER_RX_BUF_DISABLE,
                              I2C_MASTER_TX_BUF_DISABLE, 0);
}

void PCA9632_init()
{
    uint8_t i2c_tx_buffer[10];
    i2c_tx_buffer[0] = 0b10000000;  //auto-increment all from beginning
    i2c_tx_buffer[1] = 0b00000000;  //MODE1 - enable normal mode (should wait 500 us)
    i2c_tx_buffer[2] = 0b00100001;  //MODE2 - group control blinking
    i2c_tx_buffer[3] = 0b00000000;  //PWM0 - R
    i2c_tx_buffer[4] = 0b00000000;  //PWM1 - G
    i2c_tx_buffer[5] = 0b00000000;  //PWM2 - B
    i2c_tx_buffer[6] = 0b00000000;  //PWM3 - unused
    i2c_tx_buffer[7] = 0b10000000;  //GRPPWM
    i2c_tx_buffer[8] = 0b00110111;  //GRPFREQ - period = (GFRQ[7:0] + 1) / 24 seconds
    i2c_tx_buffer[9] = 0b00111111;  //LEDOUT - individual mode
    ESP_ERROR_CHECK(i2c_write(PCA9632_ADDR, i2c_tx_buffer, sizeof(i2c_tx_buffer) / sizeof(i2c_tx_buffer[0])));
    return;
}

/**
 * @brief Turn off status LED and put PCA9632 in sleep mode
 */
void PCA9632_off()
{
    uint8_t i2c_tx_buffer[2];
    i2c_tx_buffer[0] = 0b00001000;  //auto-increment off - set LEDOUT
    i2c_tx_buffer[1] = 0b00000000;  //LEDOUT - all LEDs off
    ESP_ERROR_CHECK(i2c_write(PCA9632_ADDR, i2c_tx_buffer, sizeof(i2c_tx_buffer) / sizeof(i2c_tx_buffer[0])));
    i2c_tx_buffer[0] = 0b00000000;  //auto-increment off - set MODE1
    i2c_tx_buffer[1] = 0b00010000;  //MODE1 - enter sleep mode
    ESP_ERROR_CHECK(i2c_write(PCA9632_ADDR, i2c_tx_buffer, sizeof(i2c_tx_buffer) / sizeof(i2c_tx_buffer[0])));
    return;
}


void PCA9632_blink(float duty_cycle, float period)
{
    uint8_t grppwm = 255 * duty_cycle;
    uint8_t grpfreq = period * 24 - 1;
    uint8_t i2c_tx_buffer[3];
    i2c_tx_buffer[0] = 0b11000110;  //auto-increment for global control registers only
    i2c_tx_buffer[1] = grppwm;      //GRPPWM
    i2c_tx_buffer[2] = grpfreq;     //GRPFREQ:  period = (GFRQ[7:0] + 1) / 24 seconds
    ESP_ERROR_CHECK(i2c_write(PCA9632_ADDR, i2c_tx_buffer, sizeof(i2c_tx_buffer) / sizeof(i2c_tx_buffer[0])));
    return;
}

/**
 * @brief   Set RGB value for status led.
 *          Values are scaled by the brightness argument
 *
 * @param r Red value 0-255
 * @param g Green value 0-255
 * @param b Blue value 0-255
 * @param brightness scaling factor 0-1
 *
 */
void PCA9632_RGB(uint8_t r, uint8_t g, uint8_t b, float brightness)
{
    r *= brightness;
    g *= brightness;
    b *= brightness;
    uint8_t i2c_tx_buffer[4];
    i2c_tx_buffer[0] = 0b10100010;  //auto-increment for individual brightness registers only, start from PWM0
    i2c_tx_buffer[1] = r;  //PWM0 - R
    i2c_tx_buffer[2] = g;  //PWM1 - G
    i2c_tx_buffer[3] = b;  //PWM2 - B
    ESP_ERROR_CHECK(i2c_write(PCA9632_ADDR, i2c_tx_buffer, sizeof(i2c_tx_buffer) / sizeof(i2c_tx_buffer[0])));
    return;
}
