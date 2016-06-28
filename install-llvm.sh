#!/bin/bash

set -e

os_name=$1

echo "$(tput setaf 6)$(tput bold)Dependnecy: LLVM$(tput sgr 0)"

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then

    brew update
    brew install gcc5
    brew install gcc6
    brew install llvm38
    brew install sqlite

elif [[ "${TRAVIS_OS_NAME}" = "linux" ]]; then

    llvm_root=llvm-$LLVM_VERSION
    llvm_archive=llvm-$LLVM_VERSION.tar.xz

    if [[ ! -d $llvm_root ]]; then
      echo "$(tput setaf 3)$(tput bold)> downloading binaries$(tput sgr 0)"
      wget -O $llvm_archive http://llvm.org/releases/$LLVM_VERSION/clang+llvm-$LLVM_VERSION-x86_64-linux-gnu-ubuntu-14.04.tar.xz
      mkdir $llvm_root
      xzcat $llvm_archive | tar -xvf - --strip 1 -C $llvm_root
      echo "$(tput setaf 3)$(tput bold)> download complete$(tput sgr 0)"
    else
      echo "$(tput setaf 2)$(tput bold)> already downloaded$(tput sgr 0)"
    fi

    $llvm_root/bin/llvm-config --version
    export LLVM_CONFIG="$llvm_root/bin/llvm-config"

fi
