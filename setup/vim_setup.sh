#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -s $SCRIPT_DIR/vimfiles ~/.vim
ln -s $SCRIPT_DIR/vimfiles/vimrc ~/.vimrc
