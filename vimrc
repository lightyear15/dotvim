"---------- first of all: leader map {{{
:let mapleader = "\\"
" }}}

"---------- colors {{{
" I ♥ colors
syntax on
colorscheme Tomorrow-Night-Bright
set t_Co=256
" }}}


"---------- vundle {{{
set nocompatible              " required
filetype off                  " required
" Initialize Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" }}}


"---------- plugins {{{
Plugin 'scrooloose/nerdtree' " tree explorer
Plugin 'scrooloose/nerdcommenter' " Vim plugin for intensely orgasmic commenting
Plugin 'tpope/vim-fugitive' " git gui
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes' " airline themes
Plugin 'rking/ag.vim' " the silver searcher
Plugin 'a.vim' " Alternate files quickly (header/implementation etc...)
Plugin 'Chiel92/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters.
Plugin 'octol/vim-cpp-enhanced-highlight' " smarter c++ highlight
Plugin 'scrooloose/syntastic.git' " check syntax
" }}}


"---------- vundle end {{{
" Plugins cannot be loaded below this line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}


"---------- Standard Vim settings {{{
set list lcs=trail:·,tab:»·,eol:↵
set tabstop=4     " a tab is four spaces
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set softtabstop=4 " TODO: to be commented
set shiftwidth=4  " number of spaces to use for autoindenting
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set relativenumber "show line number relative to current line
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
" }}}


"---------- Turn off swap files and backups {{{
set nobackup
set nowritebackup
" }}}


"---------- NERDTree settings {{{
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}


"---------- Airline settings {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}


"---------- autoformat settings {{{
let g:autoformat_verbosemode=1
let g:formatdef_myclangformat = "'clang-format -style=llvm AllowShortIfStatementsOnASingleLine=true AlwaysBreakTemplateDeclarations=true Standard=C++11 BreakBeforeBraces=Stroustrup NamespaceIndentation=None IndentWidth='&tabstop"
let g:formatters_cpp = ['myclangformat']
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
" -style=google IndentWidth=4 NamespaceIndentation=None'"
" let g:formatter_clang-format_style= 'llvm'
" }}}


"---------- NERDTree settings {{{
:map <leader>s :w<Enter>
:map <leader>x :q<Enter>
:map <leader>hv :AV<Enter>
:map <leader>hi :IHT<Enter>
:noremap <F5> :Autoformat<CR>
" }}}


"---------- Syntastic settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['clang_check']
let g:syntastic_cpp_clang_check_args = ' -std=c++11 -stdlib=libc++'
" }}}



