" NeoBundle ------------------------------
" mkdir -p ~/.vim/bundle
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim↲
" cd ~/.vim/bundle/vimproc.vim/
" make"

let g:neobundle_default_git_protocol='git'
if has('vim_starting')
    set nocompatible
    filetype plugin off
    filetype indent off
    execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'chriskempson/vim-tomorrow-theme'
call neobundle#end()

" Bundle Settings ------------------------
" NERDTree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeHijackNetrw = 0

" unite
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
nnoremap <silent> <space>f :<C-u>Unite file_mru<CR>
nnoremap <silent> <space>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <space>gw :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> <space>gg :<C-u>UniteResume search-buffer<CR>

if executable('ag')
   let g:unite_source_grep_command = 'ag'
   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
   let g:unite_source_grep_recursive_opt = ''
endif

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_php_checkers=['phpcs']
let g:syntastic_php_phpcs_args='--standard=psr2'
nnoremap <Esc>s :SyntasticToggleMode<CR>

" Vim Settings ---------------------------
" Basic
syntax on
filetype plugin on
filetype indent on
colorscheme Tomorrow-Night-Bright
"set fileencodings=iso-2022-jp,utf-8,cp932
set fileencodings=utf-8,iso-2022-jp,cp932
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

