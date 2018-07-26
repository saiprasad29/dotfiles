"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Configuration File
" Maintainer: Saiprasd P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins (using VimPlug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'prettier/vim-prettier'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" be iMproved
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set airline theme
let g:airline_theme = 'codedark'

" Enable Powerline fonts
let g:airline_powerline_fonts = 1

" Set color scheme
colorscheme codedark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:jsx_ext_required = 0

" Using Tab key as abbreviation expander on Emmet.vim
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Prettier - Running before saving (async)
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => System Clipboard Copy/Past Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber "shows relative numbers to current line
set number "show line numbers
set laststatus=2 "for airline
set t_Co=256
set hidden
set backspace=2
