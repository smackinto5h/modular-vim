" fzf keymaps requires plug junegunn/fzf.vim

" Files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fq :CList<CR> " For quickfix list
nnoremap <leader>fh :Helptags<CR>

" grep current string 
nnoremap <leader>fs :Rg <C-r><C-w><CR>

" grep input string (fzf prompt)
nnoremap <leader>fg :Rg<Space>

" grep for current file name (without extension)
nnoremap <leader>fc :execute 'Rg ' . expand('%:t:r')<CR>

" grep files in vim config
nnoremap <leader>fi :Files ~/.vim<CR>
