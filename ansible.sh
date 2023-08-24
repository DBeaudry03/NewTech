#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install software-properties-common ansible expect -y

sudo apt autoremove -y

ssh-keygen -t rsa -C "201398085@cegepsherbrooke.qc.ca" -N "" -f ~/.ssh/id_rsa
