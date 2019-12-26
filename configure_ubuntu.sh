#!/bin/bash

# Set bash settings
cat .bashrc >> ~/.bashrc

# Set aliases
cp .bash_aliases ~/

# Activate bash settings
source ~/.bashrc

# Set up app dirs
APPS_DIR=~/opt/apps
APPS_BIN_DIR=~/opt/bin
mkdir -p ${APPS_DIR}
mkdir -p ${APPS_BIN_DIR}

# For arc-theme
sudo add-apt-repository ppa:noobslab/themes

# For paper-icon-theme
sudo add-apt-repository ppa:snwh/pulp

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install            \
    vim                         \
    git                         \
    tmux                        \
    arc-theme                   \
    paper-icon-theme            \
    texlive-full                \
    build-essential             \
    clang                       \
    ninja-build                 \
    tree                        \
    python3.8

# Install cmake like this because apt is out of date
mkdir -p ${APPS_DIR}/cmake
CMAKE_SH=cmake-3.16.2-Linux-x86_64.sh
wget https://github.com/Kitware/CMake/releases/download/v3.16.2/${CMAKE_SH}
CMAKE_INSTALL=$(pwd)/${CMAKE_SH}
pushd ${APPS_DIR}/cmake
    sh ${CMAKE_INSTALL} --skip-license --exclude-subdir
popd
pushd ${APPS_BIN_DIR}
    ln -s ${APPS_DIR}/cmake/bin/cmake
popd
