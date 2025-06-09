#!/bin/bash

# Run PX4 SITL
cd ~/PX4-Autopilot && make px4_sitl gz_x500
#for ubuntu20 run -> make px4_sitl gazebo-classic

qgroundcontrol

# Run DDS
MicroXRCEAgent udp4 -p 8888

# Run ROS2
cd ~/ws_px4
ros2 run px4_ros_com setpoint_control
