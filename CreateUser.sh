#!/usr/bin/env bash

# $1 = new username
# $2 = size allocated for the new user in Mo

useradd $1 -m    -p $(openssl passwd -1 ChangeMe) && \
passwd -e $1 && \
lvcreate -n $1 -L $2m vg01 && \
mkfs -t ext4 /dev/vg01/$1 && \

echo "/dev/vg01/$1  /home/$1 ext4 defaults 0  0" >> /etc/fstab && \
mount -a && \
cp -RT /etc/skel/ /home/$1 && \
chown -R $1:$1 /home/$1  && \
chmod  -R 770 /home/$1


echo "new user created"
