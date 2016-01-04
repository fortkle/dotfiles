set encoding=utf-8
scriptencoding utf-8
set fileencoding=uft-8   " カレントバッファのファイルの文字エンコーディング
set fileencodings=uft-8  " 既存のファイルの編集を開始するときに考慮される文字エンコーディングのリスト

"-------------------------------------------------------------------------------
" Plugin
"-------------------------------------------------------------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  " Neobundleが未インストールであればgit clone
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'   " Neobundle自身を管理。その場合はNeoBundleFetch
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'scrooloose/syntastic.git'
  NeoBundle 'PDV--phpDocumentor-for-Vim'
  NeoBundle 'junegunn/vim-easy-align'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'rhysd/clever-f.vim'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'othree/javascript-libraries-syntax.vim'
  NeoBundle 'othree/yajs.vim'
  NeoBundle 'isRuslan/vim-es6'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'lilydjwg/colorizer'
  NeoBundle 'wavded/vim-stylus'
  NeoBundle 'chriskempson/vim-tomorrow-theme'
call neobundle#end()
filetype plugin indent on " Neobundleの読み込み後に実行
NeoBundleCheck " 未インストールのプラグインがあれば通知

"-------------------------------------------------------------------------------
" Vim Options
"-------------------------------------------------------------------------------
" Basic
syntax on                       " シンタックスハイライトの有効化
set t_Co=256                    " 256色数に設定
set backspace=indent,eol,start  " Backspaceの有効化
set whichwrap=b,s,h,l,<,>,[,]   " カーソルが行頭／末にあるときに前／次行に移動できる
set lazyredraw                  " マクロやコマンドを実行する間、画面を再描画しない(スクロールが重くなる対策)
set ttyfast                     " 高速ターミナル接続を行う(スクロールが重くなる対策)
set scrolloff=10                " 編集中の箇所の周辺のテキストを見ることができる(スクロールする時に下が見える)
set noswapfile                  " スワップファイルを作成しない
set nobackup                    " バックアップファイルを作成しない

" View
colorscheme Tomorrow-Night-Bright   " テーマの指定
set showmatch                       " 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set matchtime=1                     " マッチしている括弧を表示するための時間を0.1秒単位で指定する
set number                          " 毎行の前に行番号を表示する
set list                            " 不可視文字を表示する
set listchars=tab:»-,eol:\ ,trail:- " 不可視文字の表示設定
set display=lastline                " テキスト表示の方法を変える(長いテキストを省略せず最後まで表示する)
set laststatus=2                    " 最下ウィンドウにステータス行を常に表示する
set statusline=%F%m%=%l,%c\ %p%{'%'}\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}  " ステータス行の表示設定

" Indent
set tabstop=4       " ファイル内の<Tab>が対応する空白の数
set softtabstop=4   " <Tab>キーを押した際に挿入されるスペース量
set autoindent      " 新しい行を開始したとき新しい行のインデントを現在行と同じくする
set shiftwidth=4    " (自動)インデントの各段階に使われる空白の数
set smartindent     " 新しい行を作ったときに高度な自動インデントを行う(ex. '{'で終わる行で新しい行を作った時は改行)
set expandtab       " 挿入モードで <Tab> を挿入するとき、代わりに適切な数の空白を使う

augroup vimrc
  autocmd!
  autocmd BufNewFile,BufRead *.ctp set filetype=html
  "autocmd BufNewFile,BufRead *.styl set filetype=css
  autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd Filetype * set formatoptions-=ro   " 改行時にコメントを継続しない
augroup END

" Search
set incsearch  " インクリメンタルサーチを有効化
set hlsearch   " 検索結果をハイライトする

"-------------------------------------------------------------------------------
" Key Mapping
"-------------------------------------------------------------------------------
" ヤンクをコピーの挙動に近づける(連続貼り付け)
vnoremap pp "0p
" 検索結果のハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

"-------------------------------------------------------------------------------
" Plugin Settings
"-------------------------------------------------------------------------------
" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_php_checkers=['phpcs']
let g:syntastic_php_phpcs_args='--standard=psr2'
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_css_checkers=['csslint']
let g:syntastic_stylus_checkers=['stylint']
nnoremap <Esc>s :SyntasticToggleMode<CR>

" phpDocumentor
inoremap <C-c> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-c> :call PhpDocSingle()<CR>
vnoremap <C-c> :call PhpDocRange()<CR>

" vim-easy-align
vnoremap <Enter> <Plug>(EasyAlign)
