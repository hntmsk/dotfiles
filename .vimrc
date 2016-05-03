let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" txt code
set fileencoding=utf-8
" very masic
:nnoremap /  /\v

"
" vim-plug
"
call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'itchyny/lightline.vim'

Plug 'davidoc/taskpaper.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-markdown'
Plug 'deris/vim-rengbang'
Plug 'freitass/todo.txt-vim'
Plug 'tpope/vim-surround'
Plug 'thinca/vim-quickrun'
Plug 'itchyny/calendar.vim'
Plug 'tyru/open-browser.vim'

call plug#end()

"
" ColorScheme
"
colorscheme  jellybeans
syntax on   
au BufRead,BufNewFile *.md set filetype=markdown " markdown

" 画面表示の設定
set number "行数表示
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える（縦軸）
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
"set list           " 不可視文字を表示
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ " 不可視文字の表示記号指定

" カーソル移動関連の設定
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     "保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る

" タブ/インデントの設定
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set clipboard=unnamed,unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set mouse=a " マウスの入力を受け付ける
set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効にする
set history=10000 " コマンドラインの履歴を10000件保存する
set visualbell t_vb= " ビープ音すべてを無効にする
set noerrorbells " エラーメッセージの表示時にビープを鳴らさない
nnoremap <leader>rv :source $MYVIMRC<CR>
inoremap jj <Esc>
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set foldmethod=marker " 折りたたみ 

"
" open-browser.vim
"
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"
" Unite vim
"
"let g:unite_enable_start_insert=1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
nnoremap <silent> <Leader><Leader> :<C-u>Unite<CR>
nnoremap <silent> <Leader>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>d :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Leader>f :<C-u>Unite file<CR>
nnoremap <silent> <Leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

"
" use highway for UniteGrep
"
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif
 
noremap <Leader>o <ESC>:Unite -vertical -winwidth=40 outline<Return>

"
" autosave
"
let g:auto_save = 1   
let g:session_autoload = 'no' 
let g:session_autosave = 'yes' 
let g:session_autosave_periodic = 3  
let g:auto_save_in_insert_mode = 0

"矢印キー無効
vnoremap  <Up>     <nop>
vnoremap  <Down>   <nop>
vnoremap  <Left>   <nop>
vnoremap  <Right>  <nop>
inoremap  <Up>     <nop>
inoremap  <Down>   <nop>
inoremap  <Left>   <nop>
inoremap  <Right>  <nop>
noremap   <Up>     <nop>
noremap   <Down>   <nop>
noremap   <Left>   <nop>
noremap   <Right>  <nop>


