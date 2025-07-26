#!/bin/bash
#

BATTSTAT=`acpi | awk '{print $3,$4,$5}' | cut -d: -f-2 | sed s/,//`

echo $BATTSTAT
