#!/bin/bash

sudo cp sources.list /etc/apt/sources.list
sudo apt-get install zsh git htop tmux screen python-pip curl
sudo pip install virtualenv virtualenvwrapper
git config --global user.name "lozzo"
git config --global user.email "wuyouget@gmail.com"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp zeta.zsh-theme /home/lozzow/.oh-my-zsh/themes
cp .zshrc ~ 
