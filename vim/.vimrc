set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Being Vundle Plugin list.
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'solarnz/thrift.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'mattn/vim-lsp-settings'
Plugin 'kovisoft/paredit'
Plugin 'guns/vim-clojure-static'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/syntastic'
Plugin 'belltoy/vim-protobuf'
Plugin 'rust-lang/rust.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jamessan/vim-gnupg'
Plugin 'jjo/vim-cue'
Plugin 'ledger/vim-ledger'
Plugin 'SirVer/ultisnips'
Plugin 'thomasfaingnaert/vim-lsp-snippets'
Plugin 'thomasfaingnaert/vim-lsp-ultisnips'
" End Vim plugin list
call vundle#end()

filetype plugin indent on
syntax on
set backspace=eol,indent,start
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
set laststatus=2
set smartcase
set hlsearch
set guioptions=-M

set termguicolors
colorscheme default
set bg=dark

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
au BufRead,BufNewFile *.elm set filetype=elm nohlsearch
au BufRead,BufNewFile TODO set ic ts=2 sw=2 sts=2 filetype=yaml
au BufRead,BufNewFile Makefile set filetype=make ic ts=2 sw=2 sts=2 noexpandtab
au BufRead,BufNewFile SConstruct set filetype=python

" don't leak sensitive data.
au BufRead,BufNewFile /dev/shm/* set nobackup nowritebackup noswapfile noundofile viminfo=

autocmd FileType make set noexpandtab
autocmd FileType python set ts=2 sts=2 sw=2 expandtab

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
set completeopt-=preview
set switchbuf=useopen

if executable('terraform-ls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'terraform-ls',
    \ 'cmd': {server_info->['terraform-ls', 'serve']},
    \ 'whitelist': ['terraform'],
    \ })
endif

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

let g:syntastic_check_on_open = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_scala_checkers = ['fsc']

let g:lsp_auto_enable = 1
let g:cue_fmt_on_save = 1
let g:fzf_buffers_jump = 1
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0

map <c-p> :FZF<cr>
map <c-h> :History<cr>
