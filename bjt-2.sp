BJT Full Model

* Don't change this line
.options post node ingold = 1 runlvl = 0 relv = 0.001 reli = 0.001 DCAP = 1

* This following statements specify the connection nodes/circuit

*  c b e
Q1 2 1 0 bjt
R2 1 3 1.5k
R1 4 2 11k

* Choose appropriate biasing voltages below.
Vcc 4 0 DC 1
Vin 3 0 pwl 0n 0V, 1n 0, 1.00001n 0.75V, 2n 0.75V, 2.00001n 0V, R 0n

* Please edit the values below from what you calculated in part A.
* IS in Amperes, CJE & CJC in Farads, VJE, VJC, VAF & VAR in Volts
* TF & TR in seconds
* The symbol descriptions can be found in the HSPICE presentation or online
*-----------------MODEL STATEMENTS-----------------------------

.MODEL bjt NPN(BF = 3.6431 BR = .17 IS = 5.408088909040969e-20 CJE = 2.363228969470200e-15 CJC = 1.161805434259187e-16 VJE = 0.955822326215811 VJC = 0.792007842652018
+VAF = 1.654665922030206e+02 VAR = 8.134632254991157 TF = 2.178425047764497e-11 TR = 5.644809124424925e-10 MJE = 0.5 MJC = 0.5 EG = 0.144395096656015)

*------------------------------------------------------------
* Uncomment the following model statement to simulate using a simpler model.
* Do not forget to comment the previous model statement when this is in use.

*.MODEL bjt NPN(BF = 3.6431 BR = .17 IS = 5.408088909040969e-20)

*----------------------VOLTAGE SWEEPS----------------------------
* This does a voltage sweep for the 4 given points.  Modify the statement to
* correspond to the bias voltages that you need.
* Syntax: ".DC Vce <Start> <Stop> <Step> Vbe <no of points> <pt1> <pt2> etc.

*.DC Vce 0 2 0.01 Vbe POI 1 1.7

* Uncomment and modify the following sweep to obtain a gummel plot at
* a given Vce voltage

*.DC Vbe 0 1 0.01 Vce POI 1 1.7

*-----------------PRINT OUTPUTS--------------------------
* I3(Q1) is collector current (Amp) & I2(Q1) is base current
.PRINT DC V(2) I3(Q1) I2(Q1)
.PLOT DC V(2) I3(Q1) I2(Q1)

* Uncomment this statement to perform an operating point analysis
.tran 5n 50n

.END