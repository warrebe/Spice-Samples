$SPICE circuit operates a MOSFET

.options post node ingold=1 runlvl=0 relv=0.001 reli=0.001 DCAP=1


$Define MOSFET model here
$VTO - Zero-bias theshold voltage calculated from MATLAB (Volts)
$UO - Channel inversion mobility (cm2/V.s)
$NSUB - P Substrate doping (cm^/3)
$TOX - Oxide thickness (in meters)
$XJ - S/D junction width (in meters)

.MODEL MOS202 NMOS (LEVEL=2 VTO=0.64458 UO=60 NSUB=2*10^17 TOX=1.1*10^-8 XJ=150*10^-6 LD=0)

$Define the MOSFET HERE
$ Name Drain  Gate   Source  Body  Model  Width  Length
M1 1 2 0 3 MOS202 W=1U L=0.4U

$Voltage sources <DEFINE NETLIST HERE>
$SourceName Node1 Node2 DC BiasVoltage
$Use 0 as a node for connecting to ground.

Vgs 2 0 DC
Vds 1 0 DC 
Vbs 3 0 DC 0

$define the voltages and Print below
$ Output curve sweep <Enter sweep voltages>

*.DC Vds 0 2 0.01 Vgs POI 5 0 1.4 1.8 2.2 2.6

$ Transfer curve sweep <Enter sweep voltages>
.DC Vgs 0 3 0.01 Vds POI 4 0.1 0.3 0.6 0.9

$ [ECE 517 Only] Backgate bias sweep <Enter sweep voltages>

$.DC Vgs  Vbs

$.OP

.END
