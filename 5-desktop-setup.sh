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

# install QGroundControl -------------------
# https://docs.qgroundcontrol.com/master/en/qgc-user-guide/getting_started/download_and_install.html#ubuntu
sudo usermod -a -G dialout $USER
sudo apt-get remove modemmanager -y
sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y
sudo apt install libfuse2 -y
sudo apt install libxcb-xinerama0 libxkbcommon-x11-0 libxcb-cursor-dev -y

# Logout and login again to enable the change to user permissions.
#   To install QGroundControl:
# Download QGroundControl-x86_64.AppImage.
cd ~/Downloads
wget -c https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl-x86_64.AppImage
# Install (and run) using the terminal commands:
chmod +x ./QGroundControl-x86_64.AppImage
echo "alias qgroundcontrol='~/AppImages/QGroundControl.AppImage'" >> ~/.bashrc
source ~/.bashrc
# Run QGroundControl
qgroundcontrol
# ---------------------------------------

# vscode install
# 1. VS Code の最新 .deb を取得
cd ~/Downloads
wget -O code_latest_amd64.deb \
  "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
# 2. 依存解決しつつインストール
sudo apt update
sudo apt install -y ./code_latest_amd64.deb
# 3. 不要になった .deb ファイルを削除
rm code_latest_amd64.deb


# /etc/os-releaseからUbuntuバージョンを取得
source /etc/os-release

if [ "$VERSION_ID" == "22.04" ]; then
  echo "Ubuntu 22.04 detected. Installing PlotJuggler..."

  # ROS用のPlotJugglerをインストール
  sudo apt update
  sudo snap install plotjuggler

  echo "PlotJuggler installed."
else
  echo "Plotjuggler only supports Ubuntu 22.04."
  exit 1
fi
