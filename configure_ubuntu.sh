#!/bin/bash

# For arc-theme
sudo add-apt-repository ppa:noobslab/themes

# For paper-icon-theme
sudo add-apt-repository ppa:snwh/pulp

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install        \
    vim                     \
    git                     \
    tmux                    \
    arc-theme               \
    paper-icon-theme

# Prompt with current working dir
cat .bashrc >> ~/.bashrc

# Set aliases
cp .bash_aliases ~/
