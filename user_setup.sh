##enable and start SSH
systemctl enable ssh
systemctl start ssh

mkdir .ssh
scp -o StrictHostKeyChecking=no root@freenas:///mnt/Storage/conf/vimrc ~/.vimrc
scp -o StrictHostKeyChecking=no root@freenas:///mnt/Storage/conf/authorized_keys2 ~/.ssh/authorized_keys2

#set timezone
echo "America/Chicago" > /etc/timezone    
dpkg-reconfigure -f noninteractive tzdata

apt-get install -y git

git config --global user.email "njmccorkle@gmail.com"
git config --global user.name "Nathan McCorkle"

git clone https://github.com/njmccorkle/q-meter.git
