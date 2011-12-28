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
NeoBundle 'git://github.com/kana/vim-arpeggio'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/tpope/vim-surround'
NeoBundle 'git://github.com/Townk/vim-autoclose'
NeoBundle 'git://github.com/skammer/vim-css-color'
NeoBundle 'git://github.com/scrooloose/nerdtree'
NeoBundle 'git://github.com/kien/ctrlp.vim'
NeoBundle 'git://github.com/altercation/vim-colors-solarized'
NeoBundle 'git://github.com/cschlueter/vim-wombat.git'
NeoBundle 'git://github.com/mrtazz/molokai.vim'
NeoBundle 'git://github.com/vim-scripts/Zenburn'
NeoBundle 'git://github.com/therubymug/vim-pyte'
NeoBundle 'newspaper.vim'
NeoBundle 'Changed'

NeoBundle 'git://github.com/violetyk/cake.vim'
filetype plugin on
filetype plugin indent on
syntax enable


" Vi互換をオフにする
set nocompatible
" バックアップファイルを作るディレクトリを設定する
set backupdir=~/.vimbackup
" スワップファイル用のディレクトリ名をコンマで区切って指定する
set directory=~/.vimbackup
" 新しい行を開始したときに新しい行のインデントを現在の行と同じ量にする
set autoindent
" ファイルブラウザにどのディレクトリを使うか
set browsedir=buffer
" クリップボードの動作設定
set clipboard=unnamed
" ファイルないのTabが対応するスペースの数
set tabstop=4
" 行番号を表示する
set number
" 自動インデントの各段階に使われるスペースの数
set shiftwidth=4
" インサートモードでTabを入力するとTab文字の代わりにshiftwidthの数のスペースを挿入する
set expandtab
" 保存しないで他のファイルを表示することが出来るようにする
set hidden
"タブ文字、行末など不可視文字を表示する
set list
" listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 検索で小文字なら大文字を無視、大文字なら無視しない
set smartcase
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 行頭の余白内でTabを打つとshiftwidthの数だけインデントする
set smarttab
" カーソルを行頭、行末でとまらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" インクリメンタルサーチを行う
set incsearch
" 検索時にファイルの最後まで行ったら最初に戻らない
set nowrapscan
" ステータスラインを2行にする
set laststatus=2
" ステータスラインのフォーマット
set statusline=%<%f\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P

set t_Co=256
colorscheme molokai

" 端末の出力に用いられるエンコーディングを指定
set termencoding=utf-8
" Vimが内部で用いるエンコーディングを指定
set encoding=utf-8
" Vimが既存のファイルを開く際、適切なエンコーディングを自動的に判定するために用いられる
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
" Vimが認識できるファイルフォーマットのリスト
set ffs=unix,dos,mac
" UTF-8の□や○でカーソル位置がずれないようにする
if exists('&ambiwidth')
	set ambiwidth=double
endif

com! C let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

"""""""""""""""""""""""""""""""""""""""
" .vimrc quick edit settings
"""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
" Set augroup.
augroup MyAutoCmd
    autocmd!
    if !has('gui_running') && !(has('win32') || has('win64'))
        autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
    else
        autocmd BufWritePost $MYVIMRC source $MYVIMRC | if has('gui_running') | source $MYGVIMRC
        autocmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
    endif
augroup END

augroup InsertStatusLineHilight
    autocmd!
    autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"""""""""""""""""""""""""""""""""""""""
" Filetype settings
"""""""""""""""""""""""""""""""""""""""
augroup FileTypeSetting
    autocmd!
    autocmd BufRead,BufNewFile *.ctp set filetype=php
augroup END

"""""""""""""""""""""""""""""""""""""""
" syntax check settings
"""""""""""""""""""""""""""""""""""""""
augroup SyntaxCheck
    autocmd!
    autocmd filetype php :set makeprg=php\ -l\ %
    autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l
augroup END

"""""""""""""""""""""""""""""""""""""""
" Comment out key-mapping
" lhs comments
"""""""""""""""""""""""""""""""""""""""
vmap ,# :s/^/#/<CR>:nohlsearch<CR>
vmap ,/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap ,> :s/^/> /<CR>:nohlsearch<CR>
vmap ," :s/^/\"/<CR>:nohlsearch<CR>
vmap ,% :s/^/%/<CR>:nohlsearch<CR>
vmap ,! :s/^/!/<CR>:nohlsearch<CR>
vmap ,; :s/^/;/<CR>:nohlsearch<CR>
vmap ,- :s/^/--/<CR>:nohlsearch<CR>
vmap ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR> 

" block comments
vmap ,b v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap ,h v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>

"jk同時押しでEsc
call arpeggio#load()
Arpeggionmap jk <Esc>
Arpeggioimap jk <Esc>
Arpeggiocmap jk <Esc>
Arpeggiovmap jk <Esc>
Arpeggionmap fj <Esc>
Arpeggioimap fj <Esc>
Arpeggiocmap fj <Esc>
Arpeggiovmap fj <Esc>

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

    " Define snippets directory"
    let g:neocomplcache_snippets_dir = $HOME . '/Dropbox/vim/snippets'

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()
    nnoremap <silent> <Space>es  :<C-u>NeoComplCacheEditSnippets<CR>

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
" Surround plugin settings
"""""""""""""""""""""""""""""""""""""""
let b:surround_{char2nr('p')} = "<?php \r ?>"
let b:surround_{char2nr('e')} = "<?php echo $\r; ?>"
let b:surround_{char2nr('h')} = "<?php echo h( $\r ); ?>"
let b:surround_{char2nr('f')} = "<?php foreach ($\r as $val): ?>\n<?php endforeach; ?>"

"""""""""""""""""""""""""""""""""""""""
" Ref plugin settings 
"""""""""""""""""""""""""""""""""""""""
nmap ,ra :<C-u>Ref alc<Space>
nmap ,rp :<C-u>Ref phpmanual<Space>
let g:ref_phpmanual_path = $HOME . '/Dropbox/phpmanual'
let g:ref_alc_start_linenumber = 39

"""""""""""""""""""""""""""""""""""
" NERDTree Plugin Settings
"""""""""""""""""""""""""""""""""""
nmap <F2> :<C-u>NERDTree<Space>
nmap <F3> :<C-u>NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
" Cake.vim plugin key mappings and settings
""""""""""""""""""""""""""""""""""""""""""""""""
if !(has('win32') || has('win64'))
    let g:cakephp_auto_set_project = 1
    let g:cakephp_app = $HOME . "/develop/dwh/app/"
endif
nnoremap <Space>cm :<C-u>Cmodel<Space>
nnoremap <Space>ccv :<C-u>Ccontrollerview<Space>
nnoremap <Space>ccm :<C-u>Ccomponent<Space>
nnoremap <Space>ccf :<C-u>Cconfig<Space>
nnoremap <Space>cb :<C-u>Cbehavior<Space>
nnoremap <Space>ch :<C-u>Chelper<Space>
nnoremap <Space>ct :<C-u>Ctest<Space>
nnoremap <Space>cf :<C-u>Cfixture<Space>
nnoremap <Space>cs :<C-u>Cshell<Space>
