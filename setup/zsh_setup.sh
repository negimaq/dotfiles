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
ln -sf $DOT_DIR/tmux.conf ~/.tmux.conf

# anyenvのインストール
git clone https://github.com/anyenv/anyenv ~/.anyenv
~/.anyenv/bin/anyenv install --init

# anyenvのプラグインをインストール
ANYENV_ROOT=$(~/.anyenv/bin/anyenv root)
mkdir -p $ANYENV_ROOT/plugins
git clone https://github.com/znz/anyenv-update.git $ANYENV_ROOT/plugins/anyenv-update
git clone https://github.com/znz/anyenv-git.git $ANYENV_ROOT/plugins/anyenv-git

# asdfのインストール
ASDF_ROOT=$(~/.asdf)
git clone https://github.com/asdf-vm/asdf.git $ASDF_ROOT

# rustupのインストール
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# tmux1.9以上がインストールされている場合にTPMをインストール
if type "tmux" > /dev/null 2>&1 && [[ ! "$(tmux -V | tr -cd 0123456789.)" < "1.9" ]] ; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -sf $DOT_DIR/tmux.conf ~/.tmux.conf
fi
