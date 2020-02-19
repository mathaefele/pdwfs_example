#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "param.h"



void read_fread(char* filename, char* res)
{
  char buffer[STR_SIZE * N_LINES];
  char* tok_res; 
  int status;
  FILE* f = fopen(filename, "r");

  status = fread(buffer, sizeof(char), STR_SIZE * N_LINES, f);
  //printf("status = %d, total read request = %d\n", status, STR_SIZE * N_LINES);
  tok_res = strtok(buffer, "\n");
  strcpy(res, tok_res);
  fclose(f);
}

int main(int argc, char** argv)
{
  int i, nreads, step_to_read;
  FILE* f;
  char res[STR_SIZE];
  char hostname[STR_SIZE];
  char filename[STR_SIZE];
  if(argc > 2)
  {
	  fprintf(stderr, "Error: too many parameters\n%s [nranks_simulation]\n. Aborting...\n");
	  exit(1);
  }

  gethostname(hostname, STR_SIZE);
  printf("post-process: running on host %s\n", hostname);

  f = fopen("resC", "w");
  if(argc == 1)
  {
	  nreads = 1;
	  step_to_read = 0;
  }
  else
  {
	  nreads = 2;
	  step_to_read = atoi(argv[1])/2;
  }

  for(i = 0; i < nreads; i++)
  {
	  sprintf(filename, "staged/Cpok_%d", i*step_to_read);
	  read_fread(filename, res);
	  fprintf(f, "%s\n", res);
  }

  fclose(f);

  return 0;
}

