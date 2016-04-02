#!/bin/bash

if [[ "$TRAVIS" == "true" ]]; then
    echo "DetectTravis: YES!"
else
    echo "DetectTravis: no..."
fi
