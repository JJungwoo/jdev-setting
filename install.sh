#!/bin/bash

OS=`uname -s`

if [ ${OS} == "Linux" ]; then
  if [ -n "$(uname -v | grep Ubuntu)" ]; then
	apt-get install vim ctags cscope
  elif [ -n "$(uname -v | grep Centos)" ]; then
	yum install vim ctags cscope
  else
	echo "This OS not supported to install.sh"
  fi
elif [ ${OS} == "Darwin" ]; then
  brew install vim ctags cscope
fi

cp .vimrc ~/.vimrc
