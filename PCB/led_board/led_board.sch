EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Device:LED D1
U 1 1 5E86E3B3
P 5400 3600
F 0 "D1" V 5439 3483 50  0000 R CNN
F 1 "LED" V 5348 3483 50  0000 R CNN
F 2 "my_library:SFH4726AS" H 5400 3600 50  0001 C CNN
F 3 "~" H 5400 3600 50  0001 C CNN
	1    5400 3600
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5E8718BE
P 6150 3450
F 0 "H1" V 6104 3600 50  0000 L CNN
F 1 "MountingHole_Pad" V 6195 3600 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_Pad" H 6150 3450 50  0001 C CNN
F 3 "~" H 6150 3450 50  0001 C CNN
	1    6150 3450
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5E8723DA
P 6150 3700
F 0 "H2" V 6104 3850 50  0000 L CNN
F 1 "MountingHole_Pad" V 6195 3850 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_Pad" H 6150 3700 50  0001 C CNN
F 3 "~" H 6150 3700 50  0001 C CNN
	1    6150 3700
	0    1    1    0   
$EndComp
NoConn ~ 6050 3450
NoConn ~ 6050 3700
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5E87441F
P 5150 3250
F 0 "J1" H 5300 3100 50  0000 C CNN
F 1 "Conn_01x02" H 5500 3200 50  0000 C CNN
F 2 "Connector_Wire:SolderWirePad_1x02_P3.81mm_Drill1.2mm" H 5150 3250 50  0001 C CNN
F 3 "~" H 5150 3250 50  0001 C CNN
	1    5150 3250
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5E875A5E
P 5150 3850
F 0 "J2" H 5300 3900 50  0000 C CNN
F 1 "Conn_01x02" H 5500 3800 50  0000 C CNN
F 2 "Connector_Wire:SolderWirePad_1x02_P3.81mm_Drill1.2mm" H 5150 3850 50  0001 C CNN
F 3 "~" H 5150 3850 50  0001 C CNN
	1    5150 3850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5400 3250 5400 3350
Wire Wire Line
	5350 3250 5400 3250
Wire Wire Line
	5350 3350 5400 3350
Connection ~ 5400 3350
Wire Wire Line
	5400 3350 5400 3450
Wire Wire Line
	5400 3750 5400 3850
Wire Wire Line
	5350 3850 5400 3850
Connection ~ 5400 3850
Wire Wire Line
	5400 3850 5400 3950
Wire Wire Line
	5350 3950 5400 3950
$EndSCHEMATC
