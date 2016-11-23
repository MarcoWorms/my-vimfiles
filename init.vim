o


" Make vim use sh to run commands

if &shell =~# 'fish$'
    set shell=sh
endif

" Init plugged

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Group dependencies, vim-snippets depends on ultisnips

" Snippets for completion. Edit with :UltiSnipsEdit, expand with <tab>, next
" with <c-j>
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" File tree browser with :NERDTreeToggle
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fuzzy finder for files with :FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Colorscheme
Plug 'morhetz/gruvbox'

" Default configurations. Don't worrry about it

Plug 'tpope/vim-sensible'

" Easily comment things with gc
Plug 'tpope/vim-commentary'

" Powerful surrounding. Select with visual mode and press `S` plus quote or
" bracket to surround
" Check :help surround later

Plug 'tpope/vim-surround'

Plug 'terryma/vim-multiple-cursors'

" Default complete functions and syntax highlight. Only look for specific
" plugin syntax if it doens't have it. You probably won't need to look.
Plug 'sheerun/vim-polyglot'

" Autoclose pairs
Plug 'cohama/lexima.vim'

" User text objects
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'kana/vim-textobj-indent'
Plug 'sgur/vim-textobj-parameter'
Plug 'saaguero/vim-textobj-pastedtext'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'thalesmello/vim-textobj-methodcall'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'dracula/vim'

" Add plugins to &runtimepath
call plug#end()

colorscheme gruvbox
syntax on

set background=dark

set ignorecase
set smartcase
set number
set relativenumber
set hidden
set clipboard=unnamedplus

set tabstop=2
set shiftwidth=2
set expandtab

let mapleader = "\<space>"

nnoremap Y y$

nnoremap <c-down> <c-w>j
nnoremap <c-up> <c-w>k
nnoremap <c-right> <c-w>l
nnoremap <c-left> <c-w>h

nnoremap <BS> :nohlsearch<cr>

nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>es :UltiSnipsEdit<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

nnoremap <c-a-right> :vsplit<cr>
nnoremap <c-y> :vsplit\. \| :vertical resize 30 \| :normal iii<cr>

nnoremap <c-p> :FZF<cr>
nnoremap <c-t> :call fzf#run({'sink': 'tabedit'})<cr>

noremap <esc> <c-\><c-n>

vnoremap * y/<c-r>"<cr>

let g:UltiSnipsListSnippets = "<s-tab>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.javascript = ["(\.|\"|')"]
