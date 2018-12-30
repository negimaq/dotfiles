"-----プラグインの追加-----
call plug#begin('~/.vim/plugged')

"テーマ関連
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Townk/vim-autoclose'
Plug 'scrooloose/nerdcommenter'

call plug#end()

"-----基本設定-----
set number
set nocompatible
set tabstop=4
set shiftwidth=4
syntax enable
set fileformat=unix
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
filetype on

"テーマの設定
"set background=dark
set t_Co=256
colorscheme jellybeans

"-----nerdtreeの設定-----
"Vim起動時にnerdtreeを自動的に表示・ファイルにフォーカス
autocmd vimenter * NERDTree | wincmd p

"他のバッファを全て閉じた時にnerdtreeが開いていたらnerdtreeも一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"幅を設定
let g:NERDTreeWinSize = 35

"隠しファイルを表示
let NERDTreeShowHidden = 1

"ディレクトリ表示記号を変更
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

"-----nerdtree-git-pluginの設定-----
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "@",
	\ "Staged"    : "+",
	\ "Untracked" : "/",
	\ "Renamed"   : "&",
	\ "Unmerged"  : "=",
	\ "Deleted"   : "x",
	\ "Dirty"     : "*",
	\ "Clean"     : "o",
	\ "Unknown"   : "?"
	\ }

"-----fugitiveの設定-----
"grep検索実行後にQuickFix Listを表示
autocmd QuickFixCmdPost *grep* cwindow

"ステータス行に現在のgitブランチを表示
"set statusline+=%{fugitive#statusline()}

"-----vim-indent-guidesの設定-----
"Vim起動時にvim-indent-guidesを自動的にオン
let g:indent_guides_enable_on_vim_startup = 1

"-----gitgutterの設定-----
set signcolumn=yes
set updatetime=100

"-----vim-airline関連の設定
set laststatus=2
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"-----Shebangの自動挿入-----
augroup SetShebang
	autocmd! SetShebang
	autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\n# -*- coding: utf-8 -*-\"|$
augroup END

"-----キーマップ-----
"Leaderをスペースキーに設定
let mapleader = "\<Space>"

"ファイルを保存する
nnoremap <Leader>w :w<CR>

"ファイルを閉じる
nnoremap <Leader>q :q<CR>

"置換
nnoremap <Leader>s :%s/

"sキーの割り当てを削除
nnoremap s <Nop>

"ウィンドウの水平分割
nnoremap ss :split<CR>

"ウィンドウの垂直分割
nnoremap sv :vsplit<CR>

"左ウィンドウに移動
nnoremap sh <C-w>h

"下ウィンドウに移動
nnoremap sj <C-w>j

"上ウィンドウに移動
nnoremap sk <C-w>k

"右ウィンドウに移動
nnoremap sl <C-w>l

"ウィンドウを左に移動
nnoremap sH <C-w>H

"ウィンドウを下に移動
nnoremap sJ <C-w>J

"ウィンドウを上に移動
nnoremap sK <C-w>K

"ウィンドウを右に移動
nnoremap sL <C-w>L

"新規タブ
nnoremap st :tabnew<CR>

"次のタブに切り替え
nnoremap sn gt

"前のタブに切り替え
nnoremap sp gT

"nerdtreeの表示・非表示の切り替え
map <C-n> :NERDTreeToggle<CR>
