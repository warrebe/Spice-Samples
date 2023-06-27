*BJT Full Model

* Don't change this line
.options post node ingold = 1 runlvl = 0 relv = 0.001 reli = 0.001 DCAP = 1

* This following statements specify the connection nodes/circuit
Q1 1 2 0 bjt
*R1 v1 b 1.5k
*R2 v2 c  11k

* Choose appropriate biasing voltages below.
Vce 1 0 DC 1
Vbe 2 0 DC 0.75

*Vc v2 0 DC 1
*Vb v1 0 pwl 0n 0v, 1n 0, 1.00001n 0.75v, 2n 0.75v, 2.00001 0v, R 0n
*Vb v1 0 pwl 0n 0V, 1n 0, 1.00001n 0.75V, 2n 0.75V, 2.00001n 0V, R 0n
* Please edit the values below from what you calculated in part A.
* IS in Amperes, CJE & CJC in Farads, VJE, VJC, VAF & VAR in Volts
* TF & TR in seconds
* The symbol descriptions can be found in the HSPICE presentation or online
*-----------------MODEL STATEMENTS-----------------------------

*.MODEL bjt NPN(BF = 500 BR = 2 IS = 1e-19 CJE = 1e-22 CJC = 1e-24 VJE = 0.9 VJC = 0.7
*+VAF = 5 VAR = 1e5 TF = 1e-6 TR = 1e-10 MJE = 0.5 MJC = 0.5 EG = 1.12)
.MODEL bjt NPN(BF = 3.64305877278132 BR = 0.169964294329459 IS = 5.40808890904097e-20 CJE = 2.363228969470200e-15 CJC = 1.161805434259187e-16 VJE = 0.955822326215811 VJC = 0.792007842652018 +VAF = 165.466592203021 VAR = 8.13463225499116 TF = 2.17842504776450e-11 TR = 5.64480912442493e-10 MJE = 0.5 MJC = 0.5 EG = 0.144395096656015)
*------------------------------------------------------------
* Uncomment the following model statement to simulate using a simpler model.
* Do not forget to comment the previous model statement when this is in use.

*.MODEL bjt NPN(BF = 500 BR = 2 IS = 1e-19 )

*----------------------VOLTAGE SWEEPS----------------------------
* This does a voltage sweep for the 4 given points.  Modify the statement to
* correspond to the bias voltages that you need.
* Syntax: ".DC Vce <Start> <Stop> <Step> Vbe <no of points> <pt1> <pt2> etc.

* Uncomment and modify the following sweep to obtain a gummel plot at
* a given Vce voltage

*.DC Vbe 0.1 1 0.01 Vce POI 1 1.7

*-----------------PRINT OUTPUTS--------------------------
* I3(Q1) is collector current (Amp) & I2(Q1) is base current
*.PRINT DC V(2) I3(Q1) I2(Q1)
*.PLOT DC V(2) I3(Q1) I2(Q1)

* Uncomment this statement to perform an operating point analysis
.op

.END

