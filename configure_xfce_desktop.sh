#!/bin/bash

set -ex

CONFIG_DIR=$(pwd)
export CONFIG_DIR

# For arc-theme
sudo add-apt-repository -y ppa:noobslab/themes

# For paper-icon-theme
sudo add-apt-repository -y ppa:snwh/ppa

# Apt installs
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install arc-theme paper-icon-theme
sudo apt-get -y autoremove

# Extract and copy xfce config
WORKDIR=workdir
mkdir -p ${WORKDIR}
tar xzf xfce-desktop-config.tar.gz -C ${WORKDIR}
cp -r ${WORKDIR}/xfce-desktop-config/* ~/.config/
