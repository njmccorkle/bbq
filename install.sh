#!/bin/bash

##Assign existing hostname to $hostn
hostname_current=$(cat /etc/hostname)
hostname_new="bbq"

##enable and start SSH
systemctl enable ssh
systemctl start ssh

##change hostname in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostname_current/$hostname_new/g" /etc/hosts
sudo sed -i "s/$hostname_current/$hostname_new/g" /etc/hostname

##update from repos, upgrade, and install
apt-get -y update
apt-get -y upgrade
apt-get -y install build-essential python3-dev python3-pip python3-smbus git nginx ufw python3-rpi.gpio

##add influxdb, chronograf, telegraf
#curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
#echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
#apt-get-y install influxdb chronograf telegraf
##Enable and start new services
#systemctl daemon-reload
#systemctl enable influxdb
#systemctl start influxdb
#systemctl enable chronograf
#systemctl start chronograf
#systemctl enable telegraf
#systemctl start telegraf

##setup ufw
ufw allow ssh
ufw allow http
#ufw allow 8888  #chronograf
ufw --force enable

mkdir q-meter
cd q-meter

##create a folder to store adafruit library files. download and install
mkdir adafruit_python_max31855
git clone https://github.com/adafruit/Adafruit_Python_MAX31855.git adafruit_python_max31855
cd adafruit_python_max31855
python setup.py install
cd ..

reboot
