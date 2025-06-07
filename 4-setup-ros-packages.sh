#!/bin/bash


# clone ROS packages -------------------
cd ~/
mkdir -p ws_px4/src
cd ws_px4/src

# px4_msgs
git clone https://github.com/PX4/px4_msgs.git

# px4_ros_com
# git clone https://github.com/ku-gcl/px4_ros_com.git
# or
git clone git@github.com:ku-gcl/px4_ros_com.git


# build
cd ~/ws_px4
colcon build --symlink-install


# bashrc
# echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc    # already executed at ros2 setup
echo "source ~/ws_px4/install/setup.bash" >> ~/.bashrc