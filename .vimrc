set nocompatible

" NeoBundle ------------------------
let g:neobundle_default_git_protocol='git'
if has('vim_starting')
  filetype plugin off
  filetype indent off
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'szw/vim-tags'

" vim-tags
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"

" vim-lightline
let g:lightline = {
    \ 'component_function': {
    \   'filename': 'MyFileName'
    \ }
    \ }

function! MyFileName()
    if '' != expand('%:p')
        if stridx(expand('%:p'), expand('~')) == 0
            return substitute(expand('%:p'), expand('~'), '~', '')
        else
            return substitute(expand('%:p'))
        endif
    else
        return '[No Name]'
    endif
endfunction

" Common ---------------------------
syntax on
filetype plugin on
filetype indent on
set lazyredraw
set ttyfast
set wrap

" Encoding -------------------------
set fileencodings=iso-2022-jp,utf-8,cp932

" File -----------------------------
set autoread                        " 更新時に自動再読み込み
set hidden							" 編集中でも他ファイルを開く
set noswapfile                      " スワップファイルを作らない
set nobackup                        " バックアップを取らない
"autocmd BufWritePre * :%s/\s\+$//ge " 保存時に行末の空白を除去する

" Indent ---------------------------
set expandtab
set tabstop=4                       " タブ幅を設定
set softtabstop=0
set shiftwidth=4
set autoindent                      " オートインデント
set smartindent                     " スマートインデント

" Assist Typing --------------------
set backspace=indent,eol,start      " バックスペースで特殊記号も削除
set formatoptions=lmoq              " 整形オプション、マルチバイト系追加
set whichwrap=b,s,h,l,<,>,[,]       " 行頭と行末で移動できるようにする

" Complement Command ---------------
set wildmenu                        " コマンド補完を強化
set wildmode=list:full              " リスト表示、最長マッチ

" Search ---------------------------
set wrapscan                        " 最後まで検索したら先頭へ戻る
set ignorecase                      " 大文字小文字無視
set smartcase                       " 大文字ではじめたら大文字小文字判断
set incsearch                       " インクリメンタルサーチ
set hlsearch                        " 検索文字をハイライト
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
" Esc EscでハイライトOFF

" View -----------------------------
set showmatch                       " 括弧の対応をハイライト
set showcmd							" 入力中のコマンドを表示
set showmode                        " 現在のモードを表示
set number							" 行番号表示
set nowrap							" 画面幅で折り返さない
set cursorline                      " カーソル行をハイライト
set title                           " 編集中のファイル名を表示
set showmode                        " モードを表示する

" StatusLine -----------------------
set laststatus=2                    " ステータスラインを2行に
set t_Co=256						" lightline.vim用
set statusline=%<%f\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P
