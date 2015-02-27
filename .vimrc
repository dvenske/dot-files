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
Bundle 'garbas/vim-snipmate'
Bundle 'bling/vim-airline'
Bundle 'Raimondi/delimitMate'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'Lokaltog/vim-distinguished'

" Snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

"vundle section }}}

syntax on
set number
set ruler
set t_Co=256
colorscheme distinguished
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

" highlight cursor
set hlsearch

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

" extra syntax application
au BufNewFile,BufRead *.j set filetype=objj

" no clue
set t_RV=

" {{{ Airline Config
if(!exists('g:airline_symbols'))
	let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" }}}

" }}}
