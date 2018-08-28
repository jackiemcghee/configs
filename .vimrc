"" Jackie McGhee's .vimrc
"" Created: 10-Nov-2008
"" Modified: 25-Apr-2013

" set t_Co=256

" vim-plug init
call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mhartington/oceanic-next'
call plug#end()

" JSX syntax without .JSX suffix
let g:jsx_ext_required=0

" Keep ALE gutter open
let g:ale_sign_column_always=1

" Switch off Vi ompatibility
set nocompatible

" Set encoding to UTF-8
set enc=utf-8

" Syntax highlighting
syntax on
set background=dark
colorscheme OceanicNext
if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

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
set relativenumber
" set cursorcolumn
set colorcolumn=80
hi colorcolumn guibg=#00242d

" Statusline settings
set statusline=\ %f%m%r%h%w\ %=%{fugitive#statusline()}\ 
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

set rnu
set nu
set listchars=tab:▸\ ,eol:¬
set nolist
highlight NonText guifg=#cccccc
highlight SpecialKey guifg=#cccccc

" Leader settings and shortcuts
let mapleader="\\"
nnoremap <leader>r :so ~/.vimrc<cr>
nnoremap <leader>i gg=G
nnoremap <leader>/ /PaletteCleanser<cr>
nnoremap <leader>c gg=G:g/^$/d<cr>
