*controls
.option
$ Enable post-processing
+ post ingold=1
+ numdgt=4	$ print 4 digits 
+ co = 132	$ 132-column output
+ post

Vin g4 4 AC=1 SIN 0 10K 0 0 180
vdd s1 0 1.8
vt1 g1 0 1.264
vt2 g2 0 1.158
vt3 g3 0 .63
vt4 4 0 .6

M1 d1 g1 s1 s1 CMOSP W=40um L=360nm
M2 vout g2 d1 d1 CMOSP W=20um L=180nm
M3 vout g3 s3 s3 CMOSN W=10um L=180nm
M4 s3 g4 s4 s4 CMOSN W=10um L=180nm

R s4 0 1kohms

C1 vout 0 1u
*Is vout 0 AC=1 SIN 0 10k 0 0 180

.AC DEC 100 1 1G
.NET V(vout) vin
.PRINT AC Vdb(vout)
.PRINT V(vout)
.PROBE V(vout)
*.PRINT I(C1)
*.PROBE I(C1)

*.MEASURE AC AdB FIND VdB(vout) AT=10K		$ Measure the gain at 10kHz.

.MODEL CMOSN NMOS (                                LEVEL   = 49
+ tnom=25 version=3.1 tox=4.0e-9 xj=1.6e-7 nch=3.9e+17
+ lln=1 lwn=1 wln=1 wwn=1 lint=1e-8 ll=0 lw=0 lwl=0 wint=1e-8 wl=0 ww=0 wwl=0
+ mobmod=1 binunit=2 xl=-2e-8 xw=0 dwg=0 dwb=0 ldif=9e-8
+ hdif=2e-7 rsh=6.8 rd=0 rs=0 vth0=0.48 lvth0=1.18e-8 wvth0=-7.08e-9
+ pvth0=-3.07e-15 k1=0.49 lk1=4.82e-8 wk1=-1.67e-8 pk1=-4.58e-15
+ k2=0.03 lk2=-2.01e-8 wk2=6.03e-10 pk2=5.87e-16 k3=0 dvt0=0 dvt1=0
+ dvt2=0 dvt0w=0 dvt1w=0 dvt2w=0 nlx=0 w0=0 k3b=0 vsat=84638 lvsat=-0.0002
+ wvsat=0.001 pvsat=1.71e-11 ua=-5.07e-10 lua=-5.58e-17 wua=-4.34e-17
+ pua=2.42e-23 ub=1.98e-18 lub=4.99e-26 wub=-2.70e-26 pub=-5.53e-32
+ uc=7.19e-11 luc=1.46e-17 wuc=-3.71e-19 puc=-1.43e-23 rdsw=170
+ prwb=0 prwg=0 wr=1 u0=0.04 lu0=5.93e-10 wu0=-5.39e-10 pu0=5.68e-16
+ a0=0.54 la0=7.71e-8 wa0=1.31e-7 pa0=-6.57e-14 keta=-0.027
+ lketa=1.75e-9 wketa=2.62e-9 pketa=-9.24e-16 a1=0 a2=0.99 ags=0.039
+ lags=-8.58e-9 wags=-1.49e-9 pags=6.84e-16 b0=0 b1=0 voff=-0.13
+ lvoff=1.25e-10 wvoff=5.07e-9 pvoff=-2.82e-15 nfactor=1 cit=0.0002
+ lcit=1.32e-10 wcit=4.29e-11 pcit=-1.97e-17 cdsc=0 cdscb=0 cdscd=0 eta0=-0.0003
+ leta0=1.93e-10 weta0=3.35e-11 peta0=-1.54e-17 etab=0.0014 letab=-6.99e-10
+ wetab=-4.11e-11 petab=1.89e-17 dsub=0 pclm=0.97 lpclm=7.37e-8
+ wpclm=2.16e-7 ppclm=-1.59e-15 pdiblc1=1e-6 pdiblc2=-0.0035 lpdiblc2=4.38e-9
+ wpdiblc2=-1.24e-9 ppdiblc2=5.71e-16 pdiblcb=0.01 drout=0 pscbe1=4e+08
+ pscbe2=1e-6 pvag=0 delta=0.01 alpha0=6.27e-8 beta0=11.60 kt1=-0.23
+ lkt1=1.96e-9 wkt1=1.35e-9 pkt1=1.97e-15 kt2=-0.027 lkt2=-3.83e-10
+ wkt2=-5.19e-9 pkt2=1.23e-15 at=20000 ute=-1.09 lute=-6.90e-8
+ wute=-4.80e-7 pute=6.18e-14 ua1=1.22e-9 ub1=-5.72e-20 lub1=-1.26e-25
+ wub1=-1.61e-24 pub1=2.31e-31 uc1=1.07e-10 luc1=-1.73e-17 wuc1=-1.51e-16
+ puc1=3.17e-23 kt1l=0 prt=0 cj=0.0010 pb=0.69 mj=0.36 cjsw=2.0e-10 pbsw=0.69
+ mjsw=0.20 cjswg=3.3e-10 pbswg=0.69 mjswg=0.44 cgdo=3.7e-10 cgso=3.7e-10
+ cta=0.001 ctp=0.0006 pta=0.0016 ptp=0.0016 js=8.38e-6 jsw=1.6e-11
+ n=1 xti=3 capmod=2 nqsmod=0 xpart=1 cf=0 tlev=1 tlevc=1 dlc=3e-9
+ noimod=2 noia=5.0e+19 noib=4.0e3 noic=-4.0e-13 em=3.0e+07 ef=0.883  )


.MODEL CMOSP PMOS (                                LEVEL   = 49
+ tnom=25 version=3.1 tox=4.0e-9 xj=1.7e-7 nch=3.9e+17 lln=1
+ lwn=1 wln=1 wwn=1 lint=1.5e-8 ll=0 lw=0 lwl=0 wint=1.5e-8 wl=0 ww=0 wwl=0
+ mobmod=1 binunit=2 xl=-2e-8 xw=0 dwg=0 dwb=0 ldif=9e-8
+ hdif=2e-7 rsh=7.2 rd=0 rs=0 vth0=-0.43 lvth0=-1.37e-8 wvth0=-8.48e-9
+ pvth0=5.43e-15 k1=0.75 lk1=-1.21e-8 wk1=-1.56e-7 pk1=1.88e-14
+ k2=-0.04 lk2=6.06e-9 wk2=5.28e-8 pk2=-7.49e-15 k3=0 dvt0=0 dvt1=0
+ dvt2=0 dvt0w=0 dvt1w=0 dvt2w=0 nlx=0 w0=0 k3b=0 vsat=130812 lvsat=-0.00036
+ ua=-3.88e-10 lua=6.66e-17 wua=9.31e-16 pua=-1.27e-22 ub=1.71e-18
+ lub=-7.86e-26 wub=-1.10e-24 pub=1.21e-31 uc=-2.69e-11 luc=5.12e-18
+ wuc=-1.38e-16 puc=7.55e-24 rdsw=530 prwb=0 prwg=0 wr=1 u0=0.0063 lu0=2.97e-10
+ wu0=1.59e-9 pu0=-2.39e-16 a0=0.38 la0=1.91e-7 wa0=6.28e-7
+ pa0=-1.11e-13 keta=0.016 lketa=-1.31e-9 wketa=7.53e-9 pketa=-1.55e-15
+ a1=0 a2=0.4 ags=0.0068 lags=5.95e-9 wags=1.68e-8 pags=-7.56e-15
+ b0=0 b1=0 voff=-0.13 lvoff=5.74e-10 wvoff=2.75e-9 pvoff=-2.44e-15
+ nfactor=1 cit=0.00013 lcit=4.80e-11 wcit=-2.75e-11 pcit=3.58e-18
+ cdsc=0 cdscb=0 cdscd=0 eta0=-0.00047 leta0=2.56e-10 etab=0.00067
+ letab=-3.47e-10 dsub=0 pclm=0.84 lpclm=7.067e-8 wpclm=7.40e-8 ppclm=-3.33e-14
+ pdiblc1=1e-6 pdiblc2=0.0096 lpdiblc2=1.70e-10 wpdiblc2=-2.10e-9
+ ppdiblc2=9.45e-16 pdiblcb=0.01 drout=0 pscbe1=3.5e+08 pscbe2=5e-7 pvag=0
+ delta=0.01 alpha0=8.93e-7 beta0=22.68 kt1=-0.22 lkt1=-4.41e-9
+ wkt1=1.69e-9 pkt1=4.61e-16 kt2=-0.017 lkt2=-3.22e-9 wkt2=-9.67e-9
+ pkt2=2.43e-15 at=10000 ute=-0.58 lute=9.19e-9 wute=-5.58e-8 pute=-3.93e-16
+ ua1=1.22e-9 ub1=-1.64e-18 lub1=7.95e-26 wub1=1.12e-25 pub1=-3.52e-32
+ uc1=-5.64e-11 luc1=1.18e-17 wuc1=1.13e-16 puc1=-1.48e-23 kt1l=0 prt=0
+ cj=0.0011 pb=0.89 mj=0.4476 cjsw=2.5e-10 pbsw=0.89 mjsw=0.37 cjswg=4.2e-10
+ pbswg=0.89 mjswg=0.37 cgdo=3.3e-10 cgso=3.3e-10 cta=0.001 ctp=0.0004
+ pta=0.0016 ptp=0.0016 js=4.92e-6 jsw=9e-10 n=1 xti=3 capmod=2 nqsmod=0
+ xpart=1 cf=0 tlev=1 tlevc=1 dlc=2e-9
+ noimod=2 noia=7.0e+19 noib=8.0e3 noic=5.4e-12 em=3.0e+07 ef=1.064    )



.end
