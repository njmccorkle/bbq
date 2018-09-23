#!/bin/bash

virtualenv . 
##source ~/q-meter/bin/activate
~/q-meter/bin/pip install RPi.GPIO


##create a folder to store adafruit library files. download and install
mkdir adafruit_python_max31855
git clone https://github.com/adafruit/Adafruit_Python_MAX31855.git adafruit_python_max31855
cd adafruit_python_max31855
~/q-meter/bin/python setup.py install
cd ..

