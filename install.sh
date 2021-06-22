#!/usr/bin/env bash

# check sudo permission
if [ "$EUID" -ne 0 ]
  then sudo su
fi

# dependencies
apt install -qqy
  \ apt-transport-https
  \ ca-certificates
  \ gnupg
  \ lsb-release
  \ > /dev/null 2> /dev/null

# apt
apt update -qq && apt install -qqy
  \ neovim
  \ fish
  \ curl
  \ make
  \ nodejs
  \ git
  \ latexmk
  \ yarn
  \ python3
  \ python3-pip
  \ tmux
  \ > /dev/null 2> /dev/null

# yarn
yarn global add --silent
  \ neovim
  \ prettier

# pip
python3 -m pip install --quiet
  \ pynvim

# docker
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian "(lsb_release -cs)" stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt install -qqy docker-ce > /dev/null 2> /dev/null

# oh-my-fish
curl -L https://get.oh-my.fish | fish

# bobthefish
omf install bobthefish

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# delta
# manual install: https://github.com/dandavison/delta/releases/latest
