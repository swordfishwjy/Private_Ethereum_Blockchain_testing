# !/bin/bash

CURR=`dirname $0`
if [ -d $CURR/bootstrap/geth ]; then
geth --identity "bootstrap" --networkid 9111 \
     --datadir $CURR/bootstrap  \
	 --nodiscover --syncmode "full" \
     --ipcpath /Users/$USER/.ethereum/geth.ipc \
     --port "39909" --rpc --rpcport "42024" \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 \
     --preload "checkBalance.js" \
	 --password $CURR/bootstrap/passwd.sec \
   console
else
	echo "Initialize first"
fi
