#!/bin/bash

echo "$(tput setaf 6)$(tput bold)Travis: Before Install$(tput sgr 0)"

dependencies_root="dependencies"

if [[ ! -d $dependencies_root ]]; then
    mkdir $dependencies_root
fi

pushd $dependencies_root > /dev/null

ls -l

#../install-llvm.sh $TRAVIS_OS_NAME
../install-premake.sh $TRAVIS_OS_NAME

popd > /dev/null
