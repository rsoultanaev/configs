#!/bin/bash

# Setup bash
cat .bashrc >> ~/.bashrc
cp .bash_aliases ~/
source ~/.bashrc

# Set up app dirs for custom installations
mkdir -p ${APPS_DIR}
mkdir -p ${APPS_BIN_DIR}

# For arc-theme
sudo add-apt-repository ppa:noobslab/themes

# For paper-icon-theme
sudo add-apt-repository ppa:snwh/pulp

# Apt installs
sudo apt update
sudo apt upgrade
sudo apt install $(cat package-list)
sudo apt autoremove

# Custom installations
WORKDIR=workdir
mkdir -p ${WORKDIR}
pushd ${WORKDIR}
    ./install_cmake.sh
    ./install_neovim.sh
popd

# Copy configs
cp .tmux.conf ~/
tar -C ${WORKDIR} xzf xfce-desktop-config.tar.gz
cp ${WORKDIR}/xfce-desktop-config/* ~/.config/
