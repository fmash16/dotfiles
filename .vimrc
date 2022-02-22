" Install vim-plug if not already installed
set encoding=utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
 "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS (vim-plug)
" =================================================================================
"
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ycm-core/YouCompleteMe'
Plug 'Yggdroot/indentLine'

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers = {
  \   'python': [ 're!\w{2}' ],
  \   'c': [ 're!\w{2}' ],
  \   'c++': [ 're!\w{2}' ],
  \   'rust': [ 're!\w{2}' ]
  \ }
map <C-n> :NERDTreeToggle<CR>

call plug#end()


" KEY BINDINGS
" ==================================================================================

let mapleader="\<space>"
imap jj <Esc>

set timeoutlen=2000
set laststatus=2
set nocompatible
filetype on
syntax on
filetype plugin indent on
set modelines=0
set number
set ruler
set visualbell
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set hidden
set ttyfast
set laststatus=2
set showmode
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

map <leader>q :q!<CR>
map <leader>w :wq<CR>
map <leader>s :w<CR>

" Colorscheme
set t_Co=256
"set termguicolors
set background=dark
colorscheme patine
"hi Normal guibg=NONE ctermbg=NONE guifg=NONE
"hi Comment term=italic guibg=NONE guifg=#888888

set cursorline
"hi LineNr term=bold cterm=NONE ctermfg=Darkgrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"hi CursorLineNr cterm=NONE ctermfg=Grey ctermbg=NONE gui=underline guibg=#22222a guifg=#ff9999 
"hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#22222a

" python run code within vim 
nnoremap <F9> :exec 'w !python' shellescape(@%, 1)<cr>

" shell
nnoremap <F5> :shell<cr>

" switch between tabs with F8
nnoremap <F8> :tabn<cr>

" generate pdf from md using pandoc and open it using zathura using F6
nnoremap <F6> :!pandoc -o out.pdf % --template eisvogel --highlight-style=breezedark --listings;mv out.pdf "$(basename "%" .md).pdf";zathura "$(basename "%" .md).pdf" &<cr>

" Create new files with custom headers
autocmd bufnewfile *.py 0r ~/.vim/headers/head.py
autocmd bufnewfile *.c 0r ~/.vim/headers/head.c
autocmd bufnewfile *.html,*.php 0r ~/.vim/headers/head.html
autocmd bufnewfile Makefile 0r ~/.vim/headers/Makefile

" highlight current line

" statusline
set statusline=%1*\ fmash16\ %3*\ %f\ %4*
set statusline+=%h%m%r%w                     " flags
set statusline+=%=
set statusline+=%3*\ %l\/\%L\ %2*\ line\ 

hi user1 ctermbg=234 ctermfg=6
hi user2 ctermbg=234 ctermfg=6
hi user3 ctermbg=235 ctermfg=NONE
hi user4 ctermbg=NONE ctermfg=NONE

" Expand opening-brace followed by ENTER to a block and place cursor inside
inoremap {<CR> {<CR>}<Esc>O

" Auto-insert closing parenthesis/brace
inoremap ( ()<Left>
inoremap { {}<Left>

" Skip over closing parenthesis/brace
inoremap <expr> ) getline('.')[col('.')-1] == ")" ? "\<Right>" : ")"
inoremap <expr> } getline('.')[col('.')-1] == "}" ? "\<Right>" : "}"
