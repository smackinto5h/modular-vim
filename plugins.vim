let s:plugin_dir = expand('~/.vim/plugged')

function! s:ensure(repo)
    let name = split(a:repo, '/')[-1]
    let path = s:plugin_dir . '/' . name

    if !isdirectory(path)
        if !isdirectory(s:plugin_dir)
            call mkdir(s:plugin_dir, 'p')
        endif
        execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
    endif

    execute 'set runtimepath+=' . fnameescape(path)
endfunction

"=========================== add pluggins below ===============================
call s:ensure('ghifarit53/tokyonight-vim')
call s:ensure('junegunn/fzf')
call s:ensure('junegunn/fzf.vim')
call s:ensure('vim-airline/vim-airline')
call s:ensure('prabirshrestha/vim-lsp')
call s:ensure('tpope/vim-commentary')
call s:ensure('tpope/vim-surround')
call s:ensure('sheerun/vim-polyglot')
call s:ensure('christoomey/vim-tmux-navigator')
