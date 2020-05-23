#!/bin/bash

# Set bash settings
cat .bashrc >> ~/.bashrc

# Set aliases
cp .bash_aliases ~/

# Activate bash settings
source ~/.bashrc

# Set up app dirs
mkdir -p ${APPS_DIR}
mkdir -p ${APPS_BIN_DIR}

# For arc-theme
sudo add-apt-repository ppa:noobslab/themes

# For paper-icon-theme
sudo add-apt-repository ppa:snwh/pulp

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install            \
    git                         \
    tmux                        \
    arc-theme                   \
    paper-icon-theme            \
    texlive-full                \
    build-essential             \
    clang                       \
    ninja-build                 \
    tree                        \
    curl                        \
    python3.8                   \
    python3.8-distutils         \
    python3.8-venv

# Custom installations
./install_cmake.sh
./install_neovim.sh

# Copy configs
cp .vimrc ~/
cp .tmux.conf ~/
mkdir -p ~/.config/nvim ; cp init.vim ~/.config/nvim/

# Install vim plugins
vim +PlugInstall +qall
