" ==========================
" Python LSP
" ==========================
if executable('pylsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

" ==========================
" Bash LSP
" ==========================
if executable('bash-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'bashls',
        \ 'cmd': {server_info->['bash-language-server', 'start']},
        \ 'allowlist': ['sh'],
        \ })
endif

" ==========================
" Buffer-local keymaps & settings
" ==========================
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    " Navigation & LSP commands
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    " Auto-format on save
    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre #.py,*.py call execute('LspDocumentFormatSync')
    autocmd! BufWritePre *.sh call execute('LspDocumentFormatSync')
endfunction

" ==========================
" Activate buffer-local settings when LSP attaches
" ==========================
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
