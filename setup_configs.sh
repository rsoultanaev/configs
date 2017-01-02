#!/bin/bash

cp .vimrc ~/
cp .tmux.conf ~/

# Install vundle
mkdir -p ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vim plugins
vim +PluginInstall +qall

