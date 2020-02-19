import os

f = open(os.path.join("staged", "pypok"), "w")
for i in range(10):
    f.write("Hello python\n")
f.close()

