#!/bin/bash

##Assign existing hostname to $hostn
hostname_current=$(cat /etc/hostname)
hostname_new="bbq"

##change hostname in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostname_current/$hostname_new/g" /etc/hosts
sudo sed -i "s/$hostname_current/$hostname_new/g" /etc/hostname

##add influxdb key and repos
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

##update from repos, upgrade, and install
apt-get -y update
apt-get -y upgrade
apt-get -y install build-essential python-dev python-pip python-smbus git nginx ufw influxdb chronograf telegraf

##Enable and start new services
systemctl daemon-reload
systemctl enable influxdb
systemctl start influxdb
systemctl enable chronograf
systemctl start chronograf
systemctl enable telegraf
systemctl start telegraf

##setup ufw
ufw allow ssh
ufw allow http
ufw allow 8888
ufw --force enable

##Python libraries for pi
pip install RPi.GPIO

##create a folder to store adafruit library files. download and install
mkdir adafruit_python_max31855
git clone https://github.com/adafruit/Adafruit_Python_MAX31855.git adafruit_python_max31855
cd adafruit_python_max31855
python setup.py install
cd ..

##Install Python libraries
pip install RPi.GPIO
pip install influxdb
