#!/bin/bash

set -e

os_name=$1

echo "$(tput setaf 6)$(tput bold)Dependency: Premake$(tput sgr 0)"

url=https://github.com/premake/premake-core/releases/download/v5.0.0-alpha8

if [[ $os_name == "osx" ]]; then
    wget $url/premake-5.0.0-alpha8-macosx.tar.gz
    tar -xf premake-5.0.0-alpha8-macosx.tar.gz
else
    echo "$(tput setaf 3)$(tput bold)> cloning from github$(tput sgr 0)"

    github=https://github.com/premake/premake-core.git
    branch=release

    git clone --depth=1 --recursive -b $branch --single-branch $github premake-core

    echo "$(tput setaf 3)$(tput bold)> compiling$(tput sgr 0)"

    cd premake-core
    make -f Bootstrap.mak linux
    cd ..

    cp premake-core/bin/release/premake5 premake5
fi
