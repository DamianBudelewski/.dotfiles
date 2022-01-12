" Don't try to be vi compatible
set nocompatible

" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

" Multiple language packs for Vim
Plug 'sheerun/vim-polyglot'

" Send python code to interpreter in tmux
Plug 'jpalardy/vim-slime'

" Completion helper for Cloud Formation Templates, basic syntax highlighting 
Plug 'https://github.com/m-kat/aws-vim'

" Fern
Plug 'lambdalisue/fern.vim'
Plug 'yuki-yano/fern-preview.vim'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'

" Mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-surround'

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

" ???
set clipboard=unnamed

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
" Theme settings
" -----------------------------------------------------------------------------

set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" set background=dark
" colorscheme palenight
" let g:airline_theme = "palenight"
" let g:palenight_terminal_italics=1

if (has("termguicolors"))
  set termguicolors
endif



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


" -----------------------------------------------------------------------------
" Fern Settings
" -----------------------------------------------------------------------------

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
  nmap <buffer> p <Plug>(fern-action-preview:toggle)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END


" -----------------------------------------------------------------------------
" Fzf Settings
" -----------------------------------------------------------------------------

nnoremap <C-p> :GFiles<CR>

" -----------------------------------------------------------------------------
" Fast scrolling with CTRL j and CTRL k
" -----------------------------------------------------------------------------

nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

" -----------------------------------------------------------------------------
" https://superuser.com/questions/321547/how-do-i-replace-paste-yanked-text-in-vim-without-yanking-the-deleted-lines
" -----------------------------------------------------------------------------
vnoremap p "_dP

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>

" -----------------------------------------------------------------------------
" Python send code to interpreter
" -----------------------------------------------------------------------------

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
