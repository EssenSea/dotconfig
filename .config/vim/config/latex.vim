let g:tex_flavor='xelatex'

" 阅读器相关的配置 包含正反向查找功能 仅供参考

set conceallevel=1
let g:tex_conceal='abdmg'
set ambiwidth=double
hi Conceal ctermbg=none
" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
  let g:vimtex_view_general_viewer = 'Sioyek'
  " let g:vimtex_view_general_options
      " \ = '-reuse-instance -forward-search @tex @line @pdf'


" Or with a generic interface:

" let g:vimtex_view_method = 'sioyek'


" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see :help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'
   let g:vimtex_compiler_latexmk = {
        \ 'callback' : 0,
        \ 'continuous' : 0,
        \}
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \}
" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

autocmd FileType tex let b:coc_pairs_disabled = ['`']


