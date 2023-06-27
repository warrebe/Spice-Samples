*controls
.option
$ Enable post-processing
+ post ingold=1

.title Filter.sp

.OP

Vin n1 gnd AC=1 SIN 0 10k 0 0 180

Vdc v1 gnd 5

R1 n1 n2 .1753k
R2 n2 gnd 51
C1 n2 n3 1p
C2 n2 n4 1p
R3 n3 n4 53.84k
Xopamp1 gnd n3 v1 gnd n4 LMC6032/NS

R4 n4 n5 .1646k
R5 n5 gnd 48
C3 n5 n6 1p
C4 n5 vout 1p
R6 n6 vout 50.56k
Xompamp2 gnd n6 v1 gnd vout LMC6032/NS

.AC DEC 100 10000k 1G
*.NET V(vout) vin
.PRINT AC Vdb(vout)
.PRINT V(vout)
.PROBE V(vout)
*.PRINT I(C1)
*.PROBE I(C1)

.SUBCKT LMC6032/NS  1   2  99  50  28
* CAUTION:  SET .OPTIONS GMIN=1E-16 TO CORRECTLY MODEL INPUT BIAS CURRENT.
*
* Features:
* Operates from single supply
* Rail-to-rail output swing
* Low offset voltage (max) =             9mV
* Ultra low input current =              2fA
* Slew rate =                        1.1V/uS
* Gain-bandwidth product =           1.4 MHz 
* Low supply current =                 375uA/Amplifier
*
* NOTE: - Model is for single device only and simulated
*         supply current is 1/2 of total device current.
*       - Noise is not modeled.
*       - Asymmetrical gain is not modeled.
*
CI1 1  50 2P
CI2 2  50 2P
* 1.4 Hz pole capacitor
C3  98 9  11.35N
* 2.95 MHz pole capacitor
C4  6  5  4.93P
* Drain-substrate capacitor
C6  50 4  10P
* 35 MHz pole capacitor
C7  98 11 4.54F
DP1 1  99 DA
DP2 50 1  DX
DP3 2  99 DB
DP4 50 2  DX
D1  9  8  DX
D2  10 9  DX
D3  15 20 DX
D4  21 15 DX
D5  26 24 DX
D6  25 27 DX
D7  22 99 DX
D8  50 22 DX
D9  0  14 DX
D10 12 0  DX
EH  97 98 99    49 1.0
EN  0  96 0     50 1.0
* Input offset voltage -|
EOS 7  1  POLY(1) 16 49 9M 1
EP  97 0  99    0  1.0
E1  97 19 99    15 1.0
* Sourcing load +Vs current
F1  99 0  VA2   1
* Sinking load -Vs current
F2  0  50 VA3   1
F3  13 0  VA1   1
G1  98 9  5     6  0.1
G2  98 11 9     49 1U
G3  98 15 11    49 1U
* DC CMRR
G4  98 16 POLY(2) 1 49 2 49 0 3.54E-8 3.54E-8
I1  99 4  48.19U
I2  99 50 308.1U
* Load dependent pole
L1  22 28 40.4U
* CMR lead
L2  16 17 7.95M
M1  5  2  4     99 MX
M2  6  7  4     99 MX
R3  5  50 5.47K
R4  6  50 5.47K
R5  98 9  1E7
R8  99 49 133.3K
R9  49 50 133.3K
R12 98 11 1E6
R13 98 17 1K
* -Rout
R16 23 24 75
* +Rout
R17 23 25 70
* +Isc slope control
R18 20 29 144.6K
* -Isc slope control
R19 21 30 185K
R21 98 15 1E6
R22 22 28 900
VA1 19 23 0V
VA2 14 13 0V
VA3 13 12 0V
V2  97 8  0.721V
V3  10 96 0.721V
V4  29 22 0.63V
V5  22 30 0.63V
V6  26 22 0.63V
V7  22 27 0.63V
.MODEL  DA D    (IS=1.3E-14)
.MODEL  DB D    (IS=1.2E-14)
.MODEL  DX D    (IS=1.0E-14)
.MODEL  MX PMOS (VTO=-2.45 KP=7.0547E-4)
.ENDs
.end

