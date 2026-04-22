#!/bin/bash -e

runs=(1 2 3 4 5)

for run in ${runs[@]}; do
	gmx_mpi rms -s ../ac_pca/PCA.tpr -f ac_pbc_full_${run}.xtc -o rmsd_${run}_CA_full.xvg << EOF
3
3
EOF
done


