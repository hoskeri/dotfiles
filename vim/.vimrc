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
Plugin 'guns/vim-clojure-static'
Plugin 'Shougo/neocomplete'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/vimproc'
Plugin 'ElmCast/elm-vim'
Plugin 'belltoy/vim-protobuf'
Plugin 'rust-lang/rust.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jamessan/vim-gnupg'

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
" required by vim-go 'show_type_info'
set noshowmode

set spelllang=en_us
set spellfile=~/.vim/spelling.utf-8.add

" make vim work well with file watchers.
set backupcopy=yes

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

autocmd FileWritePre * :silent call TrimWhiteSpace()
autocmd FileAppendPre * :silent call TrimWhiteSpace()
autocmd FilterWritePre * :silent call TrimWhiteSpace()
autocmd BufWritePre * :silent call TrimWhiteSpace()

au BufRead,BufNewFile *.def set filetype=c ts=4 sts=4 sw=4
au BufRead,BufNewFile *.c set filetype=c ts=4 sts=4 sw=4
au BufRead,BufNewFile *.cc set filetype=c ts=4 sts=4 sw=4
au BufRead,BufNewFile *.py set filetype=python ts=2 sts=2 sw=2
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
au BufRead,BufNewFile *.go set noexpandtab ts=2 sw=2 sts=2 filetype=go
au BufRead,BufNewFile *.scala set ic ts=2 sw=2 sts=2
au BufRead,BufNewFile TODO set ic ts=2 sw=2 sts=2 filetype=yaml
au BufRead,BufNewFile Makefile set filetype=make ic ts=2 sw=2 sts=2 noexpandtab
au BufRead,BufNewFile SConstruct set filetype=python
au BufRead,BufNewFile *.elm set filetype=elm nohlsearch
autocmd BufWritePost *.go silent call go#cmd#Build(1)

" don't leak sensitive data.
au BufRead,BufNewFile /dev/shm/* set nobackup nowritebackup noswapfile noundofile viminfo=

autocmd FileType make set noexpandtab
autocmd FileType python set ts=2 sts=2 sw=2 expandtab

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

let g:go_auto_type_info = 1
let g:go_gocode_propose_source = 0
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_check_on_open = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_scala_checkers = ['fsc']

let g:neocomplete#enable_at_startup = 1

let g:fzf_buffers_jump = 1
map <c-p> :FZF<cr>

let g:scala_scaladoc_indent = 1
