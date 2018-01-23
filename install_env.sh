#!/bin/bash
HOME=/home/$USER
sudo cp sources.list /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y zsh git htop tmux screen python-pip curl
mkdir $HOME/.pip
cp pip.conf $HOME/.pip/
sudo pip install virtualenv virtualenvwrapper
git config --global user.name "lozzo"
git config --global user.email "wuyouget@gmail.com"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp zeta.zsh-theme /home/$USER/.oh-my-zsh/themes
cp .zshrc ~ 
