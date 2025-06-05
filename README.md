# Ubuntu setup script for desktop and Raspberry Pi
## Info
- OS: Ubuntu 22.04

## Setup Git

```bash
sudo apt update
sudo apt upgrade
sudo apt install -y git
```


## Clone

```bash
cd ~/
git clone https://github.com/ku-gcl/setup-ubuntu22.git
```

## Execute

### Desktop PC

```bash
cd ~/setup-ubuntu22
source desktop-setup.sh
```

### Raspberry Pi

```bash
cd ~/setup-ubuntu22
source raspberrypi-setup.sh
```