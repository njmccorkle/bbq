mkdir .ssh
scp -o StrictHostKeyChecking=no root@freenas:///mnt/Storage/conf/vimrc ~/.vimrc
scp -o StrictHostKeyChecking=no root@freenas:///mnt/Storage/conf/authorized_keys2 ~/.ssh/authorized_keys2

git config --global user.email "njmccorkle@gmail.com"
git config --global user.name "Nathan McCorkle"

git clone https://github.com/njmccorkle/qmeter.git
