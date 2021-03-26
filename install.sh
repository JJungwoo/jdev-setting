#!/bin/bash

OS=`uname -s`

if [ ${OS} == "Linux" ]; then
	if [ -n "$(uname -v | grep Ubuntu)" ] || [ -n "$(cat /etc/lsb-release | grep Ubuntu)" ] ; then
        echo "Install ubuntu package"
		sudo apt-get install -y vim ctags cscope
	elif [ -n "$(uname -v | grep Centos)" ] || [ -n "$(cat /etc/redhat-release | grep CentOS)" ] ; then
        echo "Install centos package"
		sudo yum install -y vim ctags cscope
	else
		echo "This OS not supported to install.sh"
	fi
elif [ ${OS} == "Darwin" ]; then
    echo "Install macos package"
	sudo brew install vim ctags cscope
else
	echo "This OS not supported to install.sh"
fi

# vundle install
if [ -d "~/.vim/bundle/Vundle.vin" ]; then
    echo "Alreadly install vundle"
else
    echo "Install vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "cp vimrc"
cp .vimrc ~/.vimrc

# custome command add

if [ -e "~/bin/" ]; then
    echo "exist bin directory"
else
    echo "create bin directory"
	mkdir ~/bin/
fi

cp mkcscope.sh ~/bin/

echo "set custom command"
if [ ! -e "~/.zshrc" ]; then
	cat command_list >> ~/.zshrc
	. ~/.zshrc
elif [ ! -e "~/.bashrc" ]; then
	cat command_list >> ~/.bashrc
	. ~/.bashrc
else
	cat command_list >> ~/.bash_profile
	. ~/.bash_profile
fi

