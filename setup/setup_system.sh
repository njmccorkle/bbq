#!/bin/bash

##Assign existing hostname to $hostn
#hostname_current=$(cat /etc/hostname)
#hostname_new="q-meter"

##change hostname in /etc/hosts & /etc/hostname
#sudo sed -i "s/$hostname_current/$hostname_new/g" /etc/hosts
#sudo sed -i "s/$hostname_current/$hostname_new/g" /etc/hostname

##update from repos, upgrade, and install
#apt-get -y update
#apt-get -y upgrade
#apt-get -y install build-essential vim python3-dev python3-pip python3-smbus git nginx ufw
#apt-get -y autoremove

##setup ufw
#ufw allow ssh
#ufw allow http
#ufw --force enable