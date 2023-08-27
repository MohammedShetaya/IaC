#!/bin/bash

set -x

if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Installing..."
    sudo apt update -y
    sudo apt install npm -y

    echo "Node.js is now installed."
else
    echo "Node.js is already installed."
fi

echo "Installing dependencies..."
npm install

npm start > server.log 2>&1 &
