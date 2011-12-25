if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle'))
endif
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/tpope/vim-surround'
NeoBundle 'git://github.com/skammer/vim-css-color'

NeoBundle 'git://github.com/altercation/vim-colors-solarized'
NeoBundle 'git://github.com/cschlueter/vim-wombat.git'
NeoBundle 'git://github.com/mrtazz/molokai.vim'

filetype plugin on
filetype indent on

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


""" ref.vim
nmap ,ra :<C-u>Ref alc<Space>
nmap ,rp :<C-u>Ref phpmanual<Space>

let g:ref_phpmanual_path = '~/.vim/dict/phpmanual'
let g:ref_alc_start_linenumber = 39

nmap <F3> :<C-u>NERDTreeToggle 
