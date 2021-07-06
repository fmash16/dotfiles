" Install vim-plug if not already installed

set encoding=utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS (vim-plug)
" =================================================================================
"
call plug#begin('~/.vim/plugged')

"Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
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
" set number relativenumber
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
set t_Co=256
set background=dark
"onedark.vim override: Set a custom background color in the terminal
" set termguicolors
colorscheme gruvbox
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight Comment cterm=italic gui=italic

" Pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <F7> <C-W>w

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
set cursorline
hi LineNr term=bold cterm=NONE ctermfg=Darkgrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" hi CursorLineNr cterm=NONE ctermfg=Grey ctermbg=NONE
hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE

" statusline
set statusline=%1*\ fmash16\ %3*\ %f\ %4*
set statusline+=%h%m%r%w                     " flags
set statusline+=%=
set statusline+=%3*\ %l\/\%L\ %2*\ line\ 

hi user1 ctermbg=119 ctermfg=0
hi user2 ctermbg=119 ctermfg=0
hi user3 ctermbg=0 ctermfg=NONE
hi user4 ctermbg=NONE ctermfg=NONE

" Expand opening-brace followed by ENTER to a block and place cursor inside
inoremap {<CR> {<CR>}<Esc>O

" Auto-insert closing parenthesis/brace
inoremap ( ()<Left>
inoremap { {}<Left>

" Skip over closing parenthesis/brace
inoremap <expr> ) getline('.')[col('.')-1] == ")" ? "\<Right>" : ")"
inoremap <expr> } getline('.')[col('.')-1] == "}" ? "\<Right>" : "}"
