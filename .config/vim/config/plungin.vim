packadd! editorconfig
runtime ftplugin/man.vim
 set nocompatible              " 去除VI一致性,必须
   filetype off                  " 必须

   syntax on
   set mouse=a
   call plug#begin()
   Plug 'gentoo/gentoo-syntax'
   Plug 'w0rp/ale'
   Plug 'lervag/vimtex'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'SirVer/ultisnips'
   Plug 'honza/vim-snippets'
   Plug 'KeitaNakamura/tex-conceal.vim'
   Plug 'yianwillis/vimcdoc'
   Plug 'liuchengxu/vim-which-key',{'on':['WhichKey', 'WhichKey!']}
   Plug 'luochen1990/rainbow'
   Plug 'jasonccox/vim-wayland-clipboard'

   let g:rainbow_active = 1
   " Plug 'preservim/nerdtree'
   Plug 'preservim/nerdcommenter'
   " Plug 'preservim/tagbar'
   " nmap <C-u> :TagbarToggle<CR>
   Plug 'easymotion/vim-easymotion'
   "map <silent> <Leader>m <Plug>(easymotion-prefix)
   Plug 'tpope/vim-surround'
   Plug 'voldikss/vim-translator'
   "Plug 'kaarmu/typst.vim'
   Plug 'imsnif/kdl.vim'
   Plug 'ryanoasis/vim-devicons'
   """""
   Plug 'mhinz/vim-startify'
   Plug 'cocopon/iceberg.vim'
   Plug 'ayu-theme/ayu-vim'
   Plug 'sonph/onehalf', { 'rtp': 'vim' } 
   Plug 'sainnhe/everforest'
   Plug 'ghifarit53/tokyonight-vim'
   Plug 'junegunn/seoul256.vim'
   Plug 'arcticicestudio/nord-vim'
   Plug 'sainnhe/sonokai'
   Plug 'catppuccin/vim', { 'as': 'catppuccin' }
   Plug 'KeitaNakamura/neodark.vim'
   Plug 'rayes0/blossom.vim'
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'

   call plug#end()


  filetype plugin on
  filetype indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
