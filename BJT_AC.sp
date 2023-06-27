.title bjt_ac_new.sp

.include 2n4401.mod

* this is the voltage source for the ac sweep:
Vin in gnd ac=0.03 

Vcc   vcc         gnd                9v
C2    collector   out                0.1u
C1    in          base               0.1u
R1    vcc         base               31.2K
R2    base        gnd                4.7K
R3    emitter     gnd                100
R4    vcc         collector          1K
R5    out         gnd                2.2K
R6    vcc	  in		     2.2k
Q1    collector   base      emitter  2n4401 

.control
  set hcopydevtype=postscript
  set hcopypscolor=true
  set color0=rgb:f/f/f
  set color1=rgb:0/0/0

* these are the simulations
  op                : analyze DC operating point 
  ac dec 10 1 1meg ; AC small sig analysis

* these are the plots of the simulation results
  plot vm(in) vm(out)                   ; plot AC magnitude 
  plot vdb(in)-vdb(in) vdb(out)-vdb(in) ; plot AC magnitude in dB
*  plot ph(out)*180/3.14                 ; plot AC phase

* use this to save a plot as a postscript file
*  hardcopy out.ps vm(in) vm(out)
.endc

.end
