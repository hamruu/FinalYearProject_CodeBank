#!/bin/bash -e

runs=(2 3 4 5)

for run in "${runs[@]}"; do

    echo "Processing run ${run}"

    traj=merged_r${run}.xtc

    gmx_mpi trjconv -f "$traj" -s MD.tpr -o center_r${run}.xtc -center << EOF
1
0
EOF

    gmx_mpi trjconv -f center_r${run}.xtc -s MD.tpr -o EQ_whole_r${run}.xtc -pbc whole << EOF
1
0
EOF

    rm center_r${run}.xtc

done

