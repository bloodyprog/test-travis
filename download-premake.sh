#!/bin/bash

set -e
set -x

os_name=$1
url=https://github.com/premake/premake-core/releases/download/v5.0.0-alpha8

if [[ $os_name == "osx" ]]; then
    wget $url/premake-5.0.0-alpha8-macosx.tar.gz
    tar -xf premake-5.0.0-alpha8-macosx.tar.gz
else
    github=https://github.com/premake/premake-core.git
    branch=release

    git clone --depth=1 --recursive -b $branch --single-branch $github premake-core

    cd premake-core
    make -f Bootstrap.mak linux
    cd ..

    cp premake-core/bin/release/premake5 premake5
fi
