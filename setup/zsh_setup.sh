#!/bin/bash

# 設定用パスの取得
DOT_DIR=$(cd $(dirname $0); cd ..; pwd)

# シンボリックリンク作成
if [ -e ~/.zsh ]; then
	unlink ~/.zsh
fi
ln -sf $DOT_DIR/zshfiles ~/.zsh
ln -sf $DOT_DIR/zshfiles/zshrc ~/.zshrc
ln -sf $DOT_DIR/zshfiles/zshenv ~/.zshenv

# pyenvとpyenv-virtualenvのインストール
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

# tmux1.9以上がインストールされている場合にTPMをインストール
if type "tmux" > /dev/null 2>&1 && [[ ! "$(tmux -V | tr -cd 0123456789.)" < "1.9" ]] ; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -sf $DOT_DIR/tmux.conf ~/.tmux.conf
fi
