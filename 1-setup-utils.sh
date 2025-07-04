#!/bin/bash

# -----------------
# Install
# - net-tools for ifconfig
# - opessh-server for ssh connection
# - python3-pip
# -----------------

# Utils
sudo apt update
sudo apt upgrade
sudo apt install -y git
# sudo apt-get install code       # vscodeをダウンロード
sudo apt install -y net-tools
sudo apt install -y openssh-server
sudo apt install -y python3-pip
