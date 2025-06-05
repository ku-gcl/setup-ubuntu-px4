# Utils
sudo apt update
sudo apt upgrade
sudo apt install -y git
# sudo apt-get install code       # vscodeをダウンロード
sudo apt install -y net-tools
sudo apt install -y openssh-server

# ROS2
# https://docs.px4.io/main/en/ros2/user_guide.html#humble

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
pip install --user -U empy==3.3.4 pyros-genmsg setuptools


# Setup Micro XRCE-DDS Agent & Client
git clone -b v2.4.2 https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
# "Failed to checkout tag: '2.12.x'"というエラーが生じるので、修正
# You should check availability from Github
# https://github.com/eProsima/Fast-DDS/tree/v2.13.0
sed -i 's/set(_fastdds_tag 2.12.x)/set(_fastdds_tag 2.13.0)/g' ~/Micro-XRCE-DDS-Agent/CMakeLists.txt
cd Micro-XRCE-DDS-Agent
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig /usr/local/lib/

# install rqt
sudo apt install -y ros-humble-rqt-*

# Install Gazebo classic
# https://qiita.com/porizou1/items/5dd915402e2990e4d95f
# sudo apt install -y gazebo
# sudo apt install -y ros-humble-gazebo-*
 
# Gazebo Ignition
# https://qiita.com/Yuzu2yan/items/ee0fe1e76638803afd3a

sudo apt-get update
sudo apt-get install lsb-release wget gnupg
sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
sudo apt-get update
sudo apt-get install -y gz-harmonic
