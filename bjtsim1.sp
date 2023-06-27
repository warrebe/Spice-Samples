*controls
.options post node ingold = 1 runlvl = 0 relv = 0.001 DCAP = 1

.title bjtsim1.sp

.OP

Q1 1 2 0 bjt

*Biasing Voltages
Vce 1 0 DC 0
Vbe 2 0 DC 0

*Model Statement
.MODEL bjt NPN(BF = 3.643 BR = 0.169 IS = 5.408*10^-20
+ CJE = 6.363*10^-15 CJC = 1.162*10^-16 VJE = 0.9956
+ VJC = 0.792 VAF = 8.135 VAR = 165.47 TF = 2.178*10^-11
+ TR = 5.645*10^-11 MJE = 0.5 MJC = 0.5 EG = 1.12 )

*Voltage Sweep
.DC Vce 0 5 0.01 Vbe POI 4 0 1 2 3

*Print Outputs
.PRINT DC V(2) I3(Q1) I2(Q1)

.PLOT DC V(2) I3(Q1) I2(Q1)

.end
