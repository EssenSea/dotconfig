nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=1
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"nnoremap <silent> :<c-u>WhichKey 'C-w'<CR>

""" Configuration example
" Echo translation in the cmdline
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Replace the text with translation
" nmap <silent> <Leader>r <Plug>TranslateR
" vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX

"vnoremap <leader>y :w !wl-copy<CR>
"xnoremap <silent> <leader>y y:call system("wl-copy --trim-newline", @*)<cr>:call system("wl-copy -p --trim-newline", @*)<cr>

"自定义剪贴板命令
xnoremap <leader>y :w !wl-copy --foreground --type text/plain<CR><CR>
nnoremap <leader>p :r !wl-paste<CR>

