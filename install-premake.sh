#!/bin/bash

set -e
set -x

os_name=$1

echo "$(tput setaf 6)$(tput bold)> [premake]$(tput sgr 0)"

if [[ $os_name == "osx" ]]; then

    url=https://github.com/premake/premake-core/releases/download/v5.0.0-alpha8

    wget $url/premake-5.0.0-alpha8-macosx.tar.gz
    tar -xf premake-5.0.0-alpha8-macosx.tar.gz

else

    premake_root=premake-core

    if [[ ! -d $premake_root ]]; then
        echo "$(tput setaf 3)$(tput bold)> [premake] cloning from github$(tput sgr 0)"

        github=https://github.com/premake/premake-core.git
        branch=release

        git clone --depth=1 --recursive -b $branch --single-branch $github premake-core
    else
        echo "$(tput setaf 2)$(tput bold)> [premake] already cloned from github$(tput sgr 0)"
    fi

    if [[ ! -f $premake_root/bin/release/premake5 ]]; then
        echo "$(tput setaf 3)$(tput bold)> [premake] compiling$(tput sgr 0)"

        ls

        cd $premake_root
        ls
        
        make -f Bootstrap.mak linux
        cd ..
    else
        echo "$(tput setaf 2)$(tput bold)> [premake] already compiled$(tput sgr 0)"
    fi

    cp $premake_root/bin/release/premake5 premake5

fi
