#!/bin/bash

set -e
set -x

os_name=$1
url=https://github.com/premake/premake-core/releases/download/v5.0.0-alpha8

if [[ $os_name == "osx" ]]; then
    wget $url/premake-5.0.0-alpha8-macosx.tar.gz
    tar -xf premake-5.0.0-alpha8-macosx.tar.gz
else
    wget $url/premake-5.0.0-alpha8-linux.tar.gz
    tar -xf premake-5.0.0-alpha8-linux.tar.gz
fi
