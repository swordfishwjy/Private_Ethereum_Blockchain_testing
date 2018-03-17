# !/bin/bash
# by Austin Hester

# Unlock coinbase for each node on start

CURR=`dirname $0`
BOOT=$CURR/lightnode


if [[ -d $BOOT/geth/ ]]
then
read -p "Are you sure you want to unlock accounts? (yes/no):" -r
echo
if [[ $REPLY == "yes" ]]
then
	# bootstrap node
	echo "============================"
	echo "lightnode coinbase" 
	echo "============================"
	echo -n "Enter password for lightnode account #1: "
	read -s -r
	echo
	echo $REPLY > $BOOT/passwd.sec
	chmod 600 $BOOT/passwd.sec
	
else
	echo "quitting"
fi
else
	echo "You must initialize first. Run ./initialize_chain.sh"
fi
echo 
