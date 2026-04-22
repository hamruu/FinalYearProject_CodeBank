#!/bin/bash

#SBATCH --job-name pbc_extract               # Job name
#SBATCH --time=30:00:00                      # Runtime
#SBATCH --nodes=1                            # Run all tasks on a single node
#SBATCH --ntasks=1                           # One task (single process)
#SBATCH --cpus-per-task=8                    # Number of CPU cores to use
#SBATCH --mem-per-cpu=1G

# Account details
#SBATCH --account=chem021482

# Working directory
#SBATCH -D /user/work/nn22529/Yearfourproj/FrameRecovery_eq/full_trjs

# Output file.
#SBATCH -o slm_output.txt

# Error file.
#SBATCH -e slm_error.txt


module load openmpi/5.0.3-et6p

module load gromacs/2024.2-netlib-lapack-sqeg


bash extract_pbc.sh
