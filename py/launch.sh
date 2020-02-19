redis-server --daemonize yes
redis-cli --scan
mkdir -p staged
echo "########### Launching simu ##############"

pdwfs -p $PWD/staged -- python ./simu.py
echo "########### Launching post-process ##############"
pdwfs -p $PWD/staged -- python ./post-process.py
echo "########### Done ##############"
redis-cli --scan
redis-cli info memory
redis-cli shutdown

