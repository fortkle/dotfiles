set encoding=utf-8
scriptencoding utf-8

filetype off
filetype plugin indent off

augroup vimrc "autocmdのgroupを定義
  autocmd InsertLeave * set nopaste "Insertモードから抜けた際に:set nopasteを実行
augroup END

"-------------------------------------------------------------------------------
" Plugin
"-------------------------------------------------------------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/ "neobundleの読み込み
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'scrooloose/syntastic.git'
  NeoBundle 'PDV--phpDocumentor-for-Vim'
  NeoBundle 'chriskempson/vim-tomorrow-theme'
  NeoBundle 'junegunn/vim-easy-align'
call neobundle#end()
filetype plugin indent on "neobundleの読み込み後に実行

"-------------------------------------------------------------------------------
" Plugin Settings
"-------------------------------------------------------------------------------
" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_php_checkers=['phpcs']
let g:syntastic_php_phpcs_args='--standard=psr2'
nnoremap <Esc>s :SyntasticToggleMode<CR>

" phpDocumentor
inoremap <C-c> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-c> :call PhpDocSingle()<CR>
vnoremap <C-c> :call PhpDocRange()<CR>

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)

"-------------------------------------------------------------------------------"
" Basic Settings
"-------------------------------------------------------------------------------"
" Basic
syntax on
set fileencodings=utf-8,iso-2022-jp,cp932
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,
set lazyredraw
set ttyfast
set nf=""
vnoremap pp "0p
set scrolloff=20 " スクロールする時に下が見えるようにする "

" Generate File
set noswapfile
set nobackup

" Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
autocmd InsertLeave * set nopaste

" Search
set incsearch
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" View
set showmatch
set number
set t_Co=256
set list
set listchars=tab:\ \ ,eol:\ ,trail:-
set laststatus=2
set statusline=%f%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}
