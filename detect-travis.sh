#!/bin/bash

if [[ -z ${TRAVIS} ]]; then
    echo "Detect Travis: not travis..."
else
    echo "Detect Travis: travis!"
fi
