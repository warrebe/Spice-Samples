*T-line with lumped match
  
*Match located at 0.120 lambda 
*Lambda is 2.54 meters at 78Mhz
*The reactive load is 90+j88. 
*System impedance is 50 ohms.

*transmitter with 50 ohm output
*Vin vin 0 ac 1.0 sin(0 1.0 78e6)
Vin   vin  0  ac 1.0 sin(0 1.0 78e6)
rsrc  vin  A  50 ;transmitter output Zo 

*arbitrarily long (2 lambda) piece of coax 
t1 A 0   B 0  z0=50 F=78Meg NL=2    
*0.213 meter long coax is 0.453 lambda
t2 C 0   D 0  z0=50 F=78Meg NL=0.120

*matching inductor at match point
lmatch B  C  153.03nH

*complex load 90+j88 at 78Mhz
rload D           join_load   90       
lload join_load   0           179.56nH

.control
* set hcopydevtype=postscript
 *set hcopydev=kec3112-clr
* set hcopypscolor=true
 set color0=rgb:f/f/f
 set color1=rgb:0/0/0
 ac lin 100 60Meg 110Meg 
 plot vm(A)/(vm(vin,A)/50) ;plot zin directly
* hardcopy temp.ps  vm(tl_in) vm(vin,tl_in)  
.endc

.end
