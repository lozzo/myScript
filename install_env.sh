#!/bin/bash

sudo cp sources.list /etc/apt/sources.list
sudo apt-get install zsh git htop tmux screen python-pip
sudo pip install virtualenv virtualenvwrapper
git config --global user.name "lozzo"
git config --global user.email "wuyouget@gmail.com"

