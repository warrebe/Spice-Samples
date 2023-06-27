.title example_tran.sp

.include 2n4401.mod

Vin in gnd dc 0 sin(0 1 10000); 0v offset, 1V, 10Khz signal

R1    in         out               1K
C1    out        gnd               .1u

.control
	set color0=white
	set color1=black
	set xbrushwidth =2
	op                ; analyze DC operating point 
	tran 20u 5m       ; plot every 20uS for 5mS
	plot v(in) v(out)                 
.endc

.end
