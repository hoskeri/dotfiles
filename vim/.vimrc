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
Bundle 'Shougo/neocomplete'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/syntastic'

" End Vim plugin list
call vundle#end()

filetype plugin indent on
syntax on
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wildmenu
set lazyredraw
set smartindent
set tags=tags;/
set tagrelative
set bg=dark
set mouse=a
set modeline
set ls=2
set hlsearch
set guioptions=-M

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

au BufRead,BufNewFile *.def set filetype=c
au BufRead,BufNewFile *.yml set ts=2 sw=2 filetype=ansible
au BufRead,BufNewFile *.thrift set ts=2 sw=2 filetype=thrift
au BufRead,BufNewFile *.coffee set expandtab ts=2 sw=2 filetype=coffee
au BufRead,BufNewFile *.js set expandtab ts=2 sw=2 sts=2 filetype=javascript
au BufRead,BufNewFile *.es6 set expandtab ts=2 sw=2 sts=2 filetype=javascript
au BufRead,BufNewFile *.json set expandtab ts=2 sw=2 sts=2 filetype=json
au BufRead,BufNewFile *.scala set ic
"autocmd FileType make set noexpandtab

map <C-n> :NERDTreeToggle<CR>

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

let xml_use_xhtml = 1

let g:ycm_key_list_select_completion = ["<c-tab>", "<down>"]
let g:ycm_key_list_previous_completion = ["<c-s-tab>", "<up>"]
let g:SuperTabDefaultCompletionType = "<c-tab>"
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build|opensrc)|(\.(swp|ico|git|svn))$'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:neocomplete#enable_at_startup = 1

