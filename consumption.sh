#!/bin/bash

BATTSTAT=`acpi | awk '{print $3}' | cut -d: -f-2 | sed s/,//g `

#echo $BATTSTAT

VOLT=$(cat /sys/class/power_supply/BAT0/voltage_now)
CURRENT=$(cat /sys/class/power_supply/BAT0/current_now)

#echo $CURRENT
#echo $VOLT

if [[ $BATTSTAT == "Discharging" ]]
then
POWER=$(echo "scale=3; $(($VOLT)) * $(($CURRENT)) / 1000000000000" | bc )

echo $POWER"W"

fi
