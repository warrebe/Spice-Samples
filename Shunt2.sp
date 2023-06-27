T-line with shunt stub match

*Short circuit shunt stub at position A is given 
*Stub is located at: 
*0.099 lambda = 0.2515 meters (stub position A)

*Lambda is 2.54 meters at 78Mhz
*The reactive load is 90+j88. 
*System impedance is 50 ohms.

*transmitter with 50 ohm output at 78Mhz
Vin   vin  0   ac 1.0 sin(0 1.0 78e6)
rsrc  vin  A   50 ;transmitter Zo  

*T-line from transmitter to stub w/ Lambda = 2.0
t1   A  0   B 0  z0=50 F=78Meg  NL=2.0

************ position A Short ckt stub ****************
*position A:        0.220 lambda or 0.559m from antenna
*open circuit stub: 0.099 lambda or 0.2515m long
*stub represents inductive susceptance of B=-j1.4

*T-line from antenna to stub
t2   B  0    C 0 z0=50 F=78Meg NL=.220
*0.099 lambda shunt (short ckt) stub 
t3   B  0  t3_out t3_out  z0=50 F=78Meg NL=.099

*high value resistors to prevent floating nodes 
r1   t3_out      0 10e6
r2   t3_out_rtn  0 10e6
r3   t1_out      0 10e6

*complex load 90+88j at 78Mhz
rload C         tie_load   90       
lload tie_load         0   179.56nH 

.control
* set hcopydevtype=postscript
* set hcopydev=kec3112-clr
* set hcopypscolor=true
 set color0=rgb:f/f/f
 set color1=rgb:0/0/0
 ac lin 200 70Meg 90Meg 

*plot T-line input impedance directly
plot (50*vm(A))/(vm(vin,A))
*output plot in postscript format
*hardcopy temp.ps  vm(vin) vm(vin,t1_in)  vm(join_in)
.endc

.end
