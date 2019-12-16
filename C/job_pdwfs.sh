#!/bin/bash
#SBATCH --job-name=pdwfs_hello
#SBATCH --time=0:02:00
#SBATCH --nodes=2
#SBATCH --exclude=miriel044,miriel045

work_directory="${SLURM_JOB_NAME}_${SLURM_JOB_ID}"
mkdir -p "${work_directory}/staged"
cp job_pdwfs.sh ${work_directory}
cp pdwfs-slurm ${work_directory}
cd "${work_directory}"
ln ../simu .
ln ../post-process .

echo "nodes: $SLURM_JOB_NODELIST"

# This script demonstrates how to run the I/O benchmarking tool ior 
# with pdwfs using SLURM. 
# pdwfs comes with the pdwfs-slurm CLI tool to manage Redis instances

# pre-requisites: 
# - pdwfs and Redis are installed and available in PATH
# - ior is installed with MPI support

# Initialize the Redis instances:
# - 32 instances distributed on 4 nodes (8 per node)
# - bind Redis servers to ib0 network interface
pdwfs-slurm init -N 1 -n 1 -i ib0

# pdwfs-slurm produces a session file with some environment variables to source
source pdwfs.session



# pdwfs command will forward all I/O in $SCRATCHDIR in Redis instances
WITH_PDWFS="pdwfs -t -p staged"

# Execute ior benchmark on 128 tasks
srun -r1 --mpi=none -N 1 -n 1 $WITH_PDWFS ./simu 
host=`echo $PDWFS_CENTRAL_REDIS |cut -d':' -f 1`
port=`echo $PDWFS_CENTRAL_REDIS |cut -d':' -f 2`
echo "redis-cli -h $host -p $port --scan"
redis-cli -h $host -p $port --scan
redis-cli -h $host -p $port ping

srun -r0 --mpi=none -N 1 -n 1 $WITH_PDWFS ./post-process 

# gracefully shuts down Redis instances
pdwfs-slurm finalize

# pdwfs-slurm uses srun in background to execute Redis instances
# wait for background srun to complete
wait
