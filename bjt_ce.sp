Spice simulation of Source Degenerated CE BJT Circuit

* model
.include 2n4401.mod



vin	vcc	gnd	dc	10
R1	vcc	vb	31.2k
R2	vb	gnd	4.7k
R3	ve	gnd	100
* measurement source for Ic
vx	vcc	x	0
R4	x	vc	1k
* diode
Q1	vc	vb	ve	2n4401


.op
.control
run
print all
.endc
.end
