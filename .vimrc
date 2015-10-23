" vundle section {{{
filetype off
" TODO vim-snippets was someone elses project; just use ~/.vim/snippets and build
" up my own snippets
set runtimepath+=~/.vim/snippets,~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/vundle'

" my vundles
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'helino/vim-json'
Bundle 'bling/vim-airline'
Bundle 'Raimondi/delimitMate'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'airblade/vim-gitgutter'
Bundle 'Yggdroot/indentLine'

call vundle#end()
filetype plugin indent on
filetype on
"vundle section }}}

syntax on
set number
set ruler
set t_Co=256
set background=dark
colorscheme distinguished

set undolevels=1000 "maximum number of changes that can be undone

set laststatus=2

" yey mouse
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" indentation and comments
set nowrap

" highlight cursor
set hlsearch

" Sets tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent cindent

set fo=rocqt
set comments=sl:/**,mbr:\ *,erx:\ */

" python doesnt like tabs
autocmd FileType py set expandtab

" nginx stuf
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" extra syntax application
au BufNewFile,BufRead *.j set filetype=objj

" highlight trailing whitespace
highlight TrailingWhiteSpace ctermbg=red ctermfg=white
match TrailingWhiteSpace / \+$/

" remove trailing white space on php, js files
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e

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
