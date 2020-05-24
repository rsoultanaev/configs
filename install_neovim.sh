#!/bin/bash

NEOVIM_VERSION=0.4.3

git clone https://github.com/neovim/neovim.git
pushd neovim
    git checkout v${NEOVIM_VERSION}
    make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${APPS_DIR}/neovim"
    make install

    pushd ${APPS_BIN_DIR}
        ln -s ${APPS_DIR}/neovim/bin
    popd
popd

cp .vimrc ~/
mkdir -p ~/.config/nvim ; cp init.vim ~/.config/nvim/
vim +PlugInstall +qall
