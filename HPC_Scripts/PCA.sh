#!/bin/bash -e

runs=(1,2,3,4,5)

for run in ${runs[@]};do
	gmx_mpi covar -s NE.tpr -f merged_cut_eq.xtc -o eigenvalues_eq.xvg -v eigenvec_eq.trr <<EOF
	3
	3
EOF


	gmx_mpi anaeig -v eigenvec_eq.trr -s NE.tpr -f merged_cut_eq.xtc -first 1 -last 2 -proj PCA_tprfromNE_EQ.xvg <<EOF
	3
	3
EOF
done
