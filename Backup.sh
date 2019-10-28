#!/usr/bin/env bash

# $1 = user to backup
# $2 = backup name 
# $3 = size

lvdisplay 

while true; do
    read -p "Do you wish to continue" yn
    case $yn in
        [Yy]* ) lvcreate -s -n vg01/$2 -l $3 $1; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

