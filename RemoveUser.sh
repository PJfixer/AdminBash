#!/usr/bin/env bash

# $1 = user to delete




umount /home/$1
rm -Rf /home/$1
lvremove /dev/vg01/$1
awk '!/'$1'/' /etc/fstab > temp && mv temp /etc/fstab 
userdel $1

