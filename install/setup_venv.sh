#!/bin/bash

#virtualenv . 
source ~/q-meter/bin/activate
pip install RPi.GPIO

#create a folder to store adafruit library files. download and install
mkdir ~/q-meter/adafruit_python_max31855
git clone https://github.com/adafruit/Adafruit_Python_MAX31855.git ~/q-meter/adafruit_python_max31855
cd adafruit_python_max31855
python3 setup.py install
cd ..

