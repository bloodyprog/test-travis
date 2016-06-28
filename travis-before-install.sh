#!/bin/bash

echo "$(tput setaf 6)$(tput bold)Travis Install Script$(tput sgr 0)"

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    brew update
    brew install gcc5
    brew install gcc6
    brew install llvm38
    brew install sqlite
fi

llvm_root=llvm-$LLVM_VERSION
llvm_archive=llvm-$LLVM_VERSION.tar.xz

if [[ "${TRAVIS_OS_NAME}" = "linux" ]]; then
    if [[ ! -d $llvm_root ]]; then
      echo "$(tput setaf 6)$(tput bold)Downloading...$(tput sgr 0)"
      wget -O $llvm_archive http://llvm.org/releases/$LLVM_VERSION/clang+llvm-$LLVM_VERSION-x86_64-linux-gnu-ubuntu-14.04.tar.xz
      mkdir $llvm_root
      xzcat $llvm_archive | tar -xvf - --strip 1 -C $llvm_root
    else
      echo "$(tput setaf 6)$(tput bold)Already Downloaded$(tput sgr 0)"
    fi

    $llvm_root/bin/llvm-config --version
    export LLVM_CONFIG="$llvm_root/bin/llvm-config"
fi

./download-premake.sh $TRAVIS_OS_NAME
