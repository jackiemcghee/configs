"" Jackie McGhee's .vimrc/init.vim
"" Created: 10-Nov-2008

" Options for diff view
set diffopt=vertical,filler

" Switch off Vi ompatibility
set nocompatible

" vim-plug init
call plug#begin('~/.config/nvim/plugged')
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install'}
Plug 'sheerun/vim-polyglot'
Plug 'JulesWang/css.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'rbong/vim-flog'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" JSX syntax without .JSX suffix
let g:jsx_ext_required=0

" Keep ALE gutter open
let g:ale_sign_column_always=2

" Auto format with Prettier:
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Set encoding to UTF-8
set enc=utf-8

" Syntax highlighting
syntax on
set background=dark
colorscheme nord
if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Editor settings
set hidden
set noshowmode
set wildmenu
set wildoptions=pum
set pumblend=10
set wildmode=longest:full
set guioptions=

" Editor text settings
set scrolloff=20
set clipboard=unnamed
set nowrap
" enable wrap for plain text files
augroup WrapLineInTxtFile
  autocmd!
  autocmd FileType txt setlocal wrap
augroup END
set showmatch
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set noautoindent
set smartindent
set foldmethod=indent
" set foldcolumn=1
set foldlevel=4
set backspace=indent,eol,start

" Use The Silver Searcher for grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Editor UI settings
set signcolumn=yes
" set cursorcolumn
" set cursorline
set colorcolumn=
" hi colorcolumn guibg=#1a1a1a
" Gruvbox
"hi cursorline guibg=#232426
""hi! EndOfBuffer guibg=#282828 guifg=#282828
"hi signcolumn guibg=#282828

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Statusline settings
" set statusline=
" set statusline+=\ %{fugitive#statusline()}
" set statusline+=\ \ \%t%m%r%h%w
" set statusline+=%=
" set statusline+=%{&fileencoding?&fileencoding:&encoding}
" set statusline+=\ %y
" set statusline+=\ \[%{&fileformat}\]\ %p%%\ %l:%c\
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
"set nonu
"set nornu
set listchars=tab:▸\ ,eol:¬
set nolist
highlight NonText guifg=#cccccc
highlight SpecialKey guifg=#cccccc

" Leader settings and shortcuts
let mapleader="\\"
nnoremap <leader>e :e **/
nnoremap <leader>r :so ~/.config/nvim/init.vim<cr>
nnoremap <leader>/ :Ag<SPACE>
nnoremap <leader>\ :noh<cr>
