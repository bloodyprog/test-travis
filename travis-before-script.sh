#!/bin/bash

if [[ "$LINUX_TEST" == "main" ]]; then
    gcc-5 --version
fi

if [[ "$LLVM_VERSION" == "3.6.2" ]]; then
    ls /usr/lib/llvm-3.6
    ls /usr/lib/llvm-3.6/include
    ls /usr/lib/llvm-3.6/lib/*clang*
    clang-3.6 --version
fi

if [[ "$LLVM_VERSION" == "3.7.1" ]]; then
    ls /usr/lib/llvm-3.7
    ls /usr/lib/llvm-3.7/include
    ls /usr/lib/llvm-3.7/lib/*clang*
    clang-3.7 --version
fi

if [[ "$LLVM_VERSION" == "3.8.0" ]]; then
    ls /usr/lib/llvm-3.8
    ls /usr/lib/llvm-3.8/include
    ls /usr/lib/llvm-3.8/lib/*clang*
    clang-3.8 --version
fi
