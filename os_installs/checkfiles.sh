#!/bin/bash

if ! [ -x "$(command -v coded)" ]; then
    echo "Continue to install as not installed"
else
    echo "$(command code --version)"
fi