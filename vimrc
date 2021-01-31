"---------- first of all: leader map {{{
:let mapleader = "\`"
" }}}

"---------- colors {{{
" I ♥ colors
syntax on
"colorscheme Tomorrow-Night-Bright
"set t_Co=256
" }}}

"---------- misc {{{
au FileType gitcommit set tw=72
" }}}

"---------- vundle {{{
set nocompatible              " required
filetype off                  " required
" Initialize Vundle plugin manager
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" }}}
 

"---------- vim-ale --- needed here before plugin is loaded {{{
let g:ale_completion_enabled = 1
let g:ale_set_baloons = 1
" }}}


"---------- plugins {{{
Plugin 'scrooloose/nerdtree' " tree explorer
Plugin 'scrooloose/nerdcommenter' " Vim plugin for intensely orgasmic commenting
Plugin 'tpope/vim-fugitive' " git gui
Plugin 'ervandew/supertab' " Supertab allows you to use <Tab> for all your insert completion needs
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, mru, tag, etc finder.
"Plugin 'benmills/vimux' " Run commands inside tmux window
Plugin 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes' " airline themes
Plugin 'rking/ag.vim' " the silver searcher
Plugin 'Chiel92/vim-autoformat' " autoformatting code
Plugin 'honza/vim-snippets' " Snippets are separated from the engine
Plugin 'Raimondi/delimitMate' " automatically close quotes, parens, brackets, etc.
Plugin 'tpope/vim-surround' " put parenthesis around selection
Plugin 'airblade/vim-gitgutter' " highlight git changed lines
Plugin 'lightyear15/taglist.vim' " hopefully
Plugin 'dense-analysis/ale' "vim support for linters
Plugin 'junegunn/vader.vim' "vim test framework
"Plugin 'fatih/vim-go' " vim-go plugin
" }}}


"---------- vundle end {{{
" Plugins cannot be loaded below this line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}


"---------- Standard Vim settings {{{
set list lcs=trail:·,tab:»·,eol:↵
" VERY IMPORTANT!!!! when changing size of tabs, remember to change autoformat tabs too
set tabstop=4       " a tab is four spaces
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set softtabstop=4   " TODO: to be commented
set expandtab       " spaces instead of tabs
set shiftwidth=4    " number of spaces to use for autoindenting
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set number          " always show line numbers
set relativenumber  "show line number relative to current line
set showmatch       " set show matching parenthesis
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set noro            " set no readonly
set clipboard=unnamedplus
" }}}


"---------- Turn off swap files and backups {{{
set nobackup
set nowritebackup
set noswapfile
" }}}


"---------- autoreload vimrc on changes {{{
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
" }}}


"---------- NERDTree settings {{{
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize = 60
" }}}


"---------- Airline settings {{{
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
" }}}


"---------- vim-ale settings {{{
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_linters = {
            \'go' :['gofmt', 'gopls', 'gobuild', 'golint', 'goimports'],
            \'rust' :['analyzer', 'cargo', 'rustc'],
            \'python' :['pyls', 'mypy', 'pylint', 'pyflakes']
            \} 
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
let g:ale_rust_cargo_use_clippy = 1
let g:python_pylint_executable = 'pyls.pylint'
let g:python_pyflakes_executable = 'pyls.pyflakes'
" }}}

"---------- vim-taglist settings {{{
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 60
" }}} 

"---------- shortcut settings {{{
:map <leader>s :w<Enter>		" to save file
:map <leader>x :q<Enter>		" to close file
:noremap <leader>t :tabnew<CR>	" open a new tab
:noremap <C-l> :tabn<CR>	" go to next tab
:noremap <C-s> :CtrlPTag<cr>
:inoremap <C-e> <C-o>A " exit from parens
:noremap <C-h> :tabp<CR>	" go to previous tab
:noremap <C-t> :TlistToggle<CR> 	" open/close side tag list
:noremap <F2> ::ALENext<CR>		" jump to next error
:noremap <F3> ::ALEHover<CR>		" jump to next error
:noremap <F5> :ALERename<CR>
:noremap <F6> :Autoformat<CR>		" Formatting code
:noremap <F7> :ALEGoToDefinition<CR>		" Jump to definition
:noremap <F8> ::ALEFindReferences<CR>		" Jump to definition
:noremap <F9> ::ALESymbolSearch<CR>		" Jump to definition
" }}}

