#!/bin/sh

# 設定用パスの取得
DOT_DIR=$(cd $(dirname $0); cd ..; pwd)

# シンボリックリンク作成
if [[ -e ~/.zsh ]]; then
	unlink ~/.zsh
fi
ln -sf $DOT_DIR/zshfiles ~/.zsh
ln -sf $DOT_DIR/zshfiles/zshrc ~/.zshrc
ln -sf $DOT_DIR/zshfiles/zshenv ~/.zshenv

# pyenvとpyenv-virtualenvのインストール
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
git clone git://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
