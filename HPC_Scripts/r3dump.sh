#!/bin/bash -e

runs=(3)
nanoseconds=(415 420 425)

picoseconds=(0 10 20 30 40 50 60 70 80 90 100 250 500 750 1000 1500 2000 2500 3000 3500 4000 4500 5000)

base_path=/user/work/nn22529/Yearfourproj/FrameRecovery_eq/full_trjs


for run in "${runs[@]}"; do

    traj=merged_r${run}.xtc

    for ns in "${nanoseconds[@]}"; do
        nsdir=TRJDUMP_EQ/EQ_${run}/${ns}ns
        mkdir -p "$nsdir"

        for ps in "${picoseconds[@]}"; do
            dump_ps=$(( ns*1000 + ps ))
            out=${nsdir}/Run${run}_EQ_${ns}ns_${ps}ps.gro

            gmx_mpi trjconv -f EQ_r${run}.xtc -s MD.tpr \
                -o "$out" -dump "$dump_ps" -fit rot+trans << EOF
1
1
EOF
        done
    done
done

