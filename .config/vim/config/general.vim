set nu
set relativenumber
set encoding=utf-8
syntax on

set guifont=CodeNewRoman\ Nerd\ Font\ 14
set cursorline
set colorcolumn=+1
set textwidth=78
" set cursorcolumn
set list
set listchars=tab:>-,trail:-
set autoindent
set cindent
set shiftwidth=4
set tabstop=4
set mouse=a
set guioptions=mgT
set clipboard=unnamed
set showcmd ruler
set ignorecase smartcase
set nowrapscan
let g:mapleader = "\<Space>"
"hi Ignore guifg=color
"hi Ignore ctermfg=
let g:ft_man_open_mode = 'vert'
if v:progname =~? "evim"
finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
set nobackup		" do not keep a backup file, use versions instead
else
set backup		" keep a backup file (restore to previous version)
if has('persistent_undo')
set undofile	" keep an undo file (undo changes after closing)
endif
endif

if &t_Co > 2 || has("gui_running")
" Switch on highlighting the last used search pattern.
set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
"augroup vimrcEx
"au!

" For all text files set 'textwidth' to 78 characters.
"autocmd FileType text setlocal textwidth=70

"augroup END
" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not
" backwards compatible.
" The ! means the package won't be loaded right away but when plugins
" are loaded during initialization.
if has('syntax') && has('eval')
packadd! matchit
endif
