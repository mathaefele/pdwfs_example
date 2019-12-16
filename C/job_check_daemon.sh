#!/bin/bash
#SBATCH --job-name=pdwfs_hello
#SBATCH --time=0:02:00
#SBATCH --nodes=2
echo $SLURM_JOB_NODELIST
srun -lN1 -n1 -r 1 ./dummy.sh 1
srun -lN1 -n1 -r 0 ./dummy.sh 0
