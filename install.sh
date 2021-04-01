#!/bin/bash

user=`whoami`

echo "set custom command"

OS=`uname -s`

if [ ${OS} == "Linux" ]; then
	if [ -n "$(uname -v | grep Ubuntu)" ] || [ -n "$(cat /etc/lsb-release | grep Ubuntu)" ] ; then
        echo "Install ubuntu package"
		sudo apt-get install -y vim ctags cscope
        home_path=/home/${user}/
	elif [ -n "$(uname -v | grep Centos)" ] || [ -n "$(cat /etc/redhat-release | grep CentOS)" ] ; then
        echo "Install centos package"
		sudo yum install -y vim ctags cscope
        home_path=/home/${user}/
	else
		echo "This OS not supported to install.sh"
	fi
elif [ ${OS} == "Darwin" ]; then
    echo "Install macos package"
	sudo brew install vim ctags cscope
    home_path=/Users/${user}/
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

if [ -e "${home_path}/bin/" ]; then
    echo "exist bin directory"
else
    echo "create bin directory"
	mkdir ${home_path}/bin/
fi

cp mkcscope.sh ~/bin/

echo "set custom command"
if [ -e "${home_path}/.zshrc" ]; then
	echo "command_list set zshrc"
	cat command_list >> ~/.zshrc
	. ~/.zshrc
elif [ -e "${home_path}/.bashrc" ]; then
	echo "command_list set bashrc"
	cat command_list >> ~/.bashrc
	. ~/.bashrc
else
	echo "command_list set bash_profile"
	cat command_list >> ~/.bash_profile
	. ~/.bash_profile
fi

