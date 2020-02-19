# pdwfs_example
Hello worlds examples for [pdwfs](https://github.com/cea-hpc/pdwfs), a POSIX based in-transit post-processing tool.

This repo provides minimal examples in C and Python that make use of pdwfs. They mimic a simple scientific application workflow, i.e. a simulation running and writing data followed by a post-processing that reads the output data, does a small treatment and writes the final result.

## pdwfs with C application
The "simulation" writes the following in file `staged/Cpok` 
```
Hello 0
Hello 1
Hello 2
Hello 3
Hello 4
Hello 5
Hello 6
Hello 7
Hello 8
Hello 9
```

The post-processing reads `staged/Cpok`, extracts the first line and outputs it in file `./resC`. Typically
```
Hello 0
```

### Compile
```bash
cd C
source compile.sh
```

### Run without pdfws
```bash
cd C
./launch_without_pdwfs.sh
```
Typical output:
```
########### Launching simu ##############
simu: running on host devel03.plafrim.cluster
########### Launching post-process ##############
post-process: running on host devel03.plafrim.cluster
post-process: Hello 0
########### Done ##############
```

### Run with pdfws locally on a laptop or the frontend node of a cluster
```bash
cd C
./launch_local.sh
```
Typical output:
```
154892:C 19 Feb 2020 15:06:07.503 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
154892:C 19 Feb 2020 15:06:07.503 # Redis version=5.0.6, bits=64, commit=00000000, modified=0, pid=154892, just started
154892:C 19 Feb 2020 15:06:07.503 # Configuration loaded
########### Launching simu ##############
[PDWFS][154905][TRACE][C] intercepting fopen(path=staged/Cpok, mode=w)
simu: running on host devel03.plafrim.cluster
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 0
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 1
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 2
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 3
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 4
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 5
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 6
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 7
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 8
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fprintf(stream=0x7a5f00, ...)
[PDWFS][154905][TRACE][C] intercepting fputs(s=Hello 9
, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fwrite(ptr=0x7a0fa0, size=1, nmemb=8, stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting fclose(stream=0x7a5f00)
[PDWFS][154905][TRACE][C] intercepting close(fd=5)
[PDWFS][154905][TRACE][C] intercepting close(fd=5)
[PDWFS][154905][TRACE][C] calling libc close
(nil)
########### Launching post-process ##############
post-process: running on host devel03.plafrim.cluster
[PDWFS][154918][TRACE][C] intercepting fopen(path=staged/Cpok, mode=r)
[PDWFS][154918][TRACE][C] intercepting fread(ptr=0x7ffddc5ab3b0, size=1, nmemb=2560, stream=0x824f00)
[PDWFS][154918][TRACE][C] intercepting fclose(stream=0x824f00)
[PDWFS][154918][TRACE][C] intercepting close(fd=5)
[PDWFS][154918][TRACE][C] intercepting close(fd=5)
[PDWFS][154918][TRACE][C] calling libc close
post-process: Hello 0
[PDWFS][154918][TRACE][C] intercepting fopen(path=resC, mode=w)
[PDWFS][154918][TRACE][C] calling libc fopen
[PDWFS][154918][TRACE][C] intercepting fprintf(stream=0x825140, ...)
[PDWFS][154918][TRACE][C] intercepting fputs(s=Hello 0
, stream=0x825140)
[PDWFS][154918][TRACE][C] calling libc fputs
[PDWFS][154918][TRACE][C] intercepting fclose(stream=0x825140)
[PDWFS][154918][TRACE][C] calling libc fclose
########### Done ##############
```

### Run with pdfws as a SLURM job on the compute nodes of a cluster
```bash
cd C
sbatch job_pdwfs.sh
```
It will create a directory per job run and will produce all output in it.
Typical output:
```
nodes: miriel[073,075]
[PDWFS][init] Start central Redis instance on miriel073.plafrim.cluster:34000
[PDWFS][110504][TRACE][C] intercepting fopen(path=staged/Cpok, mode=w)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 0
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 1
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 2
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 3
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 4
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 5
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 6
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 7
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 8
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fprintf(stream=0x1e0ef00, ...)
[PDWFS][110504][TRACE][C] intercepting fputs(s=Hello 9
, stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting fwrite(ptr=0x1e09fa0, size=1, nmemb=8, stream=0x1e0ef00)
simu: running on host miriel075.plafrim.cluster
[PDWFS][110504][TRACE][C] intercepting fclose(stream=0x1e0ef00)
[PDWFS][110504][TRACE][C] intercepting close(fd=5)
[PDWFS][110504][TRACE][C] intercepting close(fd=5)
[PDWFS][110504][TRACE][C] calling libc close
redis-cli -h miriel073.plafrim.cluster -p 34000 --scan
addr
PONG
[PDWFS][112959][TRACE][C] intercepting fopen(path=staged/Cpok, mode=r)
[PDWFS][112959][TRACE][C] intercepting fread(ptr=0x7ffdd012f640, size=1, nmemb=2560, stream=0x1f98100)
[PDWFS][112959][TRACE][C] intercepting fclose(stream=0x1f98100)
[PDWFS][112959][TRACE][C] intercepting close(fd=5)
[PDWFS][112959][TRACE][C] intercepting close(fd=5)
[PDWFS][112959][TRACE][C] calling libc close
[PDWFS][112959][TRACE][C] intercepting fopen(path=resC, mode=w)
[PDWFS][112959][TRACE][C] calling libc fopen
[PDWFS][112959][TRACE][C] intercepting fprintf(stream=0x1f98340, ...)
[PDWFS][112959][TRACE][C] intercepting fputs(s=Hello 0
, stream=0x1f98340)
[PDWFS][112959][TRACE][C] calling libc fputs
[PDWFS][112959][TRACE][C] intercepting fclose(stream=0x1f98340)
[PDWFS][112959][TRACE][C] calling libc fclose
post-process: running on host miriel073.plafrim.cluster
post-process: Hello 0



