T-line with shunt stub match

*Open and short circuit shunt stubs at both positions are given 
*Stub are located at: 
* 0.194 lambda = 1.38 meters (stub position A)

*Lambda is 7.09 meters at 29.7Mhz
*The reactive load is 75+j25. 
*System impedance is 50 ohms.

*transmitter with 50 ohm output at 29.6Mhz
Vin   vin  0   ac 1.0 sin(0 1.0 29.6e6)
rsrc  vin  A   50 ;transmitter Zo  

*arbitrarily long T-line from transmitter to stub
t1   A  0   B 0  z0=50 F=29.6Meg  NL=2.0

************ position A open ckt stub ****************
*position A:        0.194 lambda or 1.38m from antenna
*open circuit stub: 0.414 lambda or 2.94m long
*stub represents inductive susceptance of B=-j0.6

*T-line from antenna to stub
t2   B  0    C 0 z0=50 F=29.6Meg NL=.194
*0.414 lambda shunt (open ckt) stub 
t3   B  0   t3_out  t3_out_rtn  z0=50 F=29.6Meg NL=.414

*high value resistors to prevent floating nodes 
r1   t3_out      0 10e6
r2   t3_out_rtn  0 10e6
r3   t1_out      0 10e6

*complex load 75+25j at 29.6Mhz
rload C         tie_load   75       
lload tie_load         0   134.5nH 

.control
* set hcopydevtype=postscript
* set hcopydev=kec3112-clr
* set hcopypscolor=true
 set color0=rgb:f/f/f
 set color1=rgb:0/0/0
 ac lin 200 20Meg 40Meg 

*plot T-line input impedance directly
plot (50*vm(A))/(vm(vin,A))
*output plot in postscript format
*hardcopy temp.ps  vm(vin) vm(vin,t1_in)  vm(join_in)
.endc

.end


