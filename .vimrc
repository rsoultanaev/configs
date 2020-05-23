set nocompatible                     " be iMproved, required
filetype off                         " required

set encoding=utf-8

" ------------------------- PLUGINS --------------------------
if has('nvim')
    let pluginpath=stdpath('data') . '/plugged'
else
    let pluginpath='~/.vim/plugged'
endif

call plug#begin(pluginpath)

Plug 'sjl/badwolf'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
" ------------------------- PLUGINS --------------------------



syntax on                           " Enable syntax highlighting.

set autoindent                      " Indent according to previous line.
set expandtab                       " Use spaces instead of tabs.
set softtabstop =4                  " Tab key indents by 4 spaces.
set shiftwidth  =4                  " >> indents by 4 spaces.
set shiftround                      " >> indents to next multiple of 'shiftwidth'.
set backspace   =indent,eol,start   " Make backspace work as you would expect.
set hidden                          " Switch between buffers without having to save first.
set laststatus  =2                  " Always show statusline.
set display     =lastline           " Show as much as possible of the last line.
set ignorecase                      " Case insensitive search (part 1)
set smartcase                       " Case insensitive search (part 2)

set showmode                        " Show current mode in command-line.
set showcmd                         " Show already typed keys when more are expected.

set incsearch                       " Highlight while searching with / or ?.
set hlsearch                        " Keep matches highlighted.

set ttyfast                         " Faster redrawing.
set lazyredraw                      " Only redraw when necessary.

set splitbelow                      " Open new windows below the current window.
set splitright                      " Open new windows right of the current window.

set cursorline                      " Highlight current line
set wrapscan                        " Searches wrap around end-of-file.
set report      =0                  " Always report changed lines.
set synmaxcol   =2000               " Only highlight the first 200 columns.

set list                            " Show non-printable characters.
set number                          " Turn line numbers on
set ruler                           " Show current line & column
set nofoldenable                    " Disable folding
set cc         =80                  " Show right margin at 80 chars

if !has('nvim')
    set clipboard=exclude:.*        " Disable clipboard for faster startup
endif

let mapleader=" "

" Set visualisation of spaces
let &listchars = 'tab:> ,nbsp:%,trail:-,extends:>,precedes:<'

" <Ctrl-y> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-y> :let @/ = ""<CR>

" Use <Ctrl-m> to move down instead of <Ctrl-d>
nnoremap <silent> <C-m> <C-d>

" Swap the functions of 0 and ^
nnoremap 0 ^
nnoremap ^ 0

" J and K to move by 10 lines
nnoremap J 10j
nnoremap K 10k

" Disable ex mode
map Q <Nop>

" Use ; instead of : in normal mode
nmap ; :

" Use jk to switch to normal more
imap jk <Esc>

" Color stuff
set t_Co=256
set background=dark
colorscheme badwolf

" Execute :wall when navigating away from a split
let g:tmux_navigator_save_on_switch = 2

" Remove patterns from searches like ctrl-p
set wildignore+=*/*-build-*/*
set wildignore+=*/build/*

autocmd FileType json syntax match Comment +\/\/.\+$+

" WP to enter word processor mode
func! WordProcessorMode()
    setlocal formatoptions=t1a
    setlocal textwidth=79
    map j gj
    map k gk
    setlocal smartindent
    setlocal spell spelllang=en_gb
    setlocal noexpandtab
endfu
com! WP call WordProcessorMode()

" SNRP to stop automatic paragraph reflowing while in WP mode
func! SetNoReflowParagraph()
    setlocal formatoptions-=a
    setlocal formatoptions-=t1
endfu
com! SNRP call SetNoReflowParagraph()
