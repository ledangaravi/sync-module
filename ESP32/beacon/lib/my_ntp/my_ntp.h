// code adapted from https://github.com/espressif/esp-idf/blob/release/v3.2/examples/protocols/sntp/main/sntp_example_main.c
#ifndef _MY_NTP_H_
#define _MY_NTP_H_

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
#include "nvs_flash.h"

#include "lwip/err.h"
#include "lwip/apps/sntp.h"


#define EXAMPLE_WIFI_SSID "WIFI_SSID"
#define EXAMPLE_WIFI_PASS "WIFI_PASS"


#ifdef __cplusplus
extern "C" {
#endif


/* FreeRTOS event group to signal when we are connected & ready to make a request */
EventGroupHandle_t wifi_event_group;

/* The event group allows multiple bits for each event,
   but we only care about one event - are we connected
   to the AP with an IP? */
const int CONNECTED_BIT = BIT0;

static const char *TAG_NTP = "ntp";


void obtain_time(void);
void initialize_sntp(void);
void initialise_wifi(void);
esp_err_t event_handler(void *ctx, system_event_t *event);


#ifdef __cplusplus
}
#endif

#endif  /* _MY_NTP_H_ */