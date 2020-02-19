#!/bin/bash
#SBATCH --job-name=pdwfs_hello
#SBATCH --time=0:02:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24

work_directory="${SLURM_JOB_NAME}_${SLURM_JOB_ID}"
mkdir -p "${work_directory}/staged"
cd "${work_directory}"
ln ../simu .
ln ../post-process .
ln ../launch.sh .

./launch.sh
