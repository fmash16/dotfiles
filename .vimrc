" Install vim-plug if not already installed

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS (vim-plug)
" =================================================================================
"
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'preservim/nerdtree'
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'preservim/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

Plug 'davidhalter/jedi-vim'
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_stubs_command = "" 

Plug 'ervandew/supertab'

call plug#end()


" KEY BINDINGS
" ==================================================================================

let mapleader="\<space>"

imap jj <Esc>

set timeoutlen=2000

set laststatus=2
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Security
set modelines=0

" Show line numbers
set number relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden
" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Use \+q/qw to quit and save
map <leader>q :q!<CR>
map <leader>w :wq<CR>
map <leader>s :w<CR>

" Color scheme (terminal)
set t_Co=16
set background=dark

" Pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <F7> <C-W>w

" python run code within vim 
nnoremap <F9> :exec 'w !python' shellescape(@%, 1)<cr>

" shell
nnoremap <F5> :term<cr>

" switch between tabs with F8
nnoremap <F8> :tabn<cr>

" generate pdf from md using pandoc and open it using zathura using F6
nnoremap <F6> :!pandoc -o out.pdf % --template eisvogel --highlight-style=breezedark --listings;mv out.pdf "$(basename "%" .md).pdf";zathura "$(basename "%" .md).pdf" &<cr>

" Create new files with custom headers
autocmd bufnewfile *.py 0r ~/.vim/headers/head.py
autocmd bufnewfile *.c 0r ~/.vim/headers/head.c
autocmd bufnewfile *.html,*.php 0r ~/.vim/headers/head.html

" highlight current line
set cursorline
hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE 
" hi CursorLineNr cterm=NONE ctermfg=Grey ctermbg=NONE
hi CursorLine cterm=NONE ctermbg=235 ctermfg=NONE


" statusline
set statusline=%1*\ fmash16\ %3*\ %f\ %4*
set statusline+=%h%m%r%w                     " flags
set statusline+=%=
set statusline+=%3*\ %l\/\%L\ %2*\ line\ 

hi user1 ctermbg=3 ctermfg=0
hi user2 ctermbg=4 ctermfg=0
hi user3 ctermbg=0 ctermfg=NONE
hi user4 ctermbg=NONE ctermfg=NONE
