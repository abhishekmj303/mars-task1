#!/bin/bash
set -e

if [[ $(id -u) -ne 0 ]]; then
    sudo bash $BASH_SOURCE
    exit 0
fi

if ! (nc -zw1 8.8.8.8 443); then
    echo "Please connect to the internet"
    exit 1
fi

# Configure your Ubuntu repositories
add-apt-repository universe
add-apt-repository multiverse
add-apt-repository restricted

# Setup your sources.list
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
apt install curl -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

# Installation
apt update
apt install ros-melodic-desktop-full

# Environment Setup
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Dependencies for building packages
apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

# Initialize rosdep
rosdep init
rosdep update