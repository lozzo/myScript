#!/bin/bash
set -e

HOME=/home/$USER
sudo apt-get update
sudo apt-get install -y zsh git htop screen python-pip curl build-essential cmake python-dev libevent-dev
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
wget https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz -O /tmp/tmux.tgz
mkdir -p /tmp/build-tmux
tar -zxvf /tmp/tmux.tgz -C /tmp/build-tmux 
cd /tmp/build-tmux/tmux-2.8 && ./configure && make
sudo make install
cp tmux.conf ~/.tmux.conf 
