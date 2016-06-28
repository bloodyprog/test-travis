#!/bin/bash

echo "$(tput setaf 6)$(tput bold)Travis: Before Install$(tput sgr 0)"

./install-llvm.sh $TRAVIS_OS_NAME
./install-premake.sh $TRAVIS_OS_NAME
