mpirun -np 8 pw.x < mx.scf.in | tee mx.scf.out
mpirun -np 8 pw.x < mx.nscf.in | tee mx.nscf.out
mpirun -np 8 projwfc.x < projwfc.in | tee projwfc.out



plot [-1.50:4.50] 'XX.k.pdos_atm#1(W)_wfc#1(s)' u 1:2 w l, 'XX.k.pdos_atm#1(W)_wfc#2(s)' u 1:2 w l, 'XX.k.pdos_atm#1(W)_wfc#3(p)' u 1:2 w l, 'XX.k.pdos_atm#1(W)_wfc#4(p)' u 1:2 w l, 'XX.k.pdos_atm#1(W)_wfc#5(d)' u 1:2 w l lw 3, 'XX.k.pdos_atm#1(W)_wfc#1(s)' u 1:2 w l, 'XX.k.pdos_atm#1(W)_wfc#1(s)' u 1:2 w l, 'XX.k.pdos_atm#2(S)_wfc#1(s)' u 1:2 w l, 'XX.k.pdos_atm#2(S)_wfc#2(p)' u 1:2 w l lw 3, 'XX.k.pdos_atm#3(S)_wfc#1(s)' u 1:2 w l, 'XX.k.pdos_atm#3(S)_wfc#2(p)' u 1:2 w l


plot [-3.0:3.0] 'XX.k.pdos_atm#1(W)_wfc#1(s)' u ($1-1.4944):2 w l, 'XX.k.pdos_atm#1(W)_wfc#2(s)' u ($1-1.4944):2 w l, 'XX.k.pdos_atm#1(W)_wfc#3(p)' u ($1-1.4944):2 w l, 'XX.k.pdos_atm#1(W)_wfc#4(p)' u ($1-1.4944):2 w l, 'XX.k.pdos_atm#1(W)_wfc#5(d)' u ($1-1.4944):2 w l lw 3, 'XX.k.pdos_atm#1(W)_wfc#1(s)' u ($1-1.4944):2 w l, 'XX.k.pdos_atm#1(W)_wfc#1(s)' u ($1-1.4944):2 w l, 'XX.k.pdos_atm#2(S)_wfc#1(s)' u ($1-1.4944):2 w l, 'XX.k.pdos_atm#2(S)_wfc#2(p)' u ($1-1.4944):2 w l lw 3, 'XX.k.pdos_atm#3(S)_wfc#1(s)' u ($1-1.4944):2 w l, 'XX.k.pdos_atm#3(S)_wfc#2(p)' u ($1-1.4944):2 w l



