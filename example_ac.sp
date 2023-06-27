.title example_tran.sp

.include 2n4401.mod

Vin in gnd ac=1 ; for swept source

R1    out         gnd               10K
C1    in          out               .01u

.control
	set color0=white
	set color1=black
	set xbrushwidth =2
	op                ; analyze DC operating point 
	ac dec 10 1 1meg ; AC small sig analysis; decade variation, 10 points per decade, 1 hz to 1mhz
	plot v(in) v(out)                 
.endc

.end
