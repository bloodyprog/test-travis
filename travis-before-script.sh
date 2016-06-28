#!/bin/bash

echo "$(tput setaf 2)$(tput bold)Travis: Before Script$(tput sgr 0)"

if [[ "$LINUX_TEST" == "main" ]]; then
    gcc-5 --version
fi

if [[ "$LLVM_VERSION" == "3.6.2" ]]; then
    ls llvm-3.6.2
    ls llvm-3.6.2/include
    ls llvm-3.6.2/lib/*clang*
    llvm-3.6.2/bin/clang --version
fi

if [[ "$LLVM_VERSION" == "3.7.1" ]]; then
    ls llvm-3.7.1
    ls llvm-3.7.1/include
    ls llvm-3.7.1/lib/*clang*
    llvm-3.7.1/bin/clang-3.7 --version
fi

if [[ "$LLVM_VERSION" == "3.8.0" ]]; then
    ls llvm-3.8.0
    ls llvm-3.8.0/include
    ls llvm-3.8.0/lib/*clang*
    llvm-3.8.0/bin/clang-3.8 --version
fi
