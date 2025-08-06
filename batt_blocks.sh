#!/bin/bash
#

STATE=`upower -d | grep -m 1 state | awk '{print $2}'`
PERCENTAGE=`upower -d | grep -m 1 percentage | awk '{print $2}'`
TIME=`upower -d | grep -m 1 time | awk '{print $4}'`

#TIME=`acpi | awk '{print $5}' | cut -d: -f-2`

SEC=$(echo "$TIME * 3600 " | bc )


TIME=`date -u -d "@$SEC" +'%H:%M'`

BATTSTAT="$STATE $PERCENTAGE $TIME"


if [[ $STATE == "discharging" ]]
then
    POWER=$(upower -d | grep -m 1 energy-rate | awk '{printf "%0.2f",$2}' )

	echo $BATTSTAT $POWER"W"

else

	echo $BATTSTAT

fi

#BATTSTAT=`acpi | awk '{print $3,$4,$5}' | cut -d: -f-2 | sed s/,//g `

