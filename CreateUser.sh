#!/usr/bin/env bash

# $1 = new username
# $2 = size allocated for the new user in Mo
# $3 = is the new user allowed to hava acces to the shared directories

useradd $1 -m    -p $(openssl passwd -1 ChangeMe) && \
passwd -e $1 && \
lvcreate -n $1 -L $2m vg01 && \
mkfs -t ext4 /dev/vg01/$1 && \
echo "/dev/vg01/$1  /home/$1 ext4 defaults 0  0" >> /etc/fstab && \
mount -a && \
cp -RT /etc/skel/ /home/$1 && \
chown -Rf $1:$1 /home/$1
if [ $3 == "yes" ]; then
    	echo "Giving acces to shared directories"
	usermod -a -G share $1
	ln -s /home/share /home/$1/share
	chmod 760 /home/$1/share
	chown $1 /home/$1/share
fi

echo "new user created"
