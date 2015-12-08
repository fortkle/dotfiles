" NeoBundle ------------------------------
" mkdir -p ~/.vim/bundle
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" cd ~/.vim/bundle/vimproc.vim/
" make
"
" vim ~/.vim/bundle/PDV--phpDocumentor-for-Vim/plugin/php-doc.vim
" L77-83 edit.

if has('vim_starting')
    set nocompatible
    filetype plugin off
    filetype indent off
    execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#begin(expand('~/.vim/bundle'))
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'scrooloose/syntastic.git'
  NeoBundle 'PDV--phpDocumentor-for-Vim'
  NeoBundle 'chriskempson/vim-tomorrow-theme'
  NeoBundle 'junegunn/vim-easy-align'
call neobundle#end()

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

" Vim Settings ---------------------------
" Basic
syntax on
filetype plugin on
filetype indent on
set fileencodings=utf-8,iso-2022-jp,cp932
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,
set lazyredraw
set ttyfast

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
