EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 8
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
L Device:LED_RGBA D?
U 1 1 5EECFDC7
P 10300 2550
AR Path="/5EECFDC7" Ref="D?"  Part="1" 
AR Path="/5EEBB323/5EECFDC7" Ref="D16"  Part="1" 
F 0 "D16" V 10346 2220 50  0000 R CNN
F 1 "LED_RGBA" V 10255 2220 50  0000 R CNN
F 2 "LED_SMD:LED_Avago_PLCC4_3.2x2.8mm_CW" H 10300 2500 50  0001 C CNN
F 3 "~" H 10300 2500 50  0001 C CNN
	1    10300 2550
	0    -1   -1   0   
$EndComp
$Comp
L my_library:PCA9632 U?
U 1 1 5EECFDCD
P 9650 3300
AR Path="/5EECFDCD" Ref="U?"  Part="1" 
AR Path="/5EEBB323/5EECFDCD" Ref="U11"  Part="1" 
F 0 "U11" H 9650 3715 50  0000 C CNN
F 1 "PCA9632" H 9650 3624 50  0000 C CNN
F 2 "Package_SO:TSSOP-8_3x3mm_P0.65mm" H 9650 2950 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/PCA9632.pdf?" H 9650 3300 50  0001 C CNN
	1    9650 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EECFDD3
P 10100 2950
AR Path="/5EECFDD3" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EECFDD3" Ref="R59"  Part="1" 
F 0 "R59" H 10100 3100 50  0000 L CNN
F 1 "100" H 10100 2800 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10030 2950 50  0001 C CNN
F 3 "~" H 10100 2950 50  0001 C CNN
	1    10100 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EECFDD9
P 10300 2950
AR Path="/5EECFDD9" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EECFDD9" Ref="R60"  Part="1" 
F 0 "R60" H 10300 3100 50  0000 L CNN
F 1 "20" H 10300 2800 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10230 2950 50  0001 C CNN
F 3 "~" H 10300 2950 50  0001 C CNN
	1    10300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 3150 10100 3150
Wire Wire Line
	10100 3150 10100 3100
Wire Wire Line
	10100 2800 10100 2750
Wire Wire Line
	10300 2750 10300 2800
Wire Wire Line
	10000 3250 10300 3250
Wire Wire Line
	10300 3250 10300 3100
Wire Wire Line
	10000 3350 10500 3350
$Comp
L power:GND #PWR?
U 1 1 5EECFDF0
P 9200 3550
AR Path="/5EECFDF0" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EECFDF0" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 9200 3300 50  0001 C CNN
F 1 "GND" H 9205 3377 50  0000 C CNN
F 2 "" H 9200 3550 50  0001 C CNN
F 3 "" H 9200 3550 50  0001 C CNN
	1    9200 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 3050 9200 3150
Wire Wire Line
	9200 3150 9300 3150
Wire Wire Line
	9200 3550 9200 3450
Wire Wire Line
	9200 3450 9300 3450
Wire Wire Line
	10300 2300 10300 2350
NoConn ~ 10000 3450
$Comp
L Device:C C?
U 1 1 5EECFE08
P 8750 3300
AR Path="/5EECFE08" Ref="C?"  Part="1" 
AR Path="/5EEBB323/5EECFE08" Ref="C46"  Part="1" 
F 0 "C46" H 8500 3350 50  0000 L CNN
F 1 "100nF" H 8400 3250 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8788 3150 50  0001 C CNN
F 3 "~" H 8750 3300 50  0001 C CNN
	1    8750 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3150 9200 3150
Connection ~ 9200 3150
Wire Wire Line
	8750 3450 9200 3450
Connection ~ 9200 3450
$Comp
L SamacSys_Parts:VL53L1CXV0FY_1 IC?
U 1 1 5EEE4048
P 6000 3300
AR Path="/5EEE4048" Ref="IC?"  Part="1" 
AR Path="/5EEBB323/5EEE4048" Ref="IC2"  Part="1" 
F 0 "IC2" H 5650 3550 50  0000 C CNN
F 1 "VL53L1CXV0FY_1" H 6100 3550 50  0000 C CNN
F 2 "SamacSys_Parts:VL53L1CXV0FY1" H 7250 3400 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/VL53L1CXV0FY_1.pdf" H 7250 3300 50  0001 L CNN
F 4 "Long distance ranging Time-of-Flight sen" H 7250 3200 50  0001 L CNN "Description"
F 5 "1" H 7250 3100 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 7250 3000 50  0001 L CNN "Manufacturer_Name"
F 7 "VL53L1CXV0FY/1" H 7250 2900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "511-VL53L1CXV0FY/1" H 7250 2800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=511-VL53L1CXV0FY%2F1" H 7250 2700 50  0001 L CNN "Mouser Price/Stock"
F 10 "1751110P" H 7250 2600 50  0001 L CNN "RS Part Number"
F 11 "http://uk.rs-online.com/web/p/products/1751110P" H 7250 2500 50  0001 L CNN "RS Price/Stock"
	1    6000 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EEE404E
P 6950 3300
AR Path="/5EEE404E" Ref="C?"  Part="1" 
AR Path="/5EEBB323/5EEE404E" Ref="C22"  Part="1" 
F 0 "C22" H 7065 3346 50  0000 L CNN
F 1 "100nF" H 7065 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6988 3150 50  0001 C CNN
F 3 "~" H 6950 3300 50  0001 C CNN
	1    6950 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EEE4054
P 7400 3300
AR Path="/5EEE4054" Ref="C?"  Part="1" 
AR Path="/5EEBB323/5EEE4054" Ref="C23"  Part="1" 
F 0 "C23" H 7515 3346 50  0000 L CNN
F 1 "4.7uF" H 7515 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7438 3150 50  0001 C CNN
F 3 "~" H 7400 3300 50  0001 C CNN
	1    7400 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3150 6650 3150
Connection ~ 6950 3150
Wire Wire Line
	6600 3450 6650 3450
Connection ~ 6950 3450
Wire Wire Line
	6950 3450 7200 3450
Wire Wire Line
	6600 3350 6650 3350
Wire Wire Line
	6650 3350 6650 3450
Connection ~ 6650 3450
Wire Wire Line
	6650 3450 6950 3450
Wire Wire Line
	6600 3250 6650 3250
Wire Wire Line
	6650 3250 6650 3150
Connection ~ 6650 3150
Wire Wire Line
	6650 3150 6950 3150
$Comp
L power:GND #PWR?
U 1 1 5EEE4068
P 7200 3450
AR Path="/5EEE4068" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EEE4068" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 7200 3200 50  0001 C CNN
F 1 "GND" H 7205 3277 50  0000 C CNN
F 2 "" H 7200 3450 50  0001 C CNN
F 3 "" H 7200 3450 50  0001 C CNN
	1    7200 3450
	1    0    0    -1  
$EndComp
Connection ~ 7200 3450
Wire Wire Line
	7200 3450 7400 3450
$Comp
L Device:R R?
U 1 1 5EEE407B
P 5300 2900
AR Path="/5EEE407B" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EEE407B" Ref="R29"  Part="1" 
F 0 "R29" H 5370 2946 50  0000 L CNN
F 1 "10k" H 5370 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5230 2900 50  0001 C CNN
F 3 "~" H 5300 2900 50  0001 C CNN
	1    5300 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EEE4081
P 5000 2900
AR Path="/5EEE4081" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EEE4081" Ref="R28"  Part="1" 
F 0 "R28" H 5070 2946 50  0000 L CNN
F 1 "10k" H 5070 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4930 2900 50  0001 C CNN
F 3 "~" H 5000 2900 50  0001 C CNN
	1    5000 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3050 5300 3150
Wire Wire Line
	5300 3150 5400 3150
Wire Wire Line
	5000 3050 5000 3250
Wire Wire Line
	5000 3250 5400 3250
Wire Wire Line
	5000 3250 4850 3250
Connection ~ 5000 3250
Wire Wire Line
	5000 2750 5000 2700
Wire Wire Line
	5300 2700 5300 2750
Wire Wire Line
	5300 3150 4850 3150
Connection ~ 5300 3150
$Comp
L Timer_RTC:DS1302SN+ U?
U 1 1 5EEEC9DB
P 2150 3300
AR Path="/5EEEC9DB" Ref="U?"  Part="1" 
AR Path="/5EEBB323/5EEEC9DB" Ref="U4"  Part="1" 
F 0 "U4" H 2500 2800 50  0000 L CNN
F 1 "DS1302SN+" H 2200 2950 50  0000 L CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 2150 2800 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DS1302.pdf" H 1700 3700 50  0001 C CNN
	1    2150 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 5EEEC9E1
P 2800 3300
AR Path="/5EEEC9E1" Ref="Y?"  Part="1" 
AR Path="/5EEBB323/5EEEC9E1" Ref="Y1"  Part="1" 
F 0 "Y1" V 2700 3050 50  0000 L CNN
F 1 "CMR200T32.768KDZB-UT" V 2800 2200 50  0000 L CNN
F 2 "my_library:Crystal_SMD_Citizen_CMR200T_2.0x6.1mm" H 2800 3300 50  0001 C CNN
F 3 "~" H 2800 3300 50  0001 C CNN
	1    2800 3300
	0    -1   1    0   
$EndComp
$Comp
L Device:Battery_Cell BT?
U 1 1 5EEEC9E7
P 3000 2800
AR Path="/5EEEC9E7" Ref="BT?"  Part="1" 
AR Path="/5EEBB323/5EEEC9E7" Ref="BT2"  Part="1" 
F 0 "BT2" V 3255 2850 50  0000 C CNN
F 1 "Coin_Cell_2032" V 3164 2850 50  0000 C CNN
F 2 "SamacSys_Parts:BC2001" V 3000 2860 50  0001 C CNN
F 3 "~" V 3000 2860 50  0001 C CNN
	1    3000 2800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEEC9ED
P 3200 2800
AR Path="/5EEEC9ED" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EEEC9ED" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 3200 2550 50  0001 C CNN
F 1 "GND" V 3205 2672 50  0000 R CNN
F 2 "" H 3200 2800 50  0001 C CNN
F 3 "" H 3200 2800 50  0001 C CNN
	1    3200 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 2800 3200 2800
$Comp
L power:GND #PWR?
U 1 1 5EEEC9F4
P 2150 3800
AR Path="/5EEEC9F4" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EEEC9F4" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 2150 3550 50  0001 C CNN
F 1 "GND" H 2155 3627 50  0000 C CNN
F 2 "" H 2150 3800 50  0001 C CNN
F 3 "" H 2150 3800 50  0001 C CNN
	1    2150 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3800 2150 3700
Wire Wire Line
	2650 3100 2800 3100
Wire Wire Line
	2800 3100 2800 3150
Wire Wire Line
	2650 3500 2800 3500
Wire Wire Line
	2800 3500 2800 3450
Wire Wire Line
	2250 2900 2250 2800
Wire Wire Line
	2250 2800 2400 2800
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5EEECA04
P 2400 2800
AR Path="/5EEECA04" Ref="#FLG?"  Part="1" 
AR Path="/5EEBB323/5EEECA04" Ref="#FLG05"  Part="1" 
F 0 "#FLG05" H 2400 2875 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 2973 50  0000 C CNN
F 2 "" H 2400 2800 50  0001 C CNN
F 3 "~" H 2400 2800 50  0001 C CNN
	1    2400 2800
	1    0    0    -1  
$EndComp
Connection ~ 2400 2800
Wire Wire Line
	2400 2800 2800 2800
Wire Wire Line
	2050 2800 2050 2900
$Comp
L SamacSys_Parts:4-1437565-1 SW?
U 1 1 5EEFA634
P 3300 5850
AR Path="/5EEFA634" Ref="SW?"  Part="1" 
AR Path="/5EEBB323/5EEFA634" Ref="SW5"  Part="1" 
F 0 "SW5" H 3350 5650 50  0000 R CNN
F 1 "4-1437565-1" H 3550 6050 50  0000 R CNN
F 2 "SamacSys_Parts:FSM-SWITCH" H 4250 6000 50  0001 L CNN
F 3 "http://uk.rs-online.com/web/p/products/4791508P" H 4250 5900 50  0001 L CNN
F 4 "6x6mm SMD tactile switch,5mm H 1.6N Black Button Tactile Switch, SPST-NO 0.05 A@ 12 V dc 1.4mm" H 4250 5800 50  0001 L CNN "Description"
F 5 "" H 3550 5700 50  0001 L CNN "Height"
F 6 "4791508P" H 4250 5600 50  0001 L CNN "RS Part Number"
F 7 "http://uk.rs-online.com/web/p/products/4791508P" H 4250 5500 50  0001 L CNN "RS Price/Stock"
F 8 "TE Connectivity" H 4250 5400 50  0001 L CNN "Manufacturer_Name"
F 9 "4-1437565-1" H 4250 5300 50  0001 L CNN "Manufacturer_Part_Number"
F 10 "R1117787" H 4250 5200 50  0001 L CNN "Allied_Number"
	1    3300 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EEFA63A
P 3350 5100
AR Path="/5EEFA63A" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EEFA63A" Ref="R62"  Part="1" 
F 0 "R62" H 3280 5054 50  0000 R CNN
F 1 "10k" H 3280 5145 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3280 5100 50  0001 C CNN
F 3 "~" H 3350 5100 50  0001 C CNN
	1    3350 5100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EEFA640
P 3600 5350
AR Path="/5EEFA640" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EEFA640" Ref="R63"  Part="1" 
F 0 "R63" V 3500 5200 50  0000 C CNN
F 1 "10k" V 3500 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3530 5350 50  0001 C CNN
F 3 "~" H 3600 5350 50  0001 C CNN
	1    3600 5350
	0    1    -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EEFA646
P 3850 5800
AR Path="/5EEFA646" Ref="C?"  Part="1" 
AR Path="/5EEBB323/5EEFA646" Ref="C44"  Part="1" 
F 0 "C44" H 3965 5846 50  0000 L CNN
F 1 "100nF" H 3965 5755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3888 5650 50  0001 C CNN
F 3 "~" H 3850 5800 50  0001 C CNN
	1    3850 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEFA64C
P 3350 6350
AR Path="/5EEFA64C" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EEFA64C" Ref="#PWR098"  Part="1" 
F 0 "#PWR098" H 3350 6100 50  0001 C CNN
F 1 "GND" H 3355 6177 50  0000 C CNN
F 2 "" H 3350 6350 50  0001 C CNN
F 3 "" H 3350 6350 50  0001 C CNN
	1    3350 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEFA652
P 3850 6350
AR Path="/5EEFA652" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EEFA652" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 3850 6100 50  0001 C CNN
F 1 "GND" H 3855 6177 50  0000 C CNN
F 2 "" H 3850 6350 50  0001 C CNN
F 3 "" H 3850 6350 50  0001 C CNN
	1    3850 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4850 3350 4950
Wire Wire Line
	3350 5250 3350 5350
Wire Wire Line
	3250 5450 3250 5400
Wire Wire Line
	3250 5400 3350 5400
Connection ~ 3350 5400
Wire Wire Line
	3350 5400 3350 5450
Wire Wire Line
	3450 5350 3350 5350
Connection ~ 3350 5350
Wire Wire Line
	3350 5350 3350 5400
Wire Wire Line
	3750 5350 3850 5350
Wire Wire Line
	3850 5350 3850 5650
Wire Wire Line
	3850 5950 3850 6350
Wire Wire Line
	3350 6250 3350 6300
Wire Wire Line
	3250 6250 3250 6300
Wire Wire Line
	3250 6300 3350 6300
Connection ~ 3350 6300
Wire Wire Line
	3350 6300 3350 6350
Wire Wire Line
	3850 5350 3950 5350
Connection ~ 3850 5350
$Comp
L SamacSys_Parts:4-1437565-1 SW?
U 1 1 5EEFA678
P 2000 5850
AR Path="/5EEFA678" Ref="SW?"  Part="1" 
AR Path="/5EEBB323/5EEFA678" Ref="SW6"  Part="1" 
F 0 "SW6" H 2050 5650 50  0000 R CNN
F 1 "4-1437565-1" H 2250 6050 50  0000 R CNN
F 2 "SamacSys_Parts:FSM-SWITCH" H 2950 6000 50  0001 L CNN
F 3 "http://uk.rs-online.com/web/p/products/4791508P" H 2950 5900 50  0001 L CNN
F 4 "6x6mm SMD tactile switch,5mm H 1.6N Black Button Tactile Switch, SPST-NO 0.05 A@ 12 V dc 1.4mm" H 2950 5800 50  0001 L CNN "Description"
F 5 "" H 2250 5700 50  0001 L CNN "Height"
F 6 "4791508P" H 2950 5600 50  0001 L CNN "RS Part Number"
F 7 "http://uk.rs-online.com/web/p/products/4791508P" H 2950 5500 50  0001 L CNN "RS Price/Stock"
F 8 "TE Connectivity" H 2950 5400 50  0001 L CNN "Manufacturer_Name"
F 9 "4-1437565-1" H 2950 5300 50  0001 L CNN "Manufacturer_Part_Number"
F 10 "R1117787" H 2950 5200 50  0001 L CNN "Allied_Number"
	1    2000 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EEFA67E
P 2050 5100
AR Path="/5EEFA67E" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EEFA67E" Ref="R64"  Part="1" 
F 0 "R64" H 1980 5054 50  0000 R CNN
F 1 "10k" H 1980 5145 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1980 5100 50  0001 C CNN
F 3 "~" H 2050 5100 50  0001 C CNN
	1    2050 5100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EEFA684
P 2300 5350
AR Path="/5EEFA684" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EEFA684" Ref="R65"  Part="1" 
F 0 "R65" V 2200 5200 50  0000 C CNN
F 1 "10k" V 2200 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2230 5350 50  0001 C CNN
F 3 "~" H 2300 5350 50  0001 C CNN
	1    2300 5350
	0    1    -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EEFA68A
P 2550 5800
AR Path="/5EEFA68A" Ref="C?"  Part="1" 
AR Path="/5EEBB323/5EEFA68A" Ref="C45"  Part="1" 
F 0 "C45" H 2665 5846 50  0000 L CNN
F 1 "100nF" H 2665 5755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2588 5650 50  0001 C CNN
F 3 "~" H 2550 5800 50  0001 C CNN
	1    2550 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEFA690
P 2050 6350
AR Path="/5EEFA690" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EEFA690" Ref="#PWR095"  Part="1" 
F 0 "#PWR095" H 2050 6100 50  0001 C CNN
F 1 "GND" H 2055 6177 50  0000 C CNN
F 2 "" H 2050 6350 50  0001 C CNN
F 3 "" H 2050 6350 50  0001 C CNN
	1    2050 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEFA696
P 2550 6350
AR Path="/5EEFA696" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EEFA696" Ref="#PWR096"  Part="1" 
F 0 "#PWR096" H 2550 6100 50  0001 C CNN
F 1 "GND" H 2555 6177 50  0000 C CNN
F 2 "" H 2550 6350 50  0001 C CNN
F 3 "" H 2550 6350 50  0001 C CNN
	1    2550 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4850 2050 4950
Wire Wire Line
	2050 5250 2050 5350
Wire Wire Line
	1950 5450 1950 5400
Wire Wire Line
	1950 5400 2050 5400
Connection ~ 2050 5400
Wire Wire Line
	2050 5400 2050 5450
Wire Wire Line
	2150 5350 2050 5350
Connection ~ 2050 5350
Wire Wire Line
	2050 5350 2050 5400
Wire Wire Line
	2450 5350 2550 5350
Wire Wire Line
	2550 5350 2550 5650
Wire Wire Line
	2550 5950 2550 6350
Wire Wire Line
	2050 6250 2050 6300
Wire Wire Line
	1950 6250 1950 6300
Wire Wire Line
	1950 6300 2050 6300
Connection ~ 2050 6300
Wire Wire Line
	2050 6300 2050 6350
Wire Wire Line
	2550 5350 2650 5350
Connection ~ 2550 5350
$Comp
L Device:C C?
U 1 1 5EF06A67
P 8350 5700
AR Path="/5EF06A67" Ref="C?"  Part="1" 
AR Path="/5EEBB323/5EF06A67" Ref="C41"  Part="1" 
F 0 "C41" H 8465 5746 50  0000 L CNN
F 1 "1nF" H 8465 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8388 5550 50  0001 C CNN
F 3 "~" H 8350 5700 50  0001 C CNN
	1    8350 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EF06A6D
P 8000 5700
AR Path="/5EF06A6D" Ref="C?"  Part="1" 
AR Path="/5EEBB323/5EF06A6D" Ref="C39"  Part="1" 
F 0 "C39" H 8115 5746 50  0000 L CNN
F 1 "NC" H 8115 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8038 5550 50  0001 C CNN
F 3 "~" H 8000 5700 50  0001 C CNN
	1    8000 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EF06A73
P 6450 5700
AR Path="/5EF06A73" Ref="C?"  Part="1" 
AR Path="/5EEBB323/5EF06A73" Ref="C40"  Part="1" 
F 0 "C40" H 6565 5746 50  0000 L CNN
F 1 "1nF" H 6565 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6488 5550 50  0001 C CNN
F 3 "~" H 6450 5700 50  0001 C CNN
	1    6450 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EF06A79
P 6100 5700
AR Path="/5EF06A79" Ref="C?"  Part="1" 
AR Path="/5EEBB323/5EF06A79" Ref="C38"  Part="1" 
F 0 "C38" H 6215 5746 50  0000 L CNN
F 1 "NC" H 6215 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6138 5550 50  0001 C CNN
F 3 "~" H 6100 5700 50  0001 C CNN
	1    6100 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF06A7F
P 6650 6200
AR Path="/5EF06A7F" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EF06A7F" Ref="#PWR081"  Part="1" 
F 0 "#PWR081" H 6650 5950 50  0001 C CNN
F 1 "GND" H 6655 6027 50  0000 C CNN
F 2 "" H 6650 6200 50  0001 C CNN
F 3 "" H 6650 6200 50  0001 C CNN
	1    6650 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5850 6100 6200
Wire Wire Line
	6100 6200 6450 6200
Wire Wire Line
	6450 5850 6450 6200
Connection ~ 6450 6200
Wire Wire Line
	6450 6200 6650 6200
Wire Wire Line
	6950 6200 6950 6100
Wire Wire Line
	6850 6100 6850 6200
Connection ~ 6850 6200
Wire Wire Line
	6850 6200 6950 6200
Wire Wire Line
	6950 5200 6950 5300
Wire Wire Line
	6850 5300 6850 5200
Connection ~ 6850 5200
Wire Wire Line
	6850 5200 6950 5200
Wire Wire Line
	6450 5550 6450 5200
Connection ~ 6450 5200
Wire Wire Line
	6100 5550 6100 5200
Wire Wire Line
	6100 5200 6450 5200
$Comp
L Device:R R?
U 1 1 5EF06A96
P 7100 5000
AR Path="/5EF06A96" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EF06A96" Ref="R42"  Part="1" 
F 0 "R42" H 7170 5046 50  0000 L CNN
F 1 "10k" H 7170 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7030 5000 50  0001 C CNN
F 3 "~" H 7100 5000 50  0001 C CNN
	1    7100 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 5200 8850 5300
Wire Wire Line
	8750 5300 8750 5200
Connection ~ 8750 5200
Wire Wire Line
	8750 5200 8850 5200
Wire Wire Line
	8350 5550 8350 5200
Connection ~ 8350 5200
Wire Wire Line
	8350 5200 8750 5200
Wire Wire Line
	8000 5550 8000 5200
Wire Wire Line
	8000 5200 8350 5200
Wire Wire Line
	8000 5850 8000 6200
Wire Wire Line
	8000 6200 8350 6200
Wire Wire Line
	8850 6200 8850 6100
Wire Wire Line
	8750 6100 8750 6200
Connection ~ 8750 6200
Wire Wire Line
	8750 6200 8850 6200
Wire Wire Line
	8350 5850 8350 6200
Connection ~ 8350 6200
Wire Wire Line
	8350 6200 8550 6200
Connection ~ 6650 6200
Wire Wire Line
	6650 6200 6850 6200
$Comp
L Device:R R?
U 1 1 5EF06AB6
P 9000 5000
AR Path="/5EF06AB6" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EF06AB6" Ref="R43"  Part="1" 
F 0 "R43" H 9070 5046 50  0000 L CNN
F 1 "10k" H 9070 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8930 5000 50  0001 C CNN
F 3 "~" H 9000 5000 50  0001 C CNN
	1    9000 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4750 9000 4850
Wire Wire Line
	8850 5200 9000 5200
Wire Wire Line
	9000 5200 9000 5150
Connection ~ 8850 5200
Wire Wire Line
	7100 5150 7100 5200
Wire Wire Line
	7100 5200 6950 5200
Connection ~ 6950 5200
Wire Wire Line
	7100 4750 7100 4850
Wire Wire Line
	6450 5200 6850 5200
Wire Wire Line
	7100 5200 7250 5200
Connection ~ 7100 5200
Wire Wire Line
	9000 5200 9250 5200
Connection ~ 9000 5200
$Comp
L SamacSys_Parts:4-1437565-1 SW?
U 1 1 5EF06AD6
P 6900 5700
AR Path="/5EF06AD6" Ref="SW?"  Part="1" 
AR Path="/5EEBB323/5EF06AD6" Ref="SW1"  Part="1" 
F 0 "SW1" V 6946 5522 50  0000 R CNN
F 1 "4-1437565-1" V 6855 5522 50  0000 R CNN
F 2 "SamacSys_Parts:FSM-SWITCH" H 7850 5850 50  0001 L CNN
F 3 "http://uk.rs-online.com/web/p/products/4791508P" H 7850 5750 50  0001 L CNN
F 4 "6x6mm SMD tactile switch,5mm H 1.6N Black Button Tactile Switch, SPST-NO 0.05 A@ 12 V dc 1.4mm" H 7850 5650 50  0001 L CNN "Description"
F 5 "" H 7150 5550 50  0001 L CNN "Height"
F 6 "4791508P" H 7850 5450 50  0001 L CNN "RS Part Number"
F 7 "http://uk.rs-online.com/web/p/products/4791508P" H 7850 5350 50  0001 L CNN "RS Price/Stock"
F 8 "TE Connectivity" H 7850 5250 50  0001 L CNN "Manufacturer_Name"
F 9 "4-1437565-1" H 7850 5150 50  0001 L CNN "Manufacturer_Part_Number"
F 10 "R1117787" H 7850 5050 50  0001 L CNN "Allied_Number"
	1    6900 5700
	0    -1   -1   0   
$EndComp
$Comp
L SamacSys_Parts:4-1437565-1 SW?
U 1 1 5EF06AE3
P 8800 5700
AR Path="/5EF06AE3" Ref="SW?"  Part="1" 
AR Path="/5EEBB323/5EF06AE3" Ref="SW2"  Part="1" 
F 0 "SW2" V 8846 5522 50  0000 R CNN
F 1 "4-1437565-1" V 8755 5522 50  0000 R CNN
F 2 "SamacSys_Parts:FSM-SWITCH" H 9750 5850 50  0001 L CNN
F 3 "http://uk.rs-online.com/web/p/products/4791508P" H 9750 5750 50  0001 L CNN
F 4 "6x6mm SMD tactile switch,5mm H 1.6N Black Button Tactile Switch, SPST-NO 0.05 A@ 12 V dc 1.4mm" H 9750 5650 50  0001 L CNN "Description"
F 5 "" H 9050 5550 50  0001 L CNN "Height"
F 6 "4791508P" H 9750 5450 50  0001 L CNN "RS Part Number"
F 7 "http://uk.rs-online.com/web/p/products/4791508P" H 9750 5350 50  0001 L CNN "RS Price/Stock"
F 8 "TE Connectivity" H 9750 5250 50  0001 L CNN "Manufacturer_Name"
F 9 "4-1437565-1" H 9750 5150 50  0001 L CNN "Manufacturer_Part_Number"
F 10 "R1117787" H 9750 5050 50  0001 L CNN "Allied_Number"
	1    8800 5700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EF06AE9
P 8550 6200
AR Path="/5EF06AE9" Ref="#PWR?"  Part="1" 
AR Path="/5EEBB323/5EF06AE9" Ref="#PWR084"  Part="1" 
F 0 "#PWR084" H 8550 5950 50  0001 C CNN
F 1 "GND" H 8555 6027 50  0000 C CNN
F 2 "" H 8550 6200 50  0001 C CNN
F 3 "" H 8550 6200 50  0001 C CNN
	1    8550 6200
	1    0    0    -1  
$EndComp
Connection ~ 8550 6200
Wire Wire Line
	8550 6200 8750 6200
Text HLabel 1650 3200 0    50   Input ~ 0
SPI_DS1302_CE
Text HLabel 1650 3300 0    50   BiDi ~ 0
SPI_IO
Text HLabel 1650 3400 0    50   Input ~ 0
SPI_SCLK
Text HLabel 4850 3150 0    50   Input ~ 0
VL53L1X_EN
Text HLabel 4850 3250 0    50   Output ~ 0
VL53L1X_IRQ
Text HLabel 5400 3350 0    50   BiDi ~ 0
I2C_SDA
Text HLabel 5400 3450 0    50   Input ~ 0
I2C_SCL
Text HLabel 7250 5200 2    50   Output ~ 0
ESP_IO0_B
Text HLabel 9250 5200 2    50   Output ~ 0
ESP_EN
Text HLabel 2650 5350 2    50   Output ~ 0
BTN_1
Text HLabel 3950 5350 2    50   Output ~ 0
BTN_2
Text HLabel 9300 3250 0    50   BiDi ~ 0
I2C_SDA
Text HLabel 9300 3350 0    50   Input ~ 0
I2C_SCL
Text HLabel 7100 4750 1    50   Output ~ 0
+3V3
Wire Wire Line
	5000 2700 5300 2700
Text HLabel 5150 2700 1    50   Output ~ 0
+3V3
Text HLabel 2050 2800 1    50   Output ~ 0
+3V3
Text HLabel 9200 3050 1    50   Output ~ 0
+3V3
Wire Wire Line
	6950 3150 7400 3150
Text HLabel 7150 3150 1    50   Output ~ 0
+3V3
Text HLabel 10300 2300 1    50   Output ~ 0
+3V3
Text HLabel 9000 4750 1    50   Output ~ 0
+3V3
Text HLabel 2050 4850 1    50   Output ~ 0
+3V3
Text HLabel 3350 4850 1    50   Output ~ 0
+3V3
Text Notes 5050 1200 0    200  ~ 0
PERIPHERALS
Text Notes 1900 1950 0    100  ~ 0
RTC CLOCK
Text Notes 5300 1950 0    100  ~ 0
DISTANCE SENSOR
Text Notes 9300 1950 0    100  ~ 0
STATUS LED
Text Notes 6450 4350 0    100  ~ 0
BOOT BUTTON
Text Notes 8250 4350 0    100  ~ 0
RESET BUTTON
Text Notes 2200 4350 0    100  ~ 0
USER BUTTONS
Wire Wire Line
	10500 3350 10500 3100
Wire Wire Line
	10500 2800 10500 2750
$Comp
L Device:R R?
U 1 1 5EECFDDF
P 10500 2950
AR Path="/5EECFDDF" Ref="R?"  Part="1" 
AR Path="/5EEBB323/5EECFDDF" Ref="R61"  Part="1" 
F 0 "R61" H 10500 3100 50  0000 L CNN
F 1 "20" H 10500 2800 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10430 2950 50  0001 C CNN
F 3 "~" H 10500 2950 50  0001 C CNN
	1    10500 2950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
