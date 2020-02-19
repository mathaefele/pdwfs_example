import re
import sys
import os
import shutil

job_std_output_name = "slurm-"
job_std_output_ext = ".out"

def get_exp_num(exp):
  res = re.search('_([0-9]+)$', exp)
  if res != None:
    return res.group(1)
  else:
    raise ValueError("not a valid exp name: %s"%exp)


if len(sys.argv) != 3:
  print("Command line Error: %s exp_to_archive exp_name"%sys.argv[0])
  sys.exit(1)

exp_to_archive = sys.argv[1]
exp_name = sys.argv[2]
exp_num = get_exp_num(exp_to_archive)
new_dir = exp_to_archive + '-' + exp_name
stdout_name = job_std_output_name + exp_num + job_std_output_ext

shutil.move(exp_to_archive, new_dir)
shutil.move(stdout_name, new_dir)
 
