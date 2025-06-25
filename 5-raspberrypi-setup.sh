#!/bin/bash
# PC: Raspberry Pi 4
# OS: Ubuntu 22.04

sudo apt update && sudo apt upgrade -y

# mocap
sudo apt install -y ros-$ROS_DISTRO-vrpn-mocap
# ---------------------------------

# serial
sudo apt install -y raspi-config

# Enable UART
sudo bash -c 'echo -e "\n# Enable UART settings\nenable_uart=1\ndtoverlay=disable-bt\ndtparam=uart0" >> /boot/firmware/config.txt'

sudo reboot
