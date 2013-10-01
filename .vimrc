"" Jackie McGhee's .vimrc
"" Created: 10-Nov-2008
"" Modified: 25-Apr-2013

" Pathogen init
execute pathogen#infect()

" Switch off Vi ompatibility
set nocompatible

" Set encoding to UTF-8
set enc=utf-8

" Syntax highlighting
syntax on
set background=dark
colorscheme xoria256

" Editor settings
set hidden
set showmode
set wildmenu
set wildmode=list:longest

" Editor text settings
set scrolloff=10
set clipboard=unnamed
set nowrap
set showmatch
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set noautoindent
set smartindent
set foldmethod=indent
" set foldcolumn=1
set foldlevel=4
set backspace=indent,eol,start

" Editor UI settings
"set guifont=Consolas:h11
"set antialias
set relativenumber
"set guioptions=
"set guicursor+=a:blinkon0
set cursorline
" set cursorcolumn
"set colorcolumn=80
" hi colorcolumn guibg=#41515f

" Statusline settings
set statusline=%f%m%r%h%w\ %=[%{&ff}]\ [%Y]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set ls=2

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" File system
set nobackup
set nowritebackup
set noswapfile
filetype plugin indent on

" Function to toggle between relative and absolute line numbers
function! g:ToggleNuMode()
    if(&rnu==1)
        set nu
    else
        set rnu
    endif
endfunc

set listchars=tab:▸\ ,eol:¬
set nolist
highlight NonText guifg=#cccccc
highlight SpecialKey guifg=#cccccc

" Leader settings and shortcuts
let mapleader="\\"
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>r :so ~/_vimrc<cr>
nnoremap <leader>s :cd C:\Work\SVN<cr>
nnoremap <leader>i gg=G
nnoremap <leader>/ /PaletteCleanser<cr>
nnoremap <leader>c gg=G:g/^$/d<cr>
nnoremap <leader>w :cd c:\wamp\www<cr>
nnoremap <leader>l :call g:ToggleNuMode()<cr>
