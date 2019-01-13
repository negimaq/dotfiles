#!/bin/sh

# 設定用パスの取得
SCRIPT_DIR=$(cd $(dirname $0); cd ..; pwd)

# シンボリックリンク作成
ln -sf $SCRIPT_DIR/vimfiles ~/.vim
ln -sf $SCRIPT_DIR/vimfiles/vimrc ~/.vimrc
