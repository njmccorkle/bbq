##enable and start SSH
systemctl enable ssh
systemctl start ssh

mkdir .ssh
scp -o StrictHostKeyChecking=no root@freenas:///mnt/Storage/conf/vimrc ~/.vimrc
scp -o StrictHostKeyChecking=no root@freenas:///mnt/Storage/conf/authorized_keys2 ~/.ssh/authorized_keys2

#set timezone
echo "America/Chicago" > /etc/timezone    
dpkg-reconfigure -f noninteractive tzdata




wget https://raw.githubusercontent.com/njmccorkle/bbq/master/install.sh
chmod +x install.sh
