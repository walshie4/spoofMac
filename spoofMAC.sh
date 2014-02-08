#!/bin/bash
#Written by: Adam Walsh 2013
#Spoof your MAC Address!
#Maintained @ https://github.com/walshie4/spoofMac

sudo ipconfig set en0 BOOTP
sudo ipconfig set en0 DHCP
echo Please enter MAC to be spoofed:
read addr
sudo ifconfig en1 ether $addr
sudo ifconfig en0 ether $addr
sudo ifconfig en1 lladdr $addr
sudo ifconfig en0 lladdr $addr
ifconfig | grep ether
echo Done!
