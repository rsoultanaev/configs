#!/bin/bash

set -ex

NEOVIM_VERSION=0.5.0

git clone https://github.com/neovim/neovim.git
pushd neovim
    git checkout v${NEOVIM_VERSION}
    make CMAKE_BUILD_TYPE=Release \
         CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${APPS_DIR}/neovim"
    make install

    pushd ${APPS_BIN_DIR}
        ln -s ${APPS_DIR}/neovim/bin/nvim
    popd
popd

# Copy configs
cp ${CONFIG_DIR}/.vimrc ~/
mkdir -p ~/.config/nvim
cp ${CONFIG_DIR}/init.vim ~/.config/nvim/

# Install plugins
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
     --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
