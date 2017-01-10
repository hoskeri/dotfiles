set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Being Vundle Plugin list.

Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'derekwyatt/vim-scala'
Plugin 'pearofducks/ansible-vim'
Plugin 'solarnz/thrift.vim'
Plugin 'fatih/vim-go'
Plugin 'kovisoft/paredit'
Bundle 'guns/vim-clojure-static'
Bundle 'Shougo/neocomplete'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'leafgarland/typescript-vim'
Bundle 'Shougo/vimproc'
Bundle 'Quramy/tsuquyomi'
Bundle 'ElmCast/elm-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'yosssi/vim-ace'

" End Vim plugin list
call vundle#end()

filetype plugin indent on
syntax on
set expandtab
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildmenu
set lazyredraw
set smartindent
set tags=tags;/
set tagrelative
set mouse=a
set modeline
set modelines=0
set ls=2
set hlsearch
set guioptions=-M
set t_Co=256
colorscheme default
set bg=dark

" make vim work well with file watchers.
set backupcopy=yes

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

au BufRead,BufNewFile *.def set filetype=c ts=4 sts=4 sw=4
au BufRead,BufNewFile *.c set filetype=c ts=4 sts=4 sw=4
au BufRead,BufNewFile *.cc set filetype=c ts=4 sts=4 sw=4
au BufRead,BufNewFile *.py set filetype=python ts=4 sts=4 sw=4
au BufRead,BufNewFile *.h set filetype=c ts=4 sts=4 sw=4
au BufRead,BufNewFile *.yml set ts=2 sw=2 filetype=ansible
au BufRead,BufNewFile *.thrift set ts=2 sw=2 filetype=thrift
au BufRead,BufNewFile *.coffee set expandtab ts=2 sw=2 filetype=coffee
au BufRead,BufNewFile *.js set expandtab ts=2 sw=2 sts=2 filetype=javascript
au BufRead,BufNewFile *.json set expandtab ts=2 sw=2 sts=2 filetype=json
au BufRead,BufNewFile *.html set expandtab ts=2 sw=2 sts=2 filetype=html

au BufRead,BufNewFile *.boot set expandtab ts=2 sw=2 sts=2 filetype=clojure
au BufRead,BufNewFile *.clj set expandtab ts=2 sw=2 sts=2 filetype=clojure
au BufRead,BufNewFile *.cljs set expandtab ts=2 sw=2 sts=2 filetype=clojure

au BufRead,BufNewFile *.scala set ic ts=2 sw=2 sts=2

au BufRead,BufNewFile SConstruct set filetype=python

autocmd FileType make set noexpandtab

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

let g:go_auto_type_info = 1
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_check_on_open = 0
let g:syntastic_scala_checkers = ['fsc']

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build|opensrc)|(\.(swp|ico|git|svn|class))$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_regexp = 1
let g:ctrlp_lazy_update = 1
let g:ctrlp_use_caching = 1

let g:neocomplete#enable_at_startup = 1

let g:scala_scaladoc_indent = 1
