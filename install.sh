#!/usr/bin/bash

# check sudo permission
if [ "$EUID" -ne 0 ]
  then sudo su
fi

# install prerequisites
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# instal packages
apt update && apt install -y fish nodejs latexmk yarn
yarn global add neovim prettier

# install docker 
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian (lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt install -y docker-ce

# install oh-my-fish
curl -L https://get.oh-my.fish | fish

# install bobthefish powerline
omf install bobthefish

# manually install delta
# https://github.com/dandavison/delta/releases/latest
