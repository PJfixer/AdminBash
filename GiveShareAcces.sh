#!/usr/bin/env bash

# $1 = user to give acces 

echo "Giving acces to shared directories"
usermod -a -G share $1
ln -s /home/share /home/$1/share

