"---------- colors {{{
" I ♥ colors
syntax on
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
" colorscheme molokai
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Default matching parent highlight is too visible.
" This is a more discrete highlight.
hi MatchParen cterm=bold ctermbg=black ctermfg=white
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

" }}}


"---------- vundle end {{{
" Plugins cannot be loaded below this line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}


"---------- Standard Vim settings {{{
set list lcs=trail:·,tab:»·,eol:↵
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noswapfile

" }}}



"---------- Turn off swap files and backups {{{
set noswapfile
set nobackup
set nowritebackup
" }}}
