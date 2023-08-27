#!/bin/env bash

if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Installing..."
    sudo apt update -y
    sudo apt install npm -y

    echo "Node.js is now installed."
else
    echo "Node.js is already installed."
fi

npm ci
npm start
