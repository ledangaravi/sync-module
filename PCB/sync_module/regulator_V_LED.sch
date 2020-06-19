EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3250 3750 0    50   Input ~ 0
IR_LED_EN
Connection ~ 4450 2950
Wire Wire Line
	4350 2950 4450 2950
Text HLabel 4350 2950 0    50   Input ~ 0
+V_SYS
Text HLabel 8550 2950 2    50   Output ~ 0
+V_LED
Connection ~ 8050 2950
Wire Wire Line
	8050 2950 8550 2950
Wire Wire Line
	3250 3750 3350 3750
Connection ~ 3350 3750
Connection ~ 3750 4300
Wire Wire Line
	3350 4300 3750 4300
Wire Wire Line
	3350 4150 3350 4300
Wire Wire Line
	3350 3750 3450 3750
Wire Wire Line
	3350 3850 3350 3750
$Comp
L Device:R R?
U 1 1 5F85C582
P 3350 4000
AR Path="/5E62A7D0/5F85C582" Ref="R?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C582" Ref="R13"  Part="1" 
AR Path="/5F78E3D7/5F85C582" Ref="R13"  Part="1" 
F 0 "R13" H 3200 3950 50  0000 C CNN
F 1 "100k" H 3150 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3280 4000 50  0001 C CNN
F 3 "~" H 3350 4000 50  0001 C CNN
	1    3350 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GSD Q?
U 1 1 5F85C57C
P 3650 3750
AR Path="/5E62A7D0/5F85C57C" Ref="Q?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C57C" Ref="Q1"  Part="1" 
AR Path="/5F78E3D7/5F85C57C" Ref="Q1"  Part="1" 
F 0 "Q1" H 3550 3900 50  0000 L CNN
F 1 "SI2302CDS" V 3900 3550 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3850 3850 50  0001 C CNN
F 3 "~" H 3650 3750 50  0001 C CNN
	1    3650 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C?
U 1 1 5F85C576
P 7800 3500
AR Path="/5E62A7D0/5F85C576" Ref="C?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C576" Ref="C20"  Part="1" 
AR Path="/5F78E3D7/5F85C576" Ref="C20"  Part="1" 
F 0 "C20" H 7500 3550 50  0000 L CNN
F 1 "220uF" H 7450 3450 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 7800 3500 50  0001 C CNN
F 3 "~" H 7800 3500 50  0001 C CNN
	1    7800 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3200 5650 3200
Connection ~ 5450 3200
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5F85C56E
P 5450 3200
AR Path="/5E62A7D0/5F85C56E" Ref="#FLG?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C56E" Ref="#FLG02"  Part="1" 
AR Path="/5F78E3D7/5F85C56E" Ref="#FLG02"  Part="1" 
F 0 "#FLG02" H 5450 3275 50  0001 C CNN
F 1 "PWR_FLAG" H 5450 3373 50  0000 C CNN
F 2 "" H 5450 3200 50  0001 C CNN
F 3 "~" H 5450 3200 50  0001 C CNN
	1    5450 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5F85C568
P 3750 2950
AR Path="/5E62A7D0/5F85C568" Ref="#PWR?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C568" Ref="#PWR027"  Part="1" 
AR Path="/5F78E3D7/5F85C568" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 3750 2800 50  0001 C CNN
F 1 "+3V3" H 3765 3123 50  0000 C CNN
F 2 "" H 3750 2950 50  0001 C CNN
F 3 "" H 3750 2950 50  0001 C CNN
	1    3750 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3000 3750 2950
Connection ~ 3750 3350
Wire Wire Line
	3750 3300 3750 3350
$Comp
L Device:R R?
U 1 1 5F85C558
P 3750 3150
AR Path="/5E62A7D0/5F85C558" Ref="R?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C558" Ref="R14"  Part="1" 
AR Path="/5F78E3D7/5F85C558" Ref="R14"  Part="1" 
F 0 "R14" H 3680 3104 50  0000 R CNN
F 1 "10k" H 3680 3195 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3680 3150 50  0001 C CNN
F 3 "~" H 3750 3150 50  0001 C CNN
	1    3750 3150
	1    0    0    1   
$EndComp
Wire Wire Line
	6050 4300 5650 4300
Connection ~ 6050 4300
$Comp
L power:GND #PWR?
U 1 1 5F85C550
P 6050 4300
AR Path="/5E62A7D0/5F85C550" Ref="#PWR?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C550" Ref="#PWR035"  Part="1" 
AR Path="/5F78E3D7/5F85C550" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 6050 4050 50  0001 C CNN
F 1 "GND" H 6055 4127 50  0000 C CNN
F 2 "" H 6050 4300 50  0001 C CNN
F 3 "" H 6050 4300 50  0001 C CNN
	1    6050 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3350 5650 3350
Wire Wire Line
	4850 3200 5450 3200
Wire Wire Line
	4450 2950 5900 2950
Connection ~ 4450 3200
Wire Wire Line
	4450 3200 4450 2950
Connection ~ 4850 4300
Wire Wire Line
	4450 4300 4850 4300
Connection ~ 4850 3200
Wire Wire Line
	4800 3200 4850 3200
Wire Wire Line
	4450 3200 4500 3200
$Comp
L Device:R R?
U 1 1 5F85C540
P 4650 3200
AR Path="/5E62A7D0/5F85C540" Ref="R?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C540" Ref="R16"  Part="1" 
AR Path="/5F78E3D7/5F85C540" Ref="R16"  Part="1" 
F 0 "R16" V 4443 3200 50  0000 C CNN
F 1 "20" V 4534 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4580 3200 50  0001 C CNN
F 3 "~" H 4650 3200 50  0001 C CNN
	1    4650 3200
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:PSMN5R2-60YL Q?
U 1 1 5F85C53A
P 7000 3200
AR Path="/5E62A7D0/5F85C53A" Ref="Q?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C53A" Ref="Q2"  Part="1" 
AR Path="/5F78E3D7/5F85C53A" Ref="Q2"  Part="1" 
F 0 "Q2" H 7204 3246 50  0000 L CNN
F 1 "BUK9Y59-60E" H 7204 3155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:LFPAK56" H 7150 3200 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PSMN5R2-60YL.pdf" H 7000 3200 50  0001 C CNN
	1    7000 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D?
U 1 1 5F85C534
P 7500 2950
AR Path="/5E62A7D0/5F85C534" Ref="D?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C534" Ref="D3"  Part="1" 
AR Path="/5F78E3D7/5F85C534" Ref="D3"  Part="1" 
F 0 "D3" H 7500 2734 50  0000 C CNN
F 1 "B540C-13-F" H 7500 2825 50  0000 C CNN
F 2 "Diode_SMD:D_SMC" H 7500 2950 50  0001 C CNN
F 3 "~" H 7500 2950 50  0001 C CNN
	1    7500 2950
	-1   0    0    1   
$EndComp
Connection ~ 8050 4300
Wire Wire Line
	8450 4300 8450 4000
Wire Wire Line
	8050 4300 8450 4300
Connection ~ 8450 3500
Wire Wire Line
	8450 3700 8450 3500
$Comp
L Device:C C?
U 1 1 5F85C529
P 8450 3850
AR Path="/5E62A7D0/5F85C529" Ref="C?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C529" Ref="C21"  Part="1" 
AR Path="/5F78E3D7/5F85C529" Ref="C21"  Part="1" 
F 0 "C21" H 8565 3896 50  0000 L CNN
F 1 "100pF" H 8565 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8488 3700 50  0001 C CNN
F 3 "~" H 8450 3850 50  0001 C CNN
	1    8450 3850
	1    0    0    -1  
$EndComp
Text Notes 4750 5350 0    50   ~ 0
switching frequency =( 4.503 * 10^11 / R ) ^ (1/1.26)\nR = 4.503 * 10^11 * f^-1.26\n\nVfb = 1.26V\nRf2 = (1.26 * Rf1) / (Vout - 1.26)\nVout = (1.26 * Rf1) / Rf2 +1.26\n(Vout - Rf1 - Vfb - Rf2 - GND)
Connection ~ 4450 4300
Wire Wire Line
	3750 4300 4450 4300
Wire Wire Line
	3750 3950 3750 4300
Wire Wire Line
	3750 3350 3850 3350
Wire Wire Line
	3750 3550 3750 3350
$Comp
L Device:R R?
U 1 1 5F85C51D
P 4000 3350
AR Path="/5E62A7D0/5F85C51D" Ref="R?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C51D" Ref="R15"  Part="1" 
AR Path="/5F78E3D7/5F85C51D" Ref="R15"  Part="1" 
F 0 "R15" V 3793 3350 50  0000 C CNN
F 1 "17.4k" V 3884 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3930 3350 50  0001 C CNN
F 3 "~" H 4000 3350 50  0001 C CNN
	1    4000 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 3800 4450 4300
Connection ~ 5100 4300
Wire Wire Line
	4850 4300 5100 4300
Wire Wire Line
	4850 3800 4850 4300
Wire Wire Line
	4450 3200 4450 3500
Wire Wire Line
	4850 3200 4850 3500
Wire Wire Line
	8050 3500 8050 3400
Connection ~ 8050 3500
Wire Wire Line
	6600 3350 6450 3350
Wire Wire Line
	6600 2650 6600 3350
Wire Wire Line
	8450 2650 6600 2650
Wire Wire Line
	8450 3500 8450 2650
Wire Wire Line
	8050 3500 8450 3500
Connection ~ 7800 2950
Wire Wire Line
	8050 2950 7800 2950
Wire Wire Line
	8050 3100 8050 2950
Wire Wire Line
	8050 3650 8050 3500
Connection ~ 7800 4300
Wire Wire Line
	8050 4300 8050 3950
Wire Wire Line
	7800 4300 8050 4300
Connection ~ 7100 4300
Wire Wire Line
	7800 4300 7800 3650
Wire Wire Line
	7100 4300 7800 4300
Connection ~ 7100 2950
Wire Wire Line
	7350 2950 7100 2950
Wire Wire Line
	7800 2950 7800 3350
Wire Wire Line
	7650 2950 7800 2950
Wire Wire Line
	7100 2950 6200 2950
Wire Wire Line
	7100 3000 7100 2950
Connection ~ 7100 3500
Wire Wire Line
	7100 3500 7100 3400
Wire Wire Line
	6450 3200 6800 3200
Connection ~ 6600 4300
Wire Wire Line
	7100 4300 7100 4050
Wire Wire Line
	6600 4300 7100 4300
Connection ~ 6450 4300
Wire Wire Line
	6600 4300 6600 4050
Wire Wire Line
	6450 4300 6600 4300
Wire Wire Line
	7100 3500 7100 3750
Wire Wire Line
	7000 3500 7100 3500
Wire Wire Line
	6600 3500 6700 3500
Connection ~ 6600 3500
Wire Wire Line
	6600 3750 6600 3500
Wire Wire Line
	6450 3500 6600 3500
Connection ~ 5650 4300
Wire Wire Line
	6450 4300 6050 4300
Wire Wire Line
	6450 3650 6450 4300
Connection ~ 5350 4300
Wire Wire Line
	5100 4300 5100 4050
Wire Wire Line
	5350 4300 5100 4300
Wire Wire Line
	5350 4300 5350 4250
Wire Wire Line
	5650 4300 5350 4300
Wire Wire Line
	5650 3650 5650 4300
Connection ~ 5350 3500
Wire Wire Line
	5100 3500 5350 3500
Wire Wire Line
	5100 3750 5100 3500
Wire Wire Line
	5350 3950 5350 3850
Wire Wire Line
	5350 3500 5650 3500
Wire Wire Line
	5350 3550 5350 3500
$Comp
L Device:R R?
U 1 1 5F85C4DC
P 8050 3250
AR Path="/5E62A7D0/5F85C4DC" Ref="R?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4DC" Ref="R20"  Part="1" 
AR Path="/5F78E3D7/5F85C4DC" Ref="R20"  Part="1" 
F 0 "R20" H 8120 3296 50  0000 L CNN
F 1 "100k" H 8120 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7980 3250 50  0001 C CNN
F 3 "~" H 8050 3250 50  0001 C CNN
	1    8050 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F85C4D6
P 8050 3800
AR Path="/5E62A7D0/5F85C4D6" Ref="R?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4D6" Ref="R21"  Part="1" 
AR Path="/5F78E3D7/5F85C4D6" Ref="R21"  Part="1" 
F 0 "R21" H 8120 3846 50  0000 L CNN
F 1 "12k" H 8120 3755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7980 3800 50  0001 C CNN
F 3 "~" H 8050 3800 50  0001 C CNN
	1    8050 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F85C4D0
P 7100 3900
AR Path="/5E62A7D0/5F85C4D0" Ref="R?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4D0" Ref="R19"  Part="1" 
AR Path="/5F78E3D7/5F85C4D0" Ref="R19"  Part="1" 
F 0 "R19" H 7170 3946 50  0000 L CNN
F 1 "12m" H 7170 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 7030 3900 50  0001 C CNN
F 3 "~" H 7100 3900 50  0001 C CNN
	1    7100 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F85C4CA
P 6850 3500
AR Path="/5E62A7D0/5F85C4CA" Ref="R?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4CA" Ref="R18"  Part="1" 
AR Path="/5F78E3D7/5F85C4CA" Ref="R18"  Part="1" 
F 0 "R18" V 6650 3500 50  0000 C CNN
F 1 "100" V 6734 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6780 3500 50  0001 C CNN
F 3 "~" H 6850 3500 50  0001 C CNN
	1    6850 3500
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F85C4C4
P 5350 4100
AR Path="/5E62A7D0/5F85C4C4" Ref="R?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4C4" Ref="R17"  Part="1" 
AR Path="/5F78E3D7/5F85C4C4" Ref="R17"  Part="1" 
F 0 "R17" H 5420 4146 50  0000 L CNN
F 1 "5.1k" H 5420 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5280 4100 50  0001 C CNN
F 3 "~" H 5350 4100 50  0001 C CNN
	1    5350 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F85C4BE
P 6600 3900
AR Path="/5E62A7D0/5F85C4BE" Ref="C?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4BE" Ref="C19"  Part="1" 
AR Path="/5F78E3D7/5F85C4BE" Ref="C19"  Part="1" 
F 0 "C19" H 6715 3946 50  0000 L CNN
F 1 "16pF" H 6715 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6638 3750 50  0001 C CNN
F 3 "~" H 6600 3900 50  0001 C CNN
	1    6600 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F85C4B8
P 4850 3650
AR Path="/5E62A7D0/5F85C4B8" Ref="C?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4B8" Ref="C16"  Part="1" 
AR Path="/5F78E3D7/5F85C4B8" Ref="C16"  Part="1" 
F 0 "C16" H 4850 3450 50  0000 R CNN
F 1 "100nF" H 4850 3550 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4888 3500 50  0001 C CNN
F 3 "~" H 4850 3650 50  0001 C CNN
	1    4850 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5F85C4B2
P 4450 3650
AR Path="/5E62A7D0/5F85C4B2" Ref="C?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4B2" Ref="C15"  Part="1" 
AR Path="/5F78E3D7/5F85C4B2" Ref="C15"  Part="1" 
F 0 "C15" H 4335 3604 50  0000 R CNN
F 1 "47uF" H 4335 3695 50  0000 R CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 4488 3500 50  0001 C CNN
F 3 "~" H 4450 3650 50  0001 C CNN
	1    4450 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5F85C4AC
P 5100 3900
AR Path="/5E62A7D0/5F85C4AC" Ref="C?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4AC" Ref="C17"  Part="1" 
AR Path="/5F78E3D7/5F85C4AC" Ref="C17"  Part="1" 
F 0 "C17" H 4850 3900 50  0000 L CNN
F 1 "560pF" H 4850 3800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5138 3750 50  0001 C CNN
F 3 "~" H 5100 3900 50  0001 C CNN
	1    5100 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F85C4A6
P 5350 3700
AR Path="/5E62A7D0/5F85C4A6" Ref="C?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4A6" Ref="C18"  Part="1" 
AR Path="/5F78E3D7/5F85C4A6" Ref="C18"  Part="1" 
F 0 "C18" H 5465 3746 50  0000 L CNN
F 1 "8.2nF" H 5465 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5388 3550 50  0001 C CNN
F 3 "~" H 5350 3700 50  0001 C CNN
	1    5350 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5F85C4A0
P 6050 2950
AR Path="/5E62A7D0/5F85C4A0" Ref="L?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C4A0" Ref="L3"  Part="1" 
AR Path="/5F78E3D7/5F85C4A0" Ref="L3"  Part="1" 
F 0 "L3" V 6240 2950 50  0000 C CNN
F 1 "8.2uH" V 6149 2950 50  0000 C CNN
F 2 "my_library:L_12.5x12.5mm_H6mm" H 6050 2950 50  0001 C CNN
F 3 "~" H 6050 2950 50  0001 C CNN
	1    6050 2950
	0    -1   -1   0   
$EndComp
$Comp
L my_library:LM3478 U?
U 1 1 5F85C49A
P 6050 3400
AR Path="/5E62A7D0/5F85C49A" Ref="U?"  Part="1" 
AR Path="/5E62A7D0/5F78E3D7/5F85C49A" Ref="U3"  Part="1" 
AR Path="/5F78E3D7/5F85C49A" Ref="U3"  Part="1" 
F 0 "U3" H 5800 3700 50  0000 C CNN
F 1 "LM3478" H 6200 3700 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6050 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm3478.pdf" H 6000 3450 50  0001 C CNN
	1    6050 3400
	1    0    0    -1  
$EndComp
Text Notes 9250 2800 0    50   ~ 0
+V_LED = 2.65*4+0.7=11.3\n
Text Notes 9250 3000 0    50   ~ 0
2.65 V forward voltage
Text Notes 4650 1200 0    200  ~ 0
V_LED REGULATOR
$EndSCHEMATC