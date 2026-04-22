#!/bin/bash -e

runs=(2)
nanoseconds=(65 70 75 80 85 90 95 100 105 110 115 120 125 130 135 140 145 150 155 160 165 170 175 180 185 190 195 200 205 210 215 220 225 230 235 240 245 250 255 260 265 270 275 280 285 290 295 300 305 310 315 320 325 330 335 340 345 350 355 360 365 370 375 380 385 390 395 400 405 410 415 420 425)

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

