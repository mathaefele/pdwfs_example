redis-server --daemonize yes

echo "########### Launching simu ##############"
pdwfs -t -p $PWD/staged -- ./simu
redis-cli dump "/local/home/mhaefele/ownCloud/work/dev/hello_worlds/pdwfs/C/staged/Cpok:0"
echo "########### Launching post-process ##############"
pdwfs -t -p $PWD/staged -- ./post-process
echo "########### Done ##############"
#redis-cli --scan
#redis-cli info memory
redis-cli shutdown

