#!/bin/bash

OS=`uname -s`

if [ ${OS} == "Linux" ]; then
	if [ -n "$(uname -v | grep Ubuntu)" ]; then
		sudo apt-get install vim ctags cscope
	elif [ -n "$(uname -v | grep Centos)" ]; then
		sudo yum install vim ctags cscope
	else
		echo "This OS not supported to install.sh"
	fi
elif [ ${OS} == "Darwin" ]; then
	sudo brew install vim ctags cscope
fi

# vundle install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp .vimrc ~/.vimrc
