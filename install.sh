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
	brew install vim ctags cscope
    home_path=/Users/${user}/
else
	echo "This OS not supported to install.sh"
fi

echo "set user home_path :" ${home_path}

# vundle install
if [ -e "${home_path}.vim/bundle/Vundle.vim" ]; then
    echo "Alreadly install vundle"
else
    echo "Install vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -e "${home_path}.vimrc" ]; then
    echo "extst vimrc"
else
    echo "cp ${home_path}vimrc"
    cp .vimrc ${home_path}/.vimrc
fi

# custome command add

if [ -d "${home_path}bin/" ]; then
    echo "exist bin directory"
else
    echo "create ${home_path}/bin directory"
	mkdir ${home_path}bin/
fi

if [ -e "${home_path}bin/mkcscope.sh" ]; then
    echo "Alreadly copy mkcscope.sh"
else
    echo "copy success ${home_path}bin/mkcscope.sh"
    cp mkcscope.sh ${home_path}bin/
fi

if [ -e "${home_path}.zshrc" ]; then
    echo "exist" ${home_path}".zshrc"
else
    cp ./zshrc ${home_path}.zshrc
fi


: << "END"
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
END
