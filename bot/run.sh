mpirun -np 8 pw.x < mx.scf.in | tee mx.scf.out
mpirun -np 8 pw.x < mx.band.in | tee mx.band.out
mpirun -np 8 bands.x < mx.bands.in | tee mx.bands.out

