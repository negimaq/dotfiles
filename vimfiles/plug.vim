"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        __                  _                      "
"                 ____  / /_  ______ __   __(_)___ ___              "
"                / __ \/ / / / / __ `/ | / / / __ `__ \             "
"               / /_/ / / /_/ / /_/ /| |/ / / / / / / /             "
"              / .___/_/\__,_/\__, (_)___/_/_/ /_/ /_/              "
"             /_/            /____/                                 "
"                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                   "
"        Written by minekaede (https://github.com/minekaede)        "
"                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"--------------------------------------------------------------------
" プラグインの読み込み
"--------------------------------------------------------------------

" 読み込むプラグインの定義開始
call plug#begin('~/.vim/plugged')

"Plug 'Shougo/unite.vim'
"Plug 'Shougo/neomru.vim'
Plug 'Shougo/neocomplete.vim'

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

Plug 'scrooloose/nerdtree'

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
let g:NERDTreeDirArrowExpandable  = "+"
let g:NERDTreeDirArrowCollapsible = '~'

"nerdtreeの表示・非表示の切り替え
map <C-n> :NERDTreeToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'

let g:NERDTreeGitStatusIndicatorMapCustom = {
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

Plug 'tpope/vim-fugitive'

"grep検索実行後にQuickFix Listを表示
autocmd QuickFixCmdPost *grep* cwindow

Plug 'airblade/vim-gitgutter'

if exists('&signcolumn')
	set signcolumn=yes
else
	let g:gitgutter_sign_column_always = 1
endif
set updatetime=100

Plug 'nathanaelkane/vim-indent-guides'

"Vim起動時にvim-indent-guidesを自動的にオン
let g:indent_guides_enable_on_vim_startup = 1

Plug 'bronson/vim-trailing-whitespace'
Plug 'Townk/vim-autoclose'
Plug 'scrooloose/nerdcommenter'

Plug 'nanotech/jellybeans.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

set laststatus=2
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'davidhalter/jedi-vim'

" 上部のdocstringを無効化
autocmd FileType python setlocal completeopt-=preview

Plug 'lambdalisue/vim-pyenv', {
			\ 'depends': ['davidhalter/jedi-vim'],
			\ 'autoload': {
			\   'filetypes': ['python', 'python3'],
			\ }}

Plug 'ervandew/supertab'

" 補完の順番を修正
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

Plug 'mattn/sonictemplate-vim'

let g:sonictemplate_vim_template_dir = ['~/.vim/template']

Plug 'vim-jp/cpp-vim', {
			\ 'autoload': {
			\   'filetypes': 'cpp'
			\ }}

augroup cpp-path
	autocmd!
	autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include
augroup END

Plug 'thinca/vim-quickrun', {'on': 'QuickRun'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}

let g:quickrun_config = {}

let g:quickrun_config.cpp = {
			\ 'outputter/error/success': 'buffer',
			\ 'outputter/error/error': 'quickfix',
			\ 'outputter/quickfix/open_cmd': 'copen',
			\ 'runner/vimproc/updatetime': 60,
			\ 'hook/time/enable': 1,
			\ 'command': 'g++',
			\ 'input': 'input',
			\ 'runner': 'system',
			\ }

let g:quickrun_config.tex = {
			\ 'outputter': 'error',
			\ 'outputter/error/success': 'null',
			\ 'outputter/error/error': 'quickfix',
			\ 'exec': ['make cleanall', 'make']
			\ }

Plug 'fatih/vim-go'

let g:go_template_autocreate = 0

Plug 'rust-lang/rust.vim'

" 読み込むプラグインの定義終了
call plug#end()

" テーマの設定
set t_Co=256
colorscheme jellybeans
