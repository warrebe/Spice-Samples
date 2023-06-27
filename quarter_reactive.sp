Match 90+j88 load with quarter wave matching network

*transmitter with 50 ohm output at 78Mhz
Vin   vin  0   ac 1.0 sin(0 1.0 78e6)
rsrc  vin  A   50 ;transmitter output Zo

*2.0 wavelength long T-line 
t1   A  gnd  B  gnd  z0=50  F=78Meg  NL=2.0

*quarter wave matching coax section
t3   B  gnd  C  gnd z0=97.47 F=78Meg  NL=.25
*edit this

*from matching section to load 
2   C  gnd  D  gnd z0=50  F=78Meg  NL=.047
*edit this

*reactive load: 90+j88 ohms
*l = 2*pi*f*88 = 179.56nH
rload D   tie  90     
lload tie gnd  179.56nH 

.control
* set hcopydevtype=postscript
* set hcopydev=kec3112-clr
 set hcopypscolor=1   
 set color0=rgb:f/f/f
 set color1=rgb:0/0/0
 ac lin 100 58Meg 98Meg 

*plot T-line input impedance directly
plot (50*vm(A))/(vm(vin,A))

*hardcopy temp.ps  vm(vin) vm(vin,t1_in)  vm(join_in)
.endc
.end

