"---------- first of all: leader map {{{
:let mapleader = "\`"
" }}}

"---------- colors {{{
" I ♥ colors
syntax on
" colorscheme Tomorrow-Night-Bright
set t_Co=256
" }}}

"---------- misc {{{
au FileType gitcommit set tw=72
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
Plugin 'benmills/vimux' " Run commands inside tmux window
Plugin 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes' " airline themes
Plugin 'rking/ag.vim' " the silver searcher
Plugin 'a.vim' " Alternate files quickly (header/implementation etc...)
Plugin 'Chiel92/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters.
Plugin 'octol/vim-cpp-enhanced-highlight' " smarter c++ highlight
Plugin 'scrooloose/syntastic.git' " check syntax
" Plugin 'Valloric/YouCompleteMe' " A code-completion engine for Vim
Plugin 'SirVer/ultisnips' " Snippets engine
Plugin 'honza/vim-snippets' " Snippets are separated from the engine
Plugin 'Raimondi/delimitMate' " automatically close quotes, parens, brackets, etc.
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim' " doxygen documentation
Plugin 'vim-scripts/h2cppx' " from header to cpp
Plugin 'airblade/vim-gitgutter' " highlight git changed lines

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


"---------- autoformat settings {{{
let g:formatdef_clangformat_cpp = "'clang-format-3.8 -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').' -style=file'"
let g:formatters_cpp = ['clangformat_cpp']
let g:formatdef_clangformat_c = "'clang-format-3.8 -style=file -lines='.a:firstline.':'.a:lastline.' --assume-filename='.bufname('%').''"
let g:formatters_c = ['clangformat_c']

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
let g:syntastic_cpp_compiler = '/usr/bin/clang'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" }}}


"---------- Snippets and YouCompleteMe {{{
let g:ycm_confirm_extra_conf = 0 " load local ycm configuration silently.

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
let g:ycm_min_num_of_chars_for_completion = 3
" }}}


"---------- Taglist settings {{{
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 60
" }}}


"---------- shortcut settings {{{
:map <leader>s :w<Enter>		" to save file
:map <leader>x :q<Enter>		" to close file
:noremap <leader>t :tabnew<CR>	" open a new tab
:noremap <C-l> :tabn<CR>	" go to next tab
:noremap <C-h> :tabp<CR>	" go to previous tab
:noremap <C-v> :vsplit<CR> 	" split screen vertically
:noremap <C-t> :TlistToggle<CR> 	" open/close side tag list
:noremap <F2> :A<CR>		" a:  shortcut to switch to header file
:noremap <F3> :IHT<CR>		" a:  shortcut to open file over cursor
:noremap <F4> :Dox<CR>		" doxygen documentation
:noremap <F5> :Autoformat<CR>		"clang-format
:noremap <F6> :YcmForceCompileAndDiagnostics<CR>		"force clang check
:noremap <F8> :YcmComplete GoTo<CR>		" goto to include/definition/declaration
:noremap <F9>  :CpH2cppx<ESC>
:noremap <F11> :VimuxPromptCommand<CR>		"tmux set command
:noremap <F12> <Esc>:update<CR>:VimuxRunLastCommand<CR>		" Run last vimux command

" }}}
