#!/bin/bash

set -ex

# Setup bash
cat .bashrc >> ~/.bashrc
cp .bash_aliases ~/
