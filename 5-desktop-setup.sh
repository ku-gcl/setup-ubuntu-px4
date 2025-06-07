#!/bin/bash
# OS: Ubuntu 22.04

sudo apt update && sudo apt upgrade -y

# install rqt
sudo apt install -y ros-$ROS_DISTRO-rqt-*
 
# Option A: Install Gazebo Ignition (Recommended)
# https://qiita.com/Yuzu2yan/items/ee0fe1e76638803afd3a
sudo apt install -y lsb-release wget gnupg
sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
sudo apt update
sudo apt install -y gz-harmonic

# # Option B: Install Gazebo classic
# # https://qiita.com/porizou1/items/5dd915402e2990e4d95f
# sudo apt install -y gazebo
# sudo apt install -y ros-humble-gazebo-*
