" First things first

set nocompatible
set number
set ruler
set wrap

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" <leader> mappings, except for plugin stuff
map <leader>v :sp ~/.vimrc<cr>

" auto-reload .vimrc on save
if has ('autocmd')
    augroup vimrc
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
    augroup END
endif " has autocmd

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'	
Plug 'yegappan/mru'

call plug#end()

" Plugin settings

" vim-colors-solarized

syntax enable
set background=dark
colorscheme solarized

" MRU
map <leader>f :MRU<CR>
