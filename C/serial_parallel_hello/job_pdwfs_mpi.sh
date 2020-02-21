#!/bin/bash
#SBATCH --job-name=pdwfs_hello
#SBATCH --time=0:02:00
#SBATCH --nodes=3
#SBATCH -C miriel
#SBATCH --exclude=miriel044,miriel045

work_directory="${SLURM_JOB_NAME}_${SLURM_JOB_ID}"
mkdir -p "${work_directory}/staged"
cp job_pdwfs.sh ${work_directory}
cd "${work_directory}"
ln ../simu .
ln ../post-process .

echo "nodes: $SLURM_JOB_NODELIST"

# This script demonstrates how to run the simple simu / post-processing 
# workflow with pdwfs using SLURM. 
# pdwfs comes with the pdwfs-slurm CLI tool to manage Redis instances

# pre-requisites: 
# - pdwfs and Redis are installed and available in PATH
# - simu and post-process applications are compiled and available in the C directory

# Initialize the Redis instances:
# - 1 instance on a single node
# - bind Redis server to ib0 network interface
pdwfs-slurm init -N 1 -n 1 -i ib0

# pdwfs-slurm produces a session file with some environment variables to source
source pdwfs.session

# pdwfs command will forward all I/O in $SCRATCHDIR in Redis instances
# -t prints all POSIX calls intercepted by pdwfs
WITH_PDWFS="pdwfs -t -p staged"

# Execute simu without MPI on a single core
# -r1 tells SLURM to run this application starting from node 1 as redis server is started on node 0
srun -r1 -N 2 --ntasks-per-node 24 $WITH_PDWFS ./simu_mpi

# Print some information on the redis server and ask if it is still alive. PONG answer means yes !
host=`echo $PDWFS_CENTRAL_REDIS |cut -d':' -f 1`
port=`echo $PDWFS_CENTRAL_REDIS |cut -d':' -f 2`
echo "redis-cli -h $host -p $port --scan"
redis-cli -h $host -p $port --scan
redis-cli -h $host -p $port ping

# Execute simu without MPI on a single core
# -r0 tells SLURM to run this application starting from node 0 such that the post-process takes 
# place on the node where the redis server is started
srun -r0 --mpi=none -N 1 -n 1 $WITH_PDWFS ./post-process 48

# gracefully shuts down Redis instances
pdwfs-slurm finalize

# pdwfs-slurm uses srun in background to execute Redis instances
# wait for background srun to complete
wait
