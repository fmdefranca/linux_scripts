#!/bin/bash

echo "Checking for updates and installing them with Y param."
apt update && apt upgrade -y
echo "Update finished"

echo "Installing -- Neovim, ZSH, Tmux, Git, Inkscape, Postgresql"
apt install -y neovim zsh tmux git inkscape postgresql postgresql-contrib
echo "Install Finished"

echo "Installing NodeJS & NPM"
apt-get install curl python-software-properties
curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
apt install -y nodejs
node --version
npm --version
echo "NodeJS & NPM installed Successfully"

echo "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo "Installation finished."

echo "Installing VictorMono Font."
dir=$(pwd)
cp "${dir}/VictorMono/OTF/*" ~/.fonts
echo "Fonts Installation Finished."

