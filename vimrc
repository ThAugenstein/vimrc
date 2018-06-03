"--- First things first

set nocompatible
set number
set ruler
set wrap
set scrolloff=3         " Display at least 3 lines around the cursor
                        " (for scrolling)
set autoread            " Set do auto read when a file has changed from the outside

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

" -- Beep
set visualbell          " Prevent Vim from beeping
set noerrorbells        " Prevent Vim from beeping

" Turn on persistent undo on
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

set history=500

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

"--- Relative line numbers, absolut numbers insert mode or without focus
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"--- Make <Tab> switch windows
map <Tab> <C-W>w
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>

" ---Easier movement between windows with Ctrl - hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"--- Disable the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"--- Turn on persistent undo on
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

set history=500

"--- Plugins

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yegappan/mru'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
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

"--- Airline
let g:airline_solarized_bg='dark'
