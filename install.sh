#!/bin/sh
# Bash script for installing all the necessary packages and plugins
# Run with 'sudo' if permission is denied
# install packages
apt update
apt install neovim
apt install fish
apt install nodejs

# install docker 
apt install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian (lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get install docker-ce

# install oh-my-fish
curl -L https://get.oh-my.fish | fish

# install bobthefish powerline
omf install bobthefish

