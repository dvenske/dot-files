set nocompatible

" vundle section {{{
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" my vundles
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'helino/vim-json'
Bundle 'tpope/vim-surround'
Bundle 'garbas/vim-snipmate'
Bundle 'bling/vim-airline'
Bundle 'jelera/vim-javascript-syntax'

" Snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

"vundle section }}}

set number
set ruler
syntax on
colorscheme desert256
set background=dark

" booya. persistent undo. what now
set undodir=~/.cache/vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

filetype on
filetype plugin indent on
set laststatus=2

" yey mouse
set mouse=a

" indentation and comments
set nowrap

" Sets how many columns a tab counts for
set tabstop=4

" Sets how many columns >> and << count for
set shiftwidth=4

" Sets how many columns a tab counts for when in insert mode
set softtabstop=4
set cindent
set smartindent
set autoindent
set fo=rocqt
set comments=sl:/**,mbr:\ *,erx:\ */
set noexpandtab
set foldmethod=marker

" python doesnt like tabs
autocmd FileType py set expandtab

" nginx stuf
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 

" c.vim settings
let c_gnu = 1
let c_vms = 1
let c_C99 = 1

" ctags.vim settings
let g:ctags_path='/usr/bin/ctags'
let g:ctags_statusline=1 
let g:generate_tags=1

" fancy powerline
let g:Powerline_symbols = 'unicode'

" extra syntax application
au BufNewFile,BufRead *.j set filetype=objj

" no clue
set t_RV=

" }}}
