#!/bin/bash
#Written by: Adam Walsh 2013
#Spoof your MAC Address!
#Maintained @ https://github.com/walshie4/spoofMac

declare -a devices=("en0") #CONFIG HERE - Put names of network interfaces to set their link-level address

echo 'Please quit out of System Preferences if it is open.'
read -p "Please enter MAC address to be spoofed (XX:XX:XX:XX:XX:XX): " addr
for INTERFACE in ${devices[@]}
do
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -z #Disassociate from all networks
    sudo ifconfig $INTERFACE lladdr $addr
done
ifconfig | grep ether
echo Done!
