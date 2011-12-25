"""""""""""""""""""""""""""""""""""""""
" NeoBundle plugin settings
"""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle'))
endif
"""""""""""""""""""""""""""""""""""""""
" Installed plugin list
"""""""""""""""""""""""""""""""""""""""
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/tpope/vim-surround'
NeoBundle 'git://github.com/skammer/vim-css-color'
NeoBundle 'git://github.com/scrooloose/nerdtree'
NeoBundle 'git://github.com/altercation/vim-colors-solarized'
NeoBundle 'git://github.com/cschlueter/vim-wombat.git'
NeoBundle 'git://github.com/mrtazz/molokai.vim'

filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""
" vim general settings
"""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vimbackup
set directory=~/.vimbackup
set autoindent
set browsedir=buffer 
set clipboard=unnamed
set nocompatible
set expandtab
set hidden
set incsearch
set list
set listchars=eol:$,tab:>\ ,extends:<
set number
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]
set nowrapscan

colorscheme wombat

augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

au BufNewFile,BufRead * set iminsert=0
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.txt set iminsert=2
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /Å@/

"""""""""""""""""""""""""""""""""""""""
" .vimrc quick edit settings
"""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
" Set augroup.
augroup MyAutoCmd
    autocmd!
augroup END

if !has('gui_running') && !(has('win32') || has('win64'))
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
                \ if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif

"""""""""""""""""""""""""""""""""""""""
" syntax check settings
"""""""""""""""""""""""""""""""""""""""
autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l

"""""""""""""""""""""""""""""""""""""""
" Unite plugin settings
"""""""""""""""""""""""""""""""""""""""
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]
"unite general settings
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 50
let g:unite_source_file_mru_filename_format = ''
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

"""""""""""""""""""""""""""""""""""""""
" NeoComplCache plugin settings
"""""""""""""""""""""""""""""""""""""""
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

"""""""""""""""""""""""""""""""""""""""
" Ref plugin settings 
"""""""""""""""""""""""""""""""""""""""
nmap ,ra :<C-u>Ref alc<Space>
nmap ,rp :<C-u>Ref phpmanual<Space>
let g:ref_phpmanual_path = '~/.vim/dict/phpmanual'
let g:ref_alc_start_linenumber = 39

"""""""""""""""""""""""""""""""""""
" NERDTree Plugin Settings
"""""""""""""""""""""""""""""""""""
nmap <F2> :<C-u>NERDTree<Space>
nmap <F3> :<C-u>NERDTreeToggle<CR>
