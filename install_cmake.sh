#!/bin/bash


CMAKE_SH=cmake-3.16.2-Linux-x86_64.sh
wget https://github.com/Kitware/CMake/releases/download/v3.16.2/${CMAKE_SH}
CMAKE_INSTALL=$(pwd)/${CMAKE_SH}

mkdir -p ${APPS_DIR}/cmake
pushd ${APPS_DIR}/cmake
    sh ${CMAKE_INSTALL} --skip-license --exclude-subdir
popd

pushd ${APPS_BIN_DIR}
    ln -s ${APPS_DIR}/cmake/bin/cmake
popd

# Cleanup
rm ${CMAKE_INSTALL}
