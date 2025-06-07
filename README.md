# Ubuntu setup script for desktop and Raspberry Pi
## Info
- OS: Ubuntu 22.04

## Setup Git

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git
```


## Clone

```bash
cd ~/
git clone https://github.com/ku-gcl/setup-ubuntu-px4.git
```

## Execute

### 1. Utils
```bash
cd ~/setup-ubuntu-px4
source 1-setup-utils.sh
```

### 2. ROS

- for Ubuntu 22.04 user
    ```bash
    source 2-setup-ros2-humble.sh
    ```
- for Ubuntu 24.04 user
    ```bash
    source 2-setup-ros2-jazzy.sh
    ```

### 3. dds

```bash
source 3-setup-dds.sh
```

### 4. ros-packages

```bash
source 4-setup-ros-packages.sh
```

### 5. Other tools

#### for Desktop PC User

```bash
source 5-desktop-setup.sh
```

#### for Raspberry Pi User

```bash
source 5-raspberrypi-setup.sh
```

## Trouble shooting
### setuptoolでエラーが起きるとき
Ubuntu 22.04 running on Raspberry Pi 4では以下のエラーが生じた。

```bash
# Error: canonicalize_version(version, strip_trailing_zero=False),
# TypeError: canonicalize_version() got an unexpected keyword argument 'strip_trailing_zero'
```

そこで、以下のコマンドで、ダウングレードしたsetuptoolsをインストール（デフォルトでは80.9.0）

```bash
pip3 uninstall setuptools
pip3 install "setuptools==65.5.0"
```