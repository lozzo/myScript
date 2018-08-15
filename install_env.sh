#!/bin/bash
set -e

HOME=/home/$USER
sudo apt-get update
sudo apt-get install -y zsh git htop tmux screen python-pip curl build-essential cmake python-dev
mkdir $HOME/.pip
cp pip.conf $HOME/.pip/
sudo pip install virtualenv virtualenvwrapper
git config --global user.name "lozzo"
git config --global user.email "wuyouget@gmail.com"
mkdir ~/.vim/bundle 
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
mkdir ~/go 
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp zeta.zsh-theme /home/$USER/.oh-my-zsh/themes
cp .zshrc ~ 
