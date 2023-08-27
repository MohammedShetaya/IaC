#!/bin/bash

set -x

if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Installing..."
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
    echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
    echo "deb-src [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list > /dev/null

    sudo apt update -y
    sudo apt install -y nodejs 

    echo "Node.js is now installed."
else
    echo "Node.js is already installed."
fi

echo "Installing dependencies..."
npm install

npm start > server.log 2>&1 &
