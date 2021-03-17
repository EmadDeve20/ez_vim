set runtimepath+=~/.vim_runtime

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'Lokaltog/powerline',{'rtp': 'powerline/bindings/vim/'}
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'kyoz/purify', { 'rtp': 'vim' }
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Bundle 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'dracula/vim', { 'as': 'dracula' }
Plugin 'frazrepo/vim-rainbow'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'rust-lang/rust.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
syntax enable

let g:syntastic_tex_checkers = ['lacheck', 'text/language_check'] 
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
"let g:nerdtree_tabs_open_on_console_startup=1
"let g:SimpylFold_docstring_preview=1
let g:rust_clip_command = 'xclip -selection clipboard'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
"let python_highlight_all=1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:rainbow_active = 1
let g:rustfmt_autosave = 1 "will enable automatic running of :RustFmt
let g:rust_clip_command = 'xclip -selection clipboard'
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

abbr _sh #!/bin/bash
abbr _py #!/bin/python3
abbr _if if [-z $1];then<CR>echo "> $0 <name><CR>exit 2<CR>fi

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"let g:syntastic_python_checkers = ['pylint']

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <C-n> :NERDTreeToggle<CR>

"colorscheme monokai

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set clipboard=unnamed
set number
set splitbelow
set splitright
set encoding=utf-8
set noerrorbells 
set visualbell

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding with the spacebar
nnoremap <space> za
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

" nerdTree Advanced Configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable folding
set foldmethod=indent
set foldlevel=99

colorscheme onehalfdark

"python lang suport
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

"c lang suport
au BufNewFile,BufRead *.c
    \set tabstop=8
    \set softtabstop=8
    \set shiftwidth=8
    \set textwidth=59
    \set expandtab
    \set autoindent

"rust lang suport
au BufNewFile,BufRead *.rs
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \let g:nerdtree_tabs_open_on_console_startup=1

"some web lang suport
au BufNewFile,BufRead *.js, *.html, *.css
    \set tabstop=2
    \set softtabstop=2
    \set shiftwidth=2

"rust suport
au FileType rust nmap <silent> <C-]> <Plug>(rust-def)
au FileType rust nmap <silent> <C-w><C-]> <Plug>(rust-def-vertical)
au FileType rust nmap <silent> <C-w>} <Plug>(rust-def-split)
au FileType rust nmap <silent> <C-k> <Plug>(rust-doc)
