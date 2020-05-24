#!/bin/bash

set -ex

# Set up app dirs for custom installations
mkdir -p ${APPS_DIR}
mkdir -p ${APPS_BIN_DIR}

# For arc-theme
sudo add-apt-repository -y ppa:noobslab/themes

# For paper-icon-theme
sudo add-apt-repository -y ppa:snwh/ppa

# Apt installs
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install $(cat package-list)
sudo apt -y autoremove

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
