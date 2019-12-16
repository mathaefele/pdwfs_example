#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define STR_SIZE 128

int main()
{
  int i;
  FILE* f = fopen("staged/Cpok", "w");
  char hostname[STR_SIZE];
  gethostname(hostname, STR_SIZE);
  printf("simu: running on host %s\n", hostname);

  for(i=0 ; i < 10 ; i++)
    fprintf(f, "Hello444\n");
  fclose(f);
  return 0;
}

