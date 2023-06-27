*T-line with lumped match
  
*Match located at 0.149 lambda 
*Lambda is 7.09 meters at 29.7Mhz
*The reactive load is 75+j25. 
*System impedance is 50 ohms.

*transmitter with 50 ohm output
*Vin vin 0 ac 1.0 sin(0 1.0 29.6e6)
Vin   vin  0  ac 1.0 sin(0 1.0 29.6e6)
rsrc  vin  A  50 ;transmitter output Zo 

*arbitrarily long (2 lambda) piece of coax 
t1 A 0   B 0  z0=50 F=29.6Meg NL=2    
*1.06 meter long coax is 0.149 lambda
t2 C 0   D 0  z0=50 F=29.6Meg NL=0.149

*matching inductor at match point
lmatch B  C  155nH 

*complex load 75+25j at 29.6Mhz
rload D           join_load   75       
lload join_load   0           134.5nH

.control
* set hcopydevtype=postscript
 *set hcopydev=kec3112-clr
* set hcopypscolor=true
 set color0=rgb:f/f/f
 set color1=rgb:0/0/0
 ac lin 100 10M 50Meg 
 plot vm(A)/(vm(vin,A)/50) ;plot zin directly
* hardcopy temp.ps  vm(tl_in) vm(vin,tl_in)  
.endc

.end
