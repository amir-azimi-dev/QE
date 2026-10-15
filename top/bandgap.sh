numbandVal=37

nLinejumpband=6

NumOfK=236
nLineK=101
nLineM=151

> gap.dat
echo "#" mat  EGc EKc EMc EGc2 EKc2 EMc2 EminCon EGv EKv EMv EGv2 EKv2 EMv2 EmaxVal EFermi Eg >  gap.dat


########################################################################
Emin=1000	
for nLine in $(seq 1 $NumOfK )	
do
	nLineF=$((($numbandVal)*($NumOfK+1)+$nLine))
	E=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')
	if  (( $(echo "$E <= $Emin" | bc -l) ))
	then
		Emin=$E
		NumminVCon=$nLine
	fi
done
EminCon=$Emin

NumberKinbandsdat=$(($nLinejumpband*($NumminVCon-1)+2))
KxminCon=$(awk "NR==$NumberKinbandsdat" bands.dat| awk '{print $1}' )
KyminCon=$(awk "NR==$NumberKinbandsdat" bands.dat| awk '{print $2}' )
KzminCon=$(awk "NR==$NumberKinbandsdat" bands.dat| awk '{print $3}' )

Emax=-1000	
for nLine in $(seq 1 $NumOfK )	
do
	nLineF=$((($numbandVal-1)*($NumOfK+1)+$nLine))
	E=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')
	if  (( $(echo "$Emax <= $E" | bc -l) ))
	then
		Emax=$E
		NummaxVal=$nLine
	fi
done
EmaxVal=$Emax
NumberKinbandsdat=$(($nLinejumpband*($NummaxVal-1)+2))
KxmaxVal=$(awk "NR==$NumberKinbandsdat" bands.dat| awk '{print $1}' )
KymaxVal=$(awk "NR==$NumberKinbandsdat" bands.dat| awk '{print $2}' )
KzmaxVal=$(awk "NR==$NumberKinbandsdat" bands.dat| awk '{print $3}' )


Eg=$(echo "scale=10;$EminCon-($EmaxVal)" | bc -l)


############################ Gamma #####################################
nLineF=$((($numbandVal)*($NumOfK+1)+1))
EGc=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')

nLineF=$((($numbandVal)*($NumOfK+1)+$nLineK))
EKc=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')

nLineF=$((($numbandVal)*($NumOfK+1)+$nLineM))
EMc=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')

nLineF=$((($numbandVal+1)*($NumOfK+1)+1))
EGc2=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')

nLineF=$((($numbandVal+1)*($NumOfK+1)+$nLineK))
EKc2=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')

nLineF=$((($numbandVal+1)*($NumOfK+1)+$nLineM))
EMc2=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')


nLineF=$((($numbandVal-1)*($NumOfK+1)+1))
EGv=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')

nLineF=$((($numbandVal-1)*($NumOfK+1)+$nLineK))
EKv=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')

nLineF=$((($numbandVal-1)*($NumOfK+1)+$nLineM))
EMv=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')


nLineF=$((($numbandVal-2)*($NumOfK+1)+1))
EGv2=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')

nLineF=$((($numbandVal-2)*($NumOfK+1)+$nLineK))
EKv2=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')

nLineF=$((($numbandVal-2)*($NumOfK+1)+$nLineM))
EMv2=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')


nLineF=$((($numbandVal-3)*($NumOfK+1)+1))
EGv3=$(awk "NR==$nLineF" bands.dat.gnu | awk '{print $2}')



Etot=$(grep -R "!" mx.scf* | awk '{print $5}')

EFermi=$(grep -R "Fermi" mx.scf* | awk '{print $6}')


echo "mat  $EGc $EKc $EMc $EGc2 $EKc2 $EMc2 $EminCon $EGv  $EKv $EMv $EGv2 $EKv2 $EMv2 $EmaxVal $EFermi $Eg" >> gap.dat

cd ..

