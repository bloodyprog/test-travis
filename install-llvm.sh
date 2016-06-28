#!/bin/bash

set -e

os_name=$1

echo "$(tput setaf 6)$(tput bold)> [llvm]$(tput sgr 0)"

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then

    brew update
    brew install llvm38

else

    llvm_root=llvm-$LLVM_VERSION
    llvm_archive=llvm-$LLVM_VERSION.tar.xz

    if [[ ! -d $llvm_root ]]; then
      echo "$(tput setaf 3)$(tput bold)> [llvm] downloading binaries$(tput sgr 0)"
      wget -O $llvm_archive http://llvm.org/releases/$LLVM_VERSION/clang+llvm-$LLVM_VERSION-x86_64-linux-gnu-ubuntu-14.04.tar.xz
      mkdir $llvm_root
      xzcat $llvm_archive | tar -xvf - --strip 1 -C $llvm_root
    else
      echo "$(tput setaf 2)$(tput bold)> [llvm] already downloaded$(tput sgr 0)"
    fi

    export LLVM_CONFIG="$llvm_root/bin/llvm-config"

fi
