" Set leader key 
let mapleader = " " 

" open netrw with cd
nnoremap <leader>cd :Ex<CR>
" quick jk is esc.
inoremap jk <Esc>

" Copy to system clipboard
vnoremap <leader>y :w !pbcopy<CR><CR>
nnoremap <leader>yy :.w !pbcopy<CR><CR>

" Paste from system clipboard
nnoremap <leader>p :r !pbpaste<CR>





