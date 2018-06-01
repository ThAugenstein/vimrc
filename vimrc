" First things first

set nocompatible
set number
set ruler
set wrap

if has ('autocmd') " Remain compatible with earlier versions
    augroup vimrc     " Source vim configuration upon save
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
    augroup END
endif " has autocmd

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'

call plug#end()

" Plugin settings

" vim-colors-solarized

syntax enable
set background=dark
colorscheme solarized
