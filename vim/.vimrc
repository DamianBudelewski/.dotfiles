" Don't try to be vi compatible
set nocompatible

" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

" Multiple language packs for Vim
Plug 'sheerun/vim-polyglot'

" Completion helper for Cloud Formation Templates, basic syntax highlighting 
Plug 'https://github.com/m-kat/aws-vim'

" Fern
Plug 'lambdalisue/fern.vim'

" Terraform syntax and tools
Plug 'hashivim/vim-terraform'

" Handle multi-file find and replace.
Plug 'mhinz/vim-grepper'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Drastically improve insert mode performance in files with folds.
Plug 'Konfekt/FastFold'

" Languages and file types.
Plug 'chr4/nginx.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarnpkg install' }
Plug 'jvirtanen/vim-hcl'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
Plug 'vim-python/python-syntax'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'towolf/vim-helm'

call plug#end()

let mapleader=" "
let maplocalleader=" "

" Helps force plugins to load correctly when it is turned back on below
filetype off

" For plugins to load correctly
filetype plugin indent on

" Security
set modelines=0

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

au BufRead,BufNewFile *.md setlocal textwidth=80

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    set termguicolors
endif

" Enable syntax highlighting.
syntax on

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------

set autoindent
set autoread
set shiftwidth=2
set softtabstop=2
set tabstop=2
set number relativenumber


" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=
