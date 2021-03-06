EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:USB_C_Receptacle_USB2.0 J3
U 1 1 5E8076A8
P 1400 5000
F 0 "J3" H 1507 5867 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 1300 5750 50  0000 C CNN
F 2 "my_library:USB_C_Receptacle_HIROSE_CX90M-16P" H 1550 5000 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1550 5000 50  0001 C CNN
	1    1400 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D9
U 1 1 5E82DC8E
P 2700 4400
F 0 "D9" H 2700 4184 50  0000 C CNN
F 1 "B540C-13-F" H 2700 4275 50  0000 C CNN
F 2 "Diode_SMD:D_SMC" H 2700 4400 50  0001 C CNN
F 3 "~" H 2700 4400 50  0001 C CNN
	1    2700 4400
	-1   0    0    1   
$EndComp
$Comp
L Device:D_TVS D8
U 1 1 5E830076
P 2300 5550
F 0 "D8" V 2254 5629 50  0000 L CNN
F 1 "GG0402052R542P" H 2000 5450 50  0000 L CNN
F 2 "Diode_SMD:D_0402_1005Metric" H 2300 5550 50  0001 C CNN
F 3 "~" H 2300 5550 50  0001 C CNN
	1    2300 5550
	0    1    1    0   
$EndComp
$Comp
L Device:D_TVS D10
U 1 1 5E8323AC
P 2700 5550
F 0 "D10" V 2654 5629 50  0000 L CNN
F 1 "GG0402052R542P" H 2400 5450 50  0000 L CNN
F 2 "Diode_SMD:D_0402_1005Metric" H 2700 5550 50  0001 C CNN
F 3 "~" H 2700 5550 50  0001 C CNN
	1    2700 5550
	0    1    1    0   
$EndComp
$Comp
L Device:D_TVS D11
U 1 1 5E832BD7
P 3150 5550
F 0 "D11" V 3104 5629 50  0000 L CNN
F 1 "GG0402052R542P" H 2850 5450 50  0000 L CNN
F 2 "Diode_SMD:D_0402_1005Metric" H 3150 5550 50  0001 C CNN
F 3 "~" H 3150 5550 50  0001 C CNN
	1    3150 5550
	0    1    1    0   
$EndComp
NoConn ~ 2000 5500
NoConn ~ 2000 5600
Wire Wire Line
	2000 5000 2000 4950
Connection ~ 2000 4950
Wire Wire Line
	2000 4950 2000 4900
Wire Wire Line
	2850 4400 3250 4400
Wire Wire Line
	2000 5100 2000 5150
Wire Wire Line
	2000 5150 3150 5150
Connection ~ 2000 5150
Wire Wire Line
	2000 5150 2000 5200
Wire Wire Line
	3150 5400 3150 5150
Connection ~ 3150 5150
Wire Wire Line
	3150 5150 3200 5150
Wire Wire Line
	1400 5900 1400 6000
Wire Wire Line
	1400 6000 2000 6000
Wire Wire Line
	3150 6000 3150 5700
Wire Wire Line
	2700 5700 2700 6000
Connection ~ 2700 6000
Wire Wire Line
	2700 6000 3150 6000
Wire Wire Line
	2300 5700 2300 6000
Connection ~ 2300 6000
Wire Wire Line
	2300 6000 2700 6000
$Comp
L power:GND #PWR054
U 1 1 5E8DA2AA
P 2000 6000
F 0 "#PWR054" H 2000 5750 50  0001 C CNN
F 1 "GND" H 2005 5827 50  0000 C CNN
F 2 "" H 2000 6000 50  0001 C CNN
F 3 "" H 2000 6000 50  0001 C CNN
	1    2000 6000
	1    0    0    -1  
$EndComp
Connection ~ 2000 6000
Wire Wire Line
	2000 6000 2300 6000
Text Label 3200 5150 0    50   ~ 0
USB_DP
Text Label 3200 4950 0    50   ~ 0
USB_DM
Wire Wire Line
	1100 5900 1100 6000
Wire Wire Line
	1100 6000 1400 6000
Connection ~ 1400 6000
$Comp
L Device:R R30
U 1 1 5E68FA0F
P 3750 5050
F 0 "R30" H 3820 5096 50  0000 L CNN
F 1 "5.1k" H 3820 5005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3680 5050 50  0001 C CNN
F 3 "~" H 3750 5050 50  0001 C CNN
	1    3750 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R31
U 1 1 5E6906A1
P 4050 5050
F 0 "R31" H 4120 5096 50  0000 L CNN
F 1 "5.1k" H 4120 5005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3980 5050 50  0001 C CNN
F 3 "~" H 4050 5050 50  0001 C CNN
	1    4050 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR060
U 1 1 5E69155D
P 3750 5300
F 0 "#PWR060" H 3750 5050 50  0001 C CNN
F 1 "GND" H 3755 5127 50  0000 C CNN
F 2 "" H 3750 5300 50  0001 C CNN
F 3 "" H 3750 5300 50  0001 C CNN
	1    3750 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR061
U 1 1 5E6925AB
P 4050 5300
F 0 "#PWR061" H 4050 5050 50  0001 C CNN
F 1 "GND" H 4055 5127 50  0000 C CNN
F 2 "" H 4050 5300 50  0001 C CNN
F 3 "" H 4050 5300 50  0001 C CNN
	1    4050 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 5300 3750 5200
Wire Wire Line
	4050 5300 4050 5200
Wire Wire Line
	3750 4900 3750 4700
Wire Wire Line
	3750 4700 2000 4700
Wire Wire Line
	2000 4600 4050 4600
Wire Wire Line
	4050 4600 4050 4900
$Comp
L Device:R R1
U 1 1 5ED901F2
P 6500 1850
F 0 "R1" H 6570 1896 50  0000 L CNN
F 1 "10k" H 6570 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6430 1850 50  0001 C CNN
F 3 "~" H 6500 1850 50  0001 C CNN
	1    6500 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5ED92975
P 6900 1850
F 0 "R2" H 6970 1896 50  0000 L CNN
F 1 "10k" H 6970 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6830 1850 50  0001 C CNN
F 3 "~" H 6900 1850 50  0001 C CNN
	1    6900 1850
	1    0    0    -1  
$EndComp
Text Label 6500 2000 0    50   ~ 0
I2C_SDA
Text Label 6900 2000 0    50   ~ 0
I2C_SCL
$Comp
L power:+5V_USB #PWR059
U 1 1 5E7F0E7C
P 3700 4400
F 0 "#PWR059" H 3700 4250 50  0001 C CNN
F 1 "+5V_USB" H 3715 4573 50  0000 C CNN
F 2 "" H 3700 4400 50  0001 C CNN
F 3 "" H 3700 4400 50  0001 C CNN
	1    3700 4400
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:ESP32-WROVER-IB__16MB_ IC1
U 1 1 5EAD601F
P 3250 1600
F 0 "IC1" H 3950 1865 50  0000 C CNN
F 1 "ESP32-WROVER-IB__16MB_" H 3950 1774 50  0000 C CNN
F 2 "SamacSys_Parts:ESP32WROVERIB16MB" H 4500 1700 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/ESP32-WROVER-IB (16MB).pdf" H 4500 1600 50  0001 L CNN
F 4 "WiFi Modules (802.11) SMD MODULE, 3.3VESP32-DOWD, 16Mb Flash, EXT IPEX ANT; M213DH2864UC3Q0" H 4500 1500 50  0001 L CNN "Description"
F 5 "3.4" H 4500 1400 50  0001 L CNN "Height"
F 6 "356-ESP32WROIB(16MB)" H 4500 1300 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=356-ESP32WROIB%2816MB%29" H 4500 1200 50  0001 L CNN "Mouser Price/Stock"
F 8 "Espressif Systems" H 4500 1100 50  0001 L CNN "Manufacturer_Name"
F 9 "ESP32-WROVER-IB (16MB)" H 4500 1000 50  0001 L CNN "Manufacturer_Part_Number"
	1    3250 1600
	1    0    0    -1  
$EndComp
NoConn ~ 3250 3200
NoConn ~ 3250 3300
NoConn ~ 3250 3400
NoConn ~ 3250 3500
NoConn ~ 4650 1600
NoConn ~ 4650 1700
NoConn ~ 4650 2200
NoConn ~ 4650 2300
NoConn ~ 4650 2700
Text Label 3250 1800 2    50   ~ 0
ESP_EN
$Comp
L Device:C C2
U 1 1 5EDAEB35
P 1350 1900
F 0 "C2" H 1465 1946 50  0000 L CNN
F 1 "100nF" H 1465 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1388 1750 50  0001 C CNN
F 3 "~" H 1350 1900 50  0001 C CNN
	1    1350 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5EDB0493
P 950 1900
F 0 "C1" H 1065 1946 50  0000 L CNN
F 1 "22uF" H 1065 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 988 1750 50  0001 C CNN
F 3 "~" H 950 1900 50  0001 C CNN
	1    950  1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1750 950  1700
Wire Wire Line
	950  1700 1350 1700
Wire Wire Line
	1350 1750 1350 1700
Connection ~ 1350 1700
$Comp
L power:GND #PWR04
U 1 1 5EE46A6E
P 950 2150
F 0 "#PWR04" H 950 1900 50  0001 C CNN
F 1 "GND" H 955 1977 50  0000 C CNN
F 2 "" H 950 2150 50  0001 C CNN
F 3 "" H 950 2150 50  0001 C CNN
	1    950  2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5EE483D3
P 1350 2150
F 0 "#PWR05" H 1350 1900 50  0001 C CNN
F 1 "GND" H 1355 1977 50  0000 C CNN
F 2 "" H 1350 2150 50  0001 C CNN
F 3 "" H 1350 2150 50  0001 C CNN
	1    1350 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5EE49827
P 4750 3500
F 0 "#PWR08" H 4750 3250 50  0001 C CNN
F 1 "GND" H 4755 3327 50  0000 C CNN
F 2 "" H 4750 3500 50  0001 C CNN
F 3 "" H 4750 3500 50  0001 C CNN
	1    4750 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5EE4C87B
P 3150 1600
F 0 "#PWR07" H 3150 1350 50  0001 C CNN
F 1 "GND" V 3155 1472 50  0000 R CNN
F 2 "" H 3150 1600 50  0001 C CNN
F 3 "" H 3150 1600 50  0001 C CNN
	1    3150 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 1600 3250 1600
Wire Wire Line
	1350 2150 1350 2050
Wire Wire Line
	950  2150 950  2050
Wire Wire Line
	4650 3400 4750 3400
Wire Wire Line
	4750 3400 4750 3500
Wire Wire Line
	4650 3300 4750 3300
Wire Wire Line
	4750 3300 4750 3400
Connection ~ 4750 3400
Text Label 4650 2900 0    50   ~ 0
ESP_RXD0
Text Label 4650 3000 0    50   ~ 0
ESP_TXD0
Text Label 4650 2000 0    50   ~ 0
ESP_IO0_B
Text Label 3250 2800 2    50   ~ 0
ESP_TMS
Text Label 3250 2900 2    50   ~ 0
ESP_TDI
Text Label 3250 3100 2    50   ~ 0
ESP_TCK
Text Label 4650 1800 0    50   ~ 0
ESP_TDO
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 5EFD2FF6
P 6850 2850
F 0 "J1" H 6768 3167 50  0000 C CNN
F 1 "JTAG" H 6768 3076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6850 2850 50  0001 C CNN
F 3 "~" H 6850 2850 50  0001 C CNN
	1    6850 2850
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 5EFD65C3
P 7550 2850
F 0 "J2" H 7468 3167 50  0000 C CNN
F 1 "UART" H 7468 3076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 7550 2850 50  0001 C CNN
F 3 "~" H 7550 2850 50  0001 C CNN
	1    7550 2850
	-1   0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR03
U 1 1 5EFDCB6D
P 950 1700
F 0 "#PWR03" H 950 1550 50  0001 C CNN
F 1 "+3V3" H 965 1873 50  0000 C CNN
F 2 "" H 950 1700 50  0001 C CNN
F 3 "" H 950 1700 50  0001 C CNN
	1    950  1700
	1    0    0    -1  
$EndComp
Connection ~ 950  1700
$Comp
L power:+3V3 #PWR01
U 1 1 5EFDFC04
P 7850 2650
F 0 "#PWR01" H 7850 2500 50  0001 C CNN
F 1 "+3V3" H 7865 2823 50  0000 C CNN
F 2 "" H 7850 2650 50  0001 C CNN
F 3 "" H 7850 2650 50  0001 C CNN
	1    7850 2650
	1    0    0    -1  
$EndComp
Text Label 7750 2850 0    50   ~ 0
ESP_TXD0
Wire Wire Line
	7850 3050 7750 3050
Wire Wire Line
	7750 2750 7850 2750
Wire Wire Line
	7850 2750 7850 2650
Text Label 7750 2950 0    50   ~ 0
ESP_RXD0
Text Label 7050 3050 0    50   ~ 0
ESP_TDO
Text Label 3000 2300 2    50   ~ 0
VL53L1X_EN
Text Label 3000 2100 2    50   ~ 0
VL53L1X_IRQ
Text Label 4850 2400 0    50   ~ 0
SPI_DS1302_CE
Text Label 4850 3200 0    50   ~ 0
SPI_IO
Text Label 4850 2500 0    50   ~ 0
SPI_SCLK
Text Label 3000 2400 2    50   ~ 0
IR_LED_EN
Text Label 3000 2700 2    50   ~ 0
IR_LED
Text Label 3000 2600 2    50   ~ 0
IR_LED_MID
Text Label 3000 2500 2    50   ~ 0
IR_LED_MAX
$Comp
L power:GND #PWR06
U 1 1 5ED5EE5E
P 2850 3000
F 0 "#PWR06" H 2850 2750 50  0001 C CNN
F 1 "GND" V 2855 2872 50  0000 R CNN
F 2 "" H 2850 3000 50  0001 C CNN
F 3 "" H 2850 3000 50  0001 C CNN
	1    2850 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 3000 2850 3000
$Comp
L power:+3V3 #PWR09
U 1 1 5EE86613
P 6500 1700
F 0 "#PWR09" H 6500 1550 50  0001 C CNN
F 1 "+3V3" H 6515 1873 50  0000 C CNN
F 2 "" H 6500 1700 50  0001 C CNN
F 3 "" H 6500 1700 50  0001 C CNN
	1    6500 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR010
U 1 1 5EE89551
P 6900 1700
F 0 "#PWR010" H 6900 1550 50  0001 C CNN
F 1 "+3V3" H 6915 1873 50  0000 C CNN
F 2 "" H 6900 1700 50  0001 C CNN
F 3 "" H 6900 1700 50  0001 C CNN
	1    6900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2400 4850 2400
Wire Wire Line
	4650 2500 4850 2500
Wire Wire Line
	4650 2800 4850 2800
Wire Wire Line
	4650 3100 4850 3100
Wire Wire Line
	4650 3200 4850 3200
Text Label 4850 2800 0    50   ~ 0
I2C_SDA
Text Label 4850 3100 0    50   ~ 0
I2C_SCL
$Comp
L power:PWR_FLAG #FLG07
U 1 1 5F3EC6B1
P 3250 4400
F 0 "#FLG07" H 3250 4475 50  0001 C CNN
F 1 "PWR_FLAG" H 3250 4573 50  0000 C CNN
F 2 "" H 3250 4400 50  0001 C CNN
F 3 "~" H 3250 4400 50  0001 C CNN
	1    3250 4400
	1    0    0    -1  
$EndComp
Connection ~ 3250 4400
Wire Wire Line
	3250 4400 3700 4400
$Comp
L power:PWR_FLAG #FLG06
U 1 1 5F68219D
P 2100 4400
F 0 "#FLG06" H 2100 4475 50  0001 C CNN
F 1 "PWR_FLAG" H 2100 4573 50  0000 C CNN
F 2 "" H 2100 4400 50  0001 C CNN
F 3 "~" H 2100 4400 50  0001 C CNN
	1    2100 4400
	1    0    0    -1  
$EndComp
Connection ~ 2100 4400
$Comp
L power:PWR_FLAG #FLG03
U 1 1 5F7DE53D
P 8200 1750
F 0 "#FLG03" H 8200 1825 50  0001 C CNN
F 1 "PWR_FLAG" H 8200 1923 50  0000 C CNN
F 2 "" H 8200 1750 50  0001 C CNN
F 3 "~" H 8200 1750 50  0001 C CNN
	1    8200 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR044
U 1 1 5F7DE5EE
P 8200 1750
F 0 "#PWR044" H 8200 1500 50  0001 C CNN
F 1 "GND" H 8205 1577 50  0000 C CNN
F 2 "" H 8200 1750 50  0001 C CNN
F 3 "" H 8200 1750 50  0001 C CNN
	1    8200 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR045
U 1 1 5F7DF918
P 8550 1750
F 0 "#PWR045" H 8550 1600 50  0001 C CNN
F 1 "+3V3" H 8565 1923 50  0000 C CNN
F 2 "" H 8550 1750 50  0001 C CNN
F 3 "" H 8550 1750 50  0001 C CNN
	1    8550 1750
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG04
U 1 1 5F7E1723
P 8550 1750
F 0 "#FLG04" H 8550 1825 50  0001 C CNN
F 1 "PWR_FLAG" H 8550 1923 50  0000 C CNN
F 2 "" H 8550 1750 50  0001 C CNN
F 3 "~" H 8550 1750 50  0001 C CNN
	1    8550 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 2400 3000 2400
Text Label 3000 2200 2    50   ~ 0
BATT_SENSE
Wire Wire Line
	3250 2200 3000 2200
Wire Wire Line
	3250 2100 3000 2100
Wire Wire Line
	3250 2300 3000 2300
Wire Wire Line
	1350 1700 3250 1700
Wire Wire Line
	3000 2000 3250 2000
Wire Wire Line
	3000 1900 3250 1900
Text Label 4850 1900 0    50   ~ 0
IR_LED_CAM
Text Label 4850 2100 0    50   ~ 0
IR_LED_CAM_MID
Text Label 4850 2600 0    50   ~ 0
IR_LED_CAM_MAX
$Comp
L Connector_Generic:Conn_01x04 J12
U 1 1 5E8920DF
P 8300 2850
F 0 "J12" H 8218 3167 50  0000 C CNN
F 1 "USB" H 8218 3076 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 8300 2850 50  0001 C CNN
F 3 "~" H 8300 2850 50  0001 C CNN
	1    8300 2850
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5EB0516D
P 8600 3050
F 0 "#PWR0112" H 8600 2800 50  0001 C CNN
F 1 "GND" V 8605 2922 50  0000 R CNN
F 2 "" H 8600 3050 50  0001 C CNN
F 3 "" H 8600 3050 50  0001 C CNN
	1    8600 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8500 3050 8600 3050
Text Label 8500 2750 0    50   ~ 0
+5V_USB_IN
Text Label 8500 2950 0    50   ~ 0
USB_DP
Text Label 8500 2850 0    50   ~ 0
USB_DM
$Comp
L power:GND #PWR02
U 1 1 5EF62B8F
P 7850 3050
F 0 "#PWR02" H 7850 2800 50  0001 C CNN
F 1 "GND" V 7855 2922 50  0000 R CNN
F 2 "" H 7850 3050 50  0001 C CNN
F 3 "" H 7850 3050 50  0001 C CNN
	1    7850 3050
	0    -1   -1   0   
$EndComp
$Sheet
S 4950 4050 900  600 
U 5EFE3A5A
F0 "battery_charger" 50
F1 "battery_charger.sch" 50
F2 "USB_DP" B L 4950 4400 50 
F3 "USB_DM" B L 4950 4550 50 
F4 "+BATT" B R 5850 4400 50 
F5 "+V_SYS" O R 5850 4200 50 
F6 "+5V_USB" I L 4950 4200 50 
$EndSheet
Text Label 4950 4550 2    50   ~ 0
USB_DM
Text Label 4950 4400 2    50   ~ 0
USB_DP
$Comp
L power:+BATT #PWR021
U 1 1 5F470EE8
P 5850 4400
F 0 "#PWR021" H 5850 4250 50  0001 C CNN
F 1 "+BATT" V 5865 4528 50  0000 L CNN
F 2 "" H 5850 4400 50  0001 C CNN
F 3 "" H 5850 4400 50  0001 C CNN
	1    5850 4400
	0    1    1    0   
$EndComp
$Comp
L power:+5V_USB #PWR011
U 1 1 5F472DD2
P 4950 4200
F 0 "#PWR011" H 4950 4050 50  0001 C CNN
F 1 "+5V_USB" V 4965 4328 50  0000 L CNN
F 2 "" H 4950 4200 50  0001 C CNN
F 3 "" H 4950 4200 50  0001 C CNN
	1    4950 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:+V_SYS #PWR019
U 1 1 5F476486
P 5850 4200
F 0 "#PWR019" H 5850 4050 50  0001 C CNN
F 1 "+V_SYS" V 5865 4328 50  0000 L CNN
F 2 "" H 5850 4200 50  0001 C CNN
F 3 "" H 5850 4200 50  0001 C CNN
	1    5850 4200
	0    1    1    0   
$EndComp
$Sheet
S 7100 3700 1000 300 
U 5F506F42
F0 "regulator_3V3" 50
F1 "regulator_3V3.sch" 50
F2 "+V_SYS" I L 7100 3850 50 
F3 "+3V3" O R 8100 3850 50 
$EndSheet
$Comp
L power:+V_SYS #PWR0116
U 1 1 5F6874AC
P 7100 3850
F 0 "#PWR0116" H 7100 3700 50  0001 C CNN
F 1 "+V_SYS" V 7115 3977 50  0000 L CNN
F 2 "" H 7100 3850 50  0001 C CNN
F 3 "" H 7100 3850 50  0001 C CNN
	1    7100 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0117
U 1 1 5F68A7F9
P 8100 3850
F 0 "#PWR0117" H 8100 3700 50  0001 C CNN
F 1 "+3V3" V 8115 3978 50  0000 L CNN
F 2 "" H 8100 3850 50  0001 C CNN
F 3 "" H 8100 3850 50  0001 C CNN
	1    8100 3850
	0    1    1    0   
$EndComp
$Sheet
S 7150 5000 850  350 
U 5F78E3D7
F0 "regulator_V_LED" 50
F1 "regulator_V_LED.sch" 50
F2 "+V_LED" O R 8000 5100 50 
F3 "+V_SYS" I L 7150 5100 50 
F4 "IR_LED_EN" I L 7150 5250 50 
$EndSheet
Text Label 8000 5100 0    50   ~ 0
+V_LED
$Comp
L power:+V_SYS #PWR034
U 1 1 5F8D0AF4
P 7150 5100
F 0 "#PWR034" H 7150 4950 50  0001 C CNN
F 1 "+V_SYS" V 7165 5227 50  0000 L CNN
F 2 "" H 7150 5100 50  0001 C CNN
F 3 "" H 7150 5100 50  0001 C CNN
	1    7150 5100
	0    -1   -1   0   
$EndComp
Text Label 7150 5250 2    50   ~ 0
IR_LED_EN
$Sheet
S 4950 5600 1150 1550
U 5E86A4DD
F0 "programmer" 50
F1 "programmer.sch" 50
F2 "USB_DP" B L 4950 6050 50 
F3 "USB_DM" B L 4950 6200 50 
F4 "ESP_IO0_B" O R 6100 5900 50 
F5 "ESP_EN" B R 6100 5750 50 
F6 "ESP_RXD0" I R 6100 6300 50 
F7 "ESP_TXD0" O R 6100 6150 50 
F8 "+5V_USB" I L 4950 5750 50 
F9 "ESP_TCK" B R 6100 6550 50 
F10 "ESP_TDI" B R 6100 6700 50 
F11 "ESP_TDO" B R 6100 6850 50 
F12 "ESP_TMS" B R 6100 7000 50 
$EndSheet
Text Label 4950 6050 2    50   ~ 0
USB_DP
Text Label 4950 6200 2    50   ~ 0
USB_DM
Text Label 6100 5750 0    50   ~ 0
ESP_EN
Text Label 6100 5900 0    50   ~ 0
ESP_IO0_B
Text Label 6100 6300 0    50   ~ 0
ESP_RXD0
Text Label 6100 6150 0    50   ~ 0
ESP_TXD0
Text Label 6100 6550 0    50   ~ 0
ESP_TCK
Text Label 6100 6700 0    50   ~ 0
ESP_TDI
Text Label 6100 6850 0    50   ~ 0
ESP_TDO
Text Label 6100 7000 0    50   ~ 0
ESP_TMS
$Comp
L power:+5V_USB #PWR036
U 1 1 5EBE22F1
P 4950 5750
F 0 "#PWR036" H 4950 5600 50  0001 C CNN
F 1 "+5V_USB" V 4965 5878 50  0000 L CNN
F 2 "" H 4950 5750 50  0001 C CNN
F 3 "" H 4950 5750 50  0001 C CNN
	1    4950 5750
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5F1A2680
P 9800 1650
F 0 "H1" V 9754 1800 50  0000 L CNN
F 1 "MountingHole_Pad" V 9845 1800 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_Pad" H 9800 1650 50  0001 C CNN
F 3 "~" H 9800 1650 50  0001 C CNN
	1    9800 1650
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F1A2D1A
P 9800 1850
F 0 "H2" V 9754 2000 50  0000 L CNN
F 1 "MountingHole_Pad" V 9845 2000 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_Pad" H 9800 1850 50  0001 C CNN
F 3 "~" H 9800 1850 50  0001 C CNN
	1    9800 1850
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5F1A2E67
P 9800 2050
F 0 "H3" V 9754 2200 50  0000 L CNN
F 1 "MountingHole_Pad" V 9845 2200 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_Pad" H 9800 2050 50  0001 C CNN
F 3 "~" H 9800 2050 50  0001 C CNN
	1    9800 2050
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5F1A3049
P 9800 2250
F 0 "H4" V 9754 2400 50  0000 L CNN
F 1 "MountingHole_Pad" V 9845 2400 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_Pad" H 9800 2250 50  0001 C CNN
F 3 "~" H 9800 2250 50  0001 C CNN
	1    9800 2250
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 5F1A32CD
P 9800 2450
F 0 "H5" V 9754 2600 50  0000 L CNN
F 1 "MountingHole_Pad" V 9845 2600 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_Pad" H 9800 2450 50  0001 C CNN
F 3 "~" H 9800 2450 50  0001 C CNN
	1    9800 2450
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 5F1A35BE
P 9800 2650
F 0 "H6" V 9754 2800 50  0000 L CNN
F 1 "MountingHole_Pad" V 9845 2800 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_Pad" H 9800 2650 50  0001 C CNN
F 3 "~" H 9800 2650 50  0001 C CNN
	1    9800 2650
	0    1    1    0   
$EndComp
NoConn ~ 9700 1650
NoConn ~ 9700 1850
NoConn ~ 9700 2050
NoConn ~ 9700 2250
NoConn ~ 9700 2450
NoConn ~ 9700 2650
Text Label 3000 2000 2    50   ~ 0
BTN_2
Text Label 3000 1900 2    50   ~ 0
BTN_1
Text Label 7050 2950 0    50   ~ 0
ESP_TMS
Text Label 7050 2750 0    50   ~ 0
ESP_TDI
Text Label 7050 2850 0    50   ~ 0
ESP_TCK
$Comp
L ngni_logo:LOGO G1
U 1 1 5EB006CF
P 10150 900
F 0 "G1" H 10150 708 60  0001 C CNN
F 1 "LOGO" H 10150 1092 60  0001 C CNN
F 2 "my_library:ngni_logo" H 10150 900 50  0001 C CNN
F 3 "" H 10150 900 50  0001 C CNN
	1    10150 900 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5EB192FB
P 5550 1900
F 0 "TP4" V 5504 2088 50  0000 L CNN
F 1 "TestPoint" V 5595 2088 50  0000 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 5750 1900 50  0001 C CNN
F 3 "~" H 5750 1900 50  0001 C CNN
	1    5550 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 1900 5550 1900
$Comp
L Connector:TestPoint TP5
U 1 1 5EB5870E
P 5550 2100
F 0 "TP5" V 5504 2288 50  0000 L CNN
F 1 "TestPoint" V 5595 2288 50  0000 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 5750 2100 50  0001 C CNN
F 3 "~" H 5750 2100 50  0001 C CNN
	1    5550 2100
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5EB58B45
P 5550 2600
F 0 "TP6" V 5504 2788 50  0000 L CNN
F 1 "TestPoint" V 5595 2788 50  0000 L CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 5750 2600 50  0001 C CNN
F 3 "~" H 5750 2600 50  0001 C CNN
	1    5550 2600
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5EB59135
P 2250 2700
F 0 "TP3" V 2250 2950 50  0000 C CNN
F 1 "TestPoint" V 2250 3250 50  0000 C CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 2450 2700 50  0001 C CNN
F 3 "~" H 2450 2700 50  0001 C CNN
	1    2250 2700
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5EB79884
P 2250 2500
F 0 "TP1" V 2250 2750 50  0000 C CNN
F 1 "TestPoint" V 2250 3050 50  0000 C CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 2450 2500 50  0001 C CNN
F 3 "~" H 2450 2500 50  0001 C CNN
	1    2250 2500
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5EB79B85
P 2250 2600
F 0 "TP2" V 2250 2850 50  0000 C CNN
F 1 "TestPoint" V 2250 3150 50  0000 C CNN
F 2 "TestPoint:TestPoint_Loop_D1.80mm_Drill1.0mm_Beaded" H 2450 2600 50  0001 C CNN
F 3 "~" H 2450 2600 50  0001 C CNN
	1    2250 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 2500 3250 2500
Wire Wire Line
	2250 2600 3250 2600
Wire Wire Line
	2250 2700 3250 2700
Wire Wire Line
	4650 2100 5550 2100
Wire Wire Line
	4650 2600 5550 2600
$Sheet
S 7050 5850 1100 200 
U 5EE6AFD9
F0 "battery" 50
F1 "battery.sch" 50
F2 "+BATT" B L 7050 5950 50 
F3 "BATT_SENSE" O R 8150 5950 50 
$EndSheet
Text Label 8150 5950 0    50   ~ 0
BATT_SENSE
$Comp
L power:+BATT #PWR024
U 1 1 5EECBDF6
P 7050 5950
F 0 "#PWR024" H 7050 5800 50  0001 C CNN
F 1 "+BATT" V 7065 6077 50  0000 L CNN
F 2 "" H 7050 5950 50  0001 C CNN
F 3 "" H 7050 5950 50  0001 C CNN
	1    7050 5950
	0    -1   -1   0   
$EndComp
$Sheet
S 9400 5050 750  1000
U 5EEDEE9E
F0 "led_driver" 50
F1 "led_driver.sch" 50
F2 "IR_LED_CAM" I L 9400 5750 50 
F3 "IR_LED_CAM_MID" I L 9400 5850 50 
F4 "IR_LED_CAM_MAX" I L 9400 5950 50 
F5 "+3V3" I L 9400 5250 50 
F6 "+V_LED" I L 9400 5150 50 
F7 "IR_LED" I L 9400 5400 50 
F8 "IR_LED_MID" I L 9400 5500 50 
F9 "IR_LED_MAX" I L 9400 5600 50 
$EndSheet
Text Label 9400 5150 2    50   ~ 0
+V_LED
Text Label 9400 5400 2    50   ~ 0
IR_LED
Text Label 9400 5750 2    50   ~ 0
IR_LED_CAM
Text Label 9400 5850 2    50   ~ 0
IR_LED_CAM_MID
Text Label 9400 5950 2    50   ~ 0
IR_LED_CAM_MAX
Text Label 9400 5500 2    50   ~ 0
IR_LED_MID
Text Label 9400 5600 2    50   ~ 0
IR_LED_MAX
$Comp
L power:+3V3 #PWR0101
U 1 1 5EEB9892
P 9400 5250
F 0 "#PWR0101" H 9400 5100 50  0001 C CNN
F 1 "+3V3" V 9415 5378 50  0000 L CNN
F 2 "" H 9400 5250 50  0001 C CNN
F 3 "" H 9400 5250 50  0001 C CNN
	1    9400 5250
	0    -1   -1   0   
$EndComp
$Sheet
S 9250 3550 1200 1050
U 5EEBB323
F0 "peripherals" 50
F1 "peripherals.sch" 50
F2 "SPI_DS1302_CE" I L 9250 3800 50 
F3 "SPI_IO" B L 9250 3900 50 
F4 "SPI_SCLK" I L 9250 4000 50 
F5 "VL53L1X_EN" I L 9250 4400 50 
F6 "VL53L1X_IRQ" O R 10450 4400 50 
F7 "I2C_SDA" B L 9250 4150 50 
F8 "I2C_SCL" I L 9250 4250 50 
F9 "ESP_IO0_B" O R 10450 3650 50 
F10 "ESP_EN" O R 10450 3750 50 
F11 "BTN_1" O R 10450 3850 50 
F12 "BTN_2" O R 10450 3950 50 
F13 "+3V3" O L 9250 3650 50 
$EndSheet
Text Label 9250 3800 2    50   ~ 0
SPI_DS1302_CE
Text Label 9250 4000 2    50   ~ 0
SPI_SCLK
Text Label 9250 4250 2    50   ~ 0
I2C_SCL
Text Label 9250 4150 2    50   ~ 0
I2C_SDA
Text Label 10450 4400 0    50   ~ 0
VL53L1X_IRQ
Text Label 9250 4400 2    50   ~ 0
VL53L1X_EN
Text Label 10450 3650 0    50   ~ 0
ESP_IO0_B
Text Label 10450 3750 0    50   ~ 0
ESP_EN
Text Label 10450 3850 0    50   ~ 0
BTN_1
Text Label 10450 3950 0    50   ~ 0
BTN_2
$Comp
L power:+3V3 #PWR?
U 1 1 5EF7C5B3
P 9250 3650
F 0 "#PWR?" H 9250 3500 50  0001 C CNN
F 1 "+3V3" V 9265 3778 50  0000 L CNN
F 2 "" H 9250 3650 50  0001 C CNN
F 3 "" H 9250 3650 50  0001 C CNN
	1    9250 3650
	0    -1   -1   0   
$EndComp
Text Label 9250 3900 2    50   ~ 0
SPI_IO
Text Notes 5000 1200 0    300  ~ 0
BEACON
Wire Wire Line
	2000 4400 2100 4400
Text Label 2150 4400 0    50   ~ 0
+5V_USB_IN
Wire Wire Line
	2100 4400 2300 4400
Wire Wire Line
	2300 4400 2550 4400
Connection ~ 2300 4400
Wire Wire Line
	2300 5400 2300 4400
Wire Wire Line
	2700 4950 3200 4950
Connection ~ 2700 4950
Wire Wire Line
	2700 5400 2700 4950
Wire Wire Line
	2000 4950 2700 4950
$EndSCHEMATC
