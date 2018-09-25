#!/bin/bash

##Assign existing hostname to $hostn
#hostname_current=$(cat /etc/hostname)
#hostname_new="qmeter"

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

#cp /home/pi/qmeter/files/qmeter.service /etc/systemd/system/qmeter.service
#systemctl daemon-reload
#systemctl enable qmeter.service
#systemctl start qmeter.service

cp /home/pi/qmeter/files/qmeter.nginx /etc/nginx/sites-available/qmeter
ln -s /etc/nginx/sites-available/qmeter /etc/nginx/sites-enabled
systemctl restart nginx

