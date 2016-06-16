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
Plugin 'ervandew/supertab' " Supertab allows you to use <Tab> for all your insert completion needs
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes' " airline themes
Plugin 'rking/ag.vim' " the silver searcher
Plugin 'a.vim' " Alternate files quickly (header/implementation etc...)
Plugin 'Chiel92/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters.
Plugin 'octol/vim-cpp-enhanced-highlight' " smarter c++ highlight
Plugin 'scrooloose/syntastic.git' " check syntax
Plugin 'Valloric/YouCompleteMe' " A code-completion engine for Vim
Plugin 'SirVer/ultisnips' " Snippets engine
Plugin 'honza/vim-snippets' " Snippets are separated from the engine
" }}}


"---------- vundle end {{{
" Plugins cannot be loaded below this line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}


"---------- Standard Vim settings {{{
set list lcs=trail:·,tab:»·,eol:↵
" VERY IMPORTANT!!!! when changing size of tabs, remember to change autoformat tabs too
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


"---------- autoreload vimrc on changes {{{
" $MYVIMRC (~/.vimrc) and $MYGVIMRC (~/.gvimrc) must exists or an error will appear
augroup AutoreloadVimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc nested so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" }}}


"---------- NERDTree settings {{{
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}


"---------- Airline settings {{{
			\s
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
" }}}


"---------- autoformat settings {{{
let g:formatdef_clangformat_cpp = "'clang-format -style=file -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').''"
let g:formatters_cpp = ['clangformat_cpp']
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


"---------- Syntastic settings {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/'
" }}}


"---------- Snippets and YouCompleteMe {{{
" let g:ycm_confirm_extra_conf = 0 " load local ycm configuration silently.
let g:ycm_use_ultisnips_completer = 0 " Disable UltiSnips for YCM
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"
" }}}



"---------- shortcut settings {{{
:map <leader>s :w<Enter>		" to save file
:map <leader>x :q<Enter>		" to close file
:map <leader>hv :AV<Enter>		" a:  shortcut to switch to header file
:map <leader>hi :IHT<Enter>		" a:  shortcut to open file over cursor
:noremap <F5> :Autoformat<CR>	" autoformat: shortcut to autoformat file
vnoremap <F5> :'<,'>Autoformat<CR>
:noremap <leader>t :tabnew<CR>	" open a new tab
" }}}
