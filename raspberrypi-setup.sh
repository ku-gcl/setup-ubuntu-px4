# Utils
sudo apt update
sudo apt upgrade
sudo apt install -y git
# sudo apt-get install code       # vscodeをダウンロード
sudo apt install -y net-tools
sudo apt install -y openssh-server


# ROS2
# https://docs.px4.io/main/en/ros2/user_guide.html#humble
# https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt install -y software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt upgrade -y
sudo apt install -y ros-humble-desktop
sudo apt install -y ros-dev-tools
source /opt/ros/humble/setup.bash && echo "source /opt/ros/humble/setup.bash" >> .bashrc

# Some Python dependencies must also be installed (using pip or apt):
sudo apt install -y python3-pip
# pip install --user -U empy==3.3.4 pyros-genmsg setuptools


# uXRCE-DDS Agent (Raspberry Pi 4, Ubuntu 22.04で1時間くらいかかった)
# https://docs.px4.io/main/en/companion_computer/pixhawk_rpi.html#ros-setup-on-rpi
cd ~/
git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
# "Failed to checkout tag: '2.12.x'"というエラーが生じるので、修正
# You should check availability from Github
# https://github.com/eProsima/Fast-DDS/tree/v2.13.0
sed -i 's/set(_fastdds_tag 2.12.x)/set(_fastdds_tag 2.13.0)/g' ~/Micro-XRCE-DDS-Agent/CMakeLists.txt
cd ~/Micro-XRCE-DDS-Agent
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig /usr/local/lib/

# clone ROS packages -------------------
cd ~/
mkdir -p ws_px4/src
cd ws_px4/src

# px4_msgs
git clone https://github.com/PX4/px4_msgs.git

# px4_ros_com
# git clone https://github.com/ku-gcl/px4_ros_com.git
git clone git@github.com:ku-gcl/px4_ros_com.git

# ダウングレードしたsetuptoolsをインストール（デフォルトでは80.9.0）
# Error: canonicalize_version(version, strip_trailing_zero=False),
# TypeError: canonicalize_version() got an unexpected keyword argument 'strip_trailing_zero'
pip3 install "setuptools==65.5.0"

# sudo apt update
# sudo apt install libeigen3-dev

cd ~/ws_px4
colcon build --symlink-install

# mocap
sudo apt install -y ros-$ROS_DISTRO-vrpn-mocap
# ---------------------------------

# serial
sudo apt install -y raspi-config



# bashrc
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "source ~/ws_px4/install/setup.bash" >> ~/.bashrc


# Execute ------------------
# # Build
# cd ~/ws_px4
# colcon build --symlink-install

# # Micro XRCE-DDS Agent (/dev/ttyAMA0 or /dev/serial0)
# sudo MicroXRCEAgent serial --dev /dev/ttyAMA0 -b 921600
# sudo -S MicroXRCEAgent serial --dev /dev/ttyAMA0 -b 921600

# # Mocap (serverにはMotiveを起動しているPCのIPアドレスを指定)
# ros2 launch vrpn_mocap client.launch.yaml server:=192.168.1.196 port:=3883

# # mocap2PX4
# ros2 run px4_ros_com mocap_pose_to_px4_pose


# # echo
# ros2 topic list
# ros2 topic echo /vrpn_mocap/RigidBody/pose     ## Mocapからのデータが来ているか確認
# ros2 run px4_ros_com mocap_pose_to_px4_pose    ## Mocap-PX4のブリッジノード立ち上げ
# ros2 topic echo /fmu/out/vehicle_odometry      ## PX4からのEKF処理後のデータが来ているか確認

# # ros2 run
# ros2 run px4_ros_com position_control
# ros2 run px4_ros_com circle_position_control