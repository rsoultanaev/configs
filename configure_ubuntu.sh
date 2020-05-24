#!/bin/bash

set -ex

CONFIG_DIR=$(pwd)
export CONFIG_DIR

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
    ${CONFIG_DIR}/install_cmake.sh
    ${CONFIG_DIR}/install_neovim.sh
popd

# Copy configs
cp .tmux.conf ~/
tar xzf xfce-desktop-config.tar.gz -C ${WORKDIR}
cp -r ${WORKDIR}/xfce-desktop-config/* ~/.config/
