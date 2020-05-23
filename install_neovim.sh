#!/bin/bash

NEOVIM_VERSION=0.4.3

# Dependencies
sudo apt-get install gettext libtool libtool-bin autoconf automake g++ pkg-config unzip

git clone https://github.com/neovim/neovim.git
pushd neovim
    git checkout v${NEOVIM_VERSION}
    make CMAKE_BUILD_TYPE=Release
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${APPS_DIR}/neovim"
    make install

    pushd ${APPS_BIN_DIR}
        ln -s ${APPS_DIR}/neovim/bin
    popd
popd

# Cleanup
rm -rf neovim
