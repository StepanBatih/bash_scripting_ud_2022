#!/bin/bash 

#sorry Im trying to write output to .json but its fucking hard 

sysver=$(uname -v | cut -c 5-)
echo -e "1)System version : $sysver\n" 2>&1 > script2_Output.log

netinter=$(ifconfig)
echo -e "2)Network interfaces :\n$netinter\n" 2>&1 >> script2_Output.log

fireconf=$(ufw version)
echo -e "3)Firewall conf: $fireconf\n" 2>&1 >> script2_Output.log

gerver=$(cat /proc/version)
echo -e "4)Gernic version: \n $gerver"  2>&1 >> script2_Output.log
