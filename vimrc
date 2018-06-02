"--- First things first

set nocompatible
set number
set ruler
set wrap

"--- Set leader

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

"--- <leader> mappings, except for plugin stuff
map <leader>v :sp ~/.vimrc<cr>
map <silent> <leader><cr> :noh<cr>

"--- Search
set ignorecase          " Ignore case when searching
set smartcase           " If there is an uppercase in the search term
                        " search casesensitive again
set incsearch           " Highlight search results when typing
set hlsearch            " Highlight search results

" Backspace behaves as expected
set backspace=indent,eol,start

" Expand tabs to spaces
set expandtab           " Use spaces instead of tabs
set tabstop=4           " 1 tab = 4 spaces
set shiftwidth=4        " 1 tab = 4 spaces
set smarttab            " Be smart when using tabs ;)

"--- Auto-reload .vimrc on save

if has ('autocmd')
    augroup vimrc
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
    augroup END
endif " has autocmd

"--- Plugins

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'	
Plug 'yegappan/mru'
Plug 'vim-perl/vim-perl'
Plug 'vim-perl/vim-perl6'
Plug 'keith/swift.vim'

call plug#end()

"--- Plugin settings

"--- vim-colors-solarized

syntax enable
set background=dark
colorscheme solarized

"--- MRU

map <leader>f :MRU<CR>
