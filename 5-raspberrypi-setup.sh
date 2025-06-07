#!/bin/bash
# PC: Raspberry Pi 4
# OS: Ubuntu 22.04

sudo apt update && sudo apt upgrade -y

# mocap
sudo apt install -y ros-$ROS_DISTRO-vrpn-mocap
# ---------------------------------

# serial
sudo apt install -y raspi-config

