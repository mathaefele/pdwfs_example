#!/bin/bash
#SBATCH --job-name=pdwfs_hello
#SBATCH --time=0:02:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH -C miriel

module load compiler/gcc/9.2.0 mpi/openmpi/4.0.2-testing
work_directory="${SLURM_JOB_NAME}_${SLURM_JOB_ID}"
mkdir -p "${work_directory}/staged"
cd "${work_directory}"
ln ../simu_mpi .
ln ../post-process .


echo "########### Launching simu ##############"
mpirun ./simu_mpi
#srun --mpi=openmpi -N 2 --ntasks-per-node=24 ./simu_mpi
#srun --mpi=openmpi ./simu_mpi
#srun --mpi=pmi2 ./simu_mpi
#srun --mpi=pmix ./simu_mpi
#srun --mpi=pmix_v3 ./simu_mpi

echo "########### Launching post-process ##############"
./post-process 48
echo "########### Done ##############"
