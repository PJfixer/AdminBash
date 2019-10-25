#!/usr/bin/env bash

# $1 = user to give acces 

echo "Remove acces to shared directories"
deluser $1 share
rm -R /home/$1/share

