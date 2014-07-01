" NeoBundle ------------------------------
" mkdir -p ~/.vim/bundle↲
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim↲
" cd ~/.vim/bundle/vimproc/
" make -f make_***.mak"

let g:neobundle_default_git_protocol='git'
if has('vim_starting')
    set nocompatible
    filetype plugin off
    filetype indent off
    execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tomasr/molokai'

" Bundle Settings ------------------------
" NERDTree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

" unite
nnoremap <silent> <space>fm :<C-u>Unite file_mru<CR>
nnoremap <silent> <space>fr :<C-u>Unite register<CR>
nnoremap <silent> <space>fs :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <space>ss :<C-u>UniteResume search-buffer<CR>

if executable('ag')
   let g:unite_source_grep_command = 'ag'
   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
   let g:unite_source_grep_recursive_opt = ''
endif

" Vim Settings ---------------------------
" Basic
syntax on
filetype plugin on
filetype indent on
colorscheme molokai
set fileencodings=iso-2022-jp,utf-8,cp932
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,
set lazyredraw
set ttyfast

" Generate File
set viminfo+=n$HOME/.vim/viminfo
set noswapfile
set nobackup

" Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab

" Search
set incsearch
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" View
set showmatch
set number
set t_Co=256
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
