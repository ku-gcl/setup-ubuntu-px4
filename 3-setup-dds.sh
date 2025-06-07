#!/bin/bash


# uXRCE-DDS Agent (Raspberry Pi 4, Ubuntu 22.04で1時間くらいかかった)
# https://docs.px4.io/main/en/companion_computer/pixhawk_rpi.html#ros-setup-on-rpi
# Original: git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git

# https://docs.px4.io/main/en/middleware/uxrce_dds.html#starting-the-client
# PX4 Micro XRCE-DDS Client is based on version v2.x which is not compatible with the latest v3.x Agent version.
cd ~/
git clone -b v2.4.2 https://github.com/eProsima/Micro-XRCE-DDS-Agent.git


# "Failed to checkout tag: '2.12.x'"というエラーが生じるので、修正
# You should check availability from Github
# https://github.com/eProsima/Fast-DDS/tree/v2.13.0
sed -i 's/set(_fastdds_tag 2.12.x)/set(_fastdds_tag 2.13.0)/g' ~/Micro-XRCE-DDS-Agent/CMakeLists.txt
sed -i 's/set(_fastdds_version 2.12)/set(_fastdds_version 2.13)/g' ~/Micro-XRCE-DDS-Agent/CMakeLists.txt
cd ~/Micro-XRCE-DDS-Agent
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig /usr/local/lib/