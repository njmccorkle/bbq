#!/bin/bash

##Assign existing hostname to $hostn
hostname_current=$(cat /etc/hostname)
hostname_new="test"

##change hostname in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostname_current/$hostname_new/g" /etc/hosts
sudo sed -i "s/$hostname_current/$hostname_new/g" /etc/hostname

##update from repos, upgrade, and install
apt-get -y update
apt-get -y upgrade
apt-get -y install build-essential
apt-get -y install vim 
apt-get -y install python3-dev
apt-get -y install python3-pip
apt-get -y install python3-smbus
apt-get -y install git
apt-get -y install nginx
apt-get -y install ufw
 
apt-get -y autoremove

##setup ufw
ufw allow ssh
ufw allow http
ufw --force enable

sudo pip3 install virtualenv

cp /home/pi/qmeter/files/qmeter.service /etc/systemd/system/qmeter.service
systemctl daemon-reload
systemctl enable qmeter.service
systemctl start qmeter.service

cp /home/pi/qmeter/files/qmeter.nginx /etc/nginx/sites-available/qmeter
ln -s /etc/nginx/sites-available/qmeter /etc/nginx/sites-enabled
systemctl restart nginx

