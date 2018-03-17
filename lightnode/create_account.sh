# !/bin/bash
# by Austin Hester

# Create 2 accounts for each node

CURR=`dirname $0`
BOOT=$CURR/lightnode


if [[ -d $BOOT/geth/ ]]
then
read -p "Are you sure you want to create accounts? (yes/no):" -r
echo
if [[ $REPLY == "yes" ]]
then
	echo "Make sure to write down your passwords somewhere."
	echo "Run ./unlock_on_start.sh if you want to start each node"
	echo "with their coinbase account unlocked"
	read -p "" -r
	echo
	# lightnode
	echo "============================"
	echo "lighnode account #1"
	echo "============================"
	RIGHT=0
	while [[ $RIGHT == 0 ]]
	do
	geth --datadir $BOOT account new && > tmpasdf
	TEST=`cat tmpasdf | grep Fatal`
	if [[ $TEST == "" ]]; then
		RIGHT=1
	fi
	done


	rm -f tmpasdf
	echo "if you messed up just manually add accounts."
	echo "Done."
else
	echo "quitting"
fi
else
	echo "You must initialize first. Run ./initialize_chain.sh"
fi
echo
