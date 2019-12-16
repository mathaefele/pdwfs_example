#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define STR_SIZE 128
#define N_LINES 20


void read_scanf(char* res)
{
  FILE* f = fopen("staged/Cpok", "r");
  fscanf(f, "%s", res);
  fclose(f);
}

void read_fread(char* res)
{
  char buffer[STR_SIZE * N_LINES];
  char* tok_res; 
  int status;
  FILE* f = fopen("staged/Cpok", "r");

  status = fread(buffer, sizeof(char), STR_SIZE * N_LINES, f);
  //printf("status = %d, total read request = %d\n", status, STR_SIZE * N_LINES);
  tok_res = strtok(buffer, "\n");
  strcpy(res, tok_res);
  fclose(f);
}

int main()
{
  int i;
  FILE* f;
  char res[STR_SIZE];
  char hostname[STR_SIZE];
  gethostname(hostname, STR_SIZE);
  printf("post-process: running on host %s\n", hostname);

  //read_scanf(res);
  read_fread(res);

  printf("post-process: %s\n", res);

  f = fopen("resC", "w");
  fprintf(f, "%s\n", res);
  fclose(f);

  return 0;
}

