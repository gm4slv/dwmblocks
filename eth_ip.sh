#!/bin/bash
#
#

IP=$(ip a | grep 255 | grep eth0 | awk 'OFS=": " {print  $2}'  | sed 's/\/24//')
STATE=$(ip a  | grep eth0 | grep state | awk '{print  $9}'  | sed 's/\/24//')
#ETH=$(ip a | grep 255 | grep * | awk ' {print  $NF}'  | sed 's/\/24//')

ETH=eth0

if [[ $STATE == 'DOWN' ]];
then
	echo $ETH": disconnected"

else
	echo $ETH": "$IP
fi
