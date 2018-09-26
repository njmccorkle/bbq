##enable and start SSH
systemctl enable ssh
systemctl start ssh

#set timezone
echo "America/Chicago" > /etc/timezone    
dpkg-reconfigure -f noninteractive tzdata

apt-get install -y git
