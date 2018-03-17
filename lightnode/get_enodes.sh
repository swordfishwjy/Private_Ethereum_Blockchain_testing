# !/bin/bash
# by Austin Hester

# get enodes

CURR=`dirname $0`
BOOT=$CURR/lightnode

if [[ -d $BOOT/geth/ ]]
then
IPPREFIX=`ip route | grep default | awk -F " " '{print $3 }' | awk '{print substr($1,1,4) }'`
IP=`ifconfig | grep $IPPREFIX | awk -F: '{ print $2 }' | awk -F " " '{ print $1 }'`
echo $IP
# light node
if [ -d $BOOT/geth/ ]; then
	BOOTIPC=/home/$USER/.ethereum/geth.ipc
	if [ -e $BOOTIPC ]; then
		BOOTENODE=`geth --exec admin.nodeInfo.enode attach $BOOTIPC`
	else
		BOOTENODE=`geth --datadir $BOOT --port 39908 --exec admin.nodeInfo.enode console`
	fi
	BOOTENODE=`echo $BOOTENODE | sed 's/\[\:\:\]/'$IP'/g' | sed 's/?discport=0//'`
else
	echo "lightnode not initialized."
fi

echo "lightnode:"
echo $BOOTENODE


# generate static-nodes.json
if ! [ -d $CURR/enode ]; then
	mkdir $CURR/enode
fi
echo "[" > $CURR/enode/new-static-nodes.json
echo $BOOTENODE >> $CURR/enode/new-static-nodes.json
echo "]" >> $CURR/enode/new-static-nodes.json
echo
echo "If this isn't your private ip change that unless you're bold."
echo "Wrote enodes to "$CURR"/enode/new-static-nodes.json"
echo "Run "$CURR"/copy_static_nodes.sh to update"
echo "Done."
echo

else
	echo "Initialize first"
fi
