#!/bin/bash

echo "$(tput setaf 2)Travis Install Script$(tput sgr 0)"

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    brew update
    brew install gcc5
    brew install gcc6
    brew install llvm38
    brew install sqlite
fi

if [[ "${TRAVIS_OS_NAME}" = "linux" ]]; then
    if [[ -z "$(ls -A llvm-$LLVM_VERSION)" ]]; then
      wget -O llvm-$LLVM_VERSION.tar.xz http://llvm.org/releases/$LLVM_VERSION/clang+llvm-$LLVM_VERSION-x86_64-linux-gnu-ubuntu-14.04.tar.xz
      mkdir llvm-$LLVM_VERSION
      xzcat llvm-$LLVM_VERSION.tar.xz | tar -xvf - --strip 1 -C llvm-$LLVM_VERSION
    fi

    llvm-$LLVM_VERSION/bin/llvm-config --version
    export LLVM_CONFIG="llvm-$LLVM_VERSION/bin/llvm-config"
fi

./download-premake.sh $TRAVIS_OS_NAME
