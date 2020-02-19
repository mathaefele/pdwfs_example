import os
#reading data output by simu
f = open(os.path.join("staged", "pypok"), "r")
lines = f.readlines()
f.close()

# "Treating them and outpting only the interesting ones"
f = open("pyres", "w")
f.write(lines[0])
f.close()

