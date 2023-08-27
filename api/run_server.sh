#!/bin/bash

set -x

if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Installing..."

    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install -y curl

    # add nodejs repository 
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

    sudo apt install -y nodejs 

    echo "Node.js is now installed."
else
    echo "Node.js is already installed."
fi

echo "Installing dependencies..."
npm ci

npm start > server.log 2>&1 &
