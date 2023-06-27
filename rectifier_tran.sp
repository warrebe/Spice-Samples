.title example_tran.sp

.include 1n4148.subckt
.include 2n4401.mod

Vin in gnd dc 0 sin(0 60 60) ;0v offset, 120V, 60hz signal

L1	in	gnd	780u
L2	in1	out2	100u
K1	L1	L2	1
xd1	in1	out3	1n4148
xd2	out2	out3	1n4148
xd3	out4	out2	1n4148
xd4	out4	in1	1n4148
C1	out3	out4	100u
R1	out3	out4	100		

.control
	set color0=white
	set color1=black
	set xbrushwidth =2
	op                ; analyze DC operating point 
	tran 20u 100m       ; plot every 20uS for 5mS
	plot v(in) v(out3) v(in1)                 
.endc

.end
