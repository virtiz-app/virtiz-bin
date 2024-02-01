#!/bin/bash

KERNEL=$(uname -s)
ARCH=$(arch)
EXEC=$1

if [ "$#" -ne 1 ]; then
    echo 'You need pass parameters like: ./run-sh "--version"'
    exit 1
fi

if [ $KERNEL != "Linux" ]; then
    echo "Unsupported kernel: $KERNEL"
    exit 1
fi

if [ $ARCH == "arm64" ]; then
    echo "Running on arm64 architecture."
    chmod +x ./php/php-arm64
    ./php/php-arm64 $EXEC
elif [ $ARCH == "x86_64" ]; then
    echo "Running on x86_64 architecture."
    chmod +x ./php/php-x86_64
    ./php/php-x86_64 $EXEC
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi