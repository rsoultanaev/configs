#!/bin/bash

set -ex

CONFIG_DIR=$(pwd)
export CONFIG_DIR

# Set up app dirs for custom installations
mkdir -p ${APPS_DIR}
mkdir -p ${APPS_BIN_DIR}

# Apt installs
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install $(cat package-list)
sudo apt-get -y autoremove

# Custom installations
WORKDIR=workdir
mkdir -p ${WORKDIR}
pushd ${WORKDIR}
    ${CONFIG_DIR}/install_cmake.sh
    ${CONFIG_DIR}/install_neovim.sh
popd

# Copy configs
cp .tmux.conf ~/
