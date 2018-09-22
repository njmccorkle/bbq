mkdir .ssh
scp -o StrictHostKeyChecking=no root@freenas:///mnt/Storage/conf/vimrc ~/.vimrc
scp -o StrictHostKeyChecking=no root@freenas:///mnt/Storage/conf/authorized_keys2 ~/.ssh/authorized_keys2
