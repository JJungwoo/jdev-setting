#!/bin/bash

OS=`uname -s`

if [ ${OS} == "Linux" ]; then
	if [ -n "$(uname -v | grep Ubuntu)" ]; then
		sudo apt-get install -y vim ctags cscope
	elif [ -n "$(uname -v | grep Centos)" ]; then
		sudo yum install -y vim ctags cscope
	else
		echo "This OS not supported to install.sh"
	fi
elif [ ${OS} == "Darwin" ]; then
	sudo brew install vim ctags cscope
else
	echo "This OS not supported to install.sh"
fi

# vundle install
if [ -d "~/.vim/bundle/Vundle.vin" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cp .vimrc ~/.vimrc

# custome command add

if [ -d "~/bin/" ]; then
	mkdir ~/bin/
fi

cp mkcscope.sh ~/bin/

if [ ! -e "~/.zshrc" ]; then
	cat command_list >> ~/.zshrc
	. ~/.zshrc
else
	cat command_list >> ~/.bashrc
	. ~/.bashrc
fi

