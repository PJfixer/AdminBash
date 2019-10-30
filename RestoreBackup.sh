#!/usr/bin/env bash

# $1 = user
# $2 =  backup name 
lvconvert --merge /dev/vg01/$2
umount /dev/home/$1
lvchange -a n /dev/vg01/$1
lvchange -a y /dev/vg01/$1
mount /dev/vg01/$1 /home/$1
