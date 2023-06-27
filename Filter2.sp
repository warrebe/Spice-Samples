*controls
.option
$ Enable post-processing
+ post ingold=1

.title Filter-2.sp

.OP

Vin 1 gnd AC=.1 SIN 0 10K 0 0 180

*RS 1 2 50
C1 1 3 5.6p
C2 3 gnd 13p
L1 3 gnd 100n
C3 3 4 1.2p
C4 4 gnd 18p
L2 4 gnd 100n
C5 4 5 1p
C6 5 gnd 18p
L3 5 gnd 100n
C7 5 6 1p
C8 6 gnd 18p
L4 6 gnd 100n
C9 5 6 1.2p
C10 6 7 13p
L5 7 gnd 100n
C11 7 vout 5.6p
RL vout gnd 50

.AC DEC 100000 50000k 180000k 

.PRINT AC Vdb(vout)
*.PRINT V(vout)
*.PRINT V(vout)

.end

