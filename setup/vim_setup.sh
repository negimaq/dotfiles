#!/bin/bash

# 設定用パスの取得
DOT_DIR=$(cd $(dirname $0); cd ..; pwd)

# シンボリックリンク作成
if [[ -e ~/.vim ]]; then
	unlink ~/.vim
fi
ln -sf $DOT_DIR/vimfiles ~/.vim
ln -sf $DOT_DIR/vimfiles/vimrc ~/.vimrc
