#!/bin/bash

# Build
cd ~/ws_px4
colcon build --symlink-install

# Micro XRCE-DDS Agent (/dev/ttyAMA0 or /dev/serial0)
sudo MicroXRCEAgent serial --dev /dev/ttyAMA0 -b 921600

# Mocap (serverにはMotiveを起動しているPCのIPアドレスを指定)
ros2 launch vrpn_mocap client.launch.yaml server:=192.168.1.196 port:=3883

# mocap2PX4
ros2 run px4_ros_com mocap_pose_to_px4_pose


# echo
ros2 topic list
ros2 topic echo /vrpn_mocap/RigidBody/pose     ## Mocapからのデータが来ているか確認
ros2 run px4_ros_com mocap_pose_to_px4_pose    ## Mocap-PX4のブリッジノード立ち上げ
ros2 topic echo /fmu/out/vehicle_odometry      ## PX4からのEKF処理後のデータが来ているか確認

# ros2 run
ros2 run px4_ros_com position_control
ros2 run px4_ros_com circle_position_control
