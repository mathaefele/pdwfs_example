#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "param.h"

#ifdef WITH_MPI
#include <mpi.h>
#endif


int main(int argc, char** argv)
{
  int i;
  int rank, size;
  FILE* f;
  char hostname[STR_SIZE];
  char filename[STR_SIZE];
  
#ifdef WITH_MPI
  MPI_Init (&argc, &argv);
  MPI_Comm_rank (MPI_COMM_WORLD, &rank);
  MPI_Comm_size (MPI_COMM_WORLD, &size);
#else
  rank = 0;
  size = 1;
#endif
  
  if(size != 1 && size%2 != 0)
  {
	  fprintf(stderr, "Error: either serial run or an even number of ranks, please. Aborting...\n");
#ifdef WITH_MPI
	  MPI_Abort(MPI_COMM_WORLD, 1);
#else
	  exit(1);
#endif
  }

    sprintf(filename, "staged/Cpok_%d", rank);

  if(rank == 0 || rank == size /2)
  {
	  f = fopen(filename, "w");
	  gethostname(hostname, STR_SIZE);
	  printf("simu: running on host %s\n", hostname);

	  for(i=0 ; i < N_LINES ; i++)
		  fprintf(f, "Hello %s %d\n", hostname, rank + i);
	  fclose(f);
  }
  
#ifdef WITH_MPI
  MPI_Finalize();
#endif

  return 0;
}

