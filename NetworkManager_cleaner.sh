#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi



rm -rf ~/system-connections
mkdir ~/system-connections

cp /etc/NetworkManager/system-connections/Mobica ~/system-connections
cp /etc/NetworkManager/system-connections/mobicaGUESTS ~/system-connections
cp /etc/NetworkManager/system-connections/Internet.org ~/system-connections
cp /etc/NetworkManager/system-connections/VPN* ~/system-connections
cp /etc/NetworkManager/system-connections/*www.internet.pl ~/system-connections

for ((i=0;i<10;++i)) do rm -rf /etc/NetworkManager/system-connections/*; done

cp ~/system-connections/* /etc/NetworkManager/system-connections/


for i in Mobica mobicaGUESTS Internet.org VPN* *www.internet.pl
	do
		echo "Number $i"
		cp /etc/NetworkManager/system-connections/$i ~/system-connections
	done




