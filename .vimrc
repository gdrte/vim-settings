" Devanand Reddy
" My custom configuration
"

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
filetype plugin indent on


set ruler

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
colorscheme wombat256mod

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

let g:EclimLocateFileDefaultAction="split"
let g:EclimLocateFileCaseInsensitive="never"
let g:EclimLocateFileScope="workspace"


" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
set hidden
set encoding=utf-8 
set nowrap        " don't wrap lines
set laststatus=2
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=4000         " remember more commands and search history
set undolevels=4000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.a,*.jpeg,*.gif,*.png
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
set cursorline
set noshowmode
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

let g:locateopen_ignorecase = 1


" let &titlestring = expand("%:p")
" if &term == "screen"
"   set t_ts=^[k
"   set t_fs=^[\
" endif
" if &term == "screen" || &term == "xterm"
"   set title
"  endif
"
" python from powerline.bindings.vim import source_plugin; source_plugin()
" source ~/.local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
" source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
" let g:Powerline_symbols = 'fancy' 
let g:airline_powerline_fonts = 1
set term=xterm-256color

" let g:CommandTMaxFiles=1000
" let g:CommandTMaxHeight=25
" let g:CommandTMinHeight=4
 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command ='ag %s -l --nocolor -g ""'
"key remaps
"Remap Command Mode
nnoremap ; :
let mapleader ="," "Map <leader> key
"Map NERDTree toggle to <leader>n
map <leader>n :NERDTreeToggle<CR> 
"Map Go Fmt to <leader>f
map <leader>f :Fmt<CR> 
map <leader>ll :TlistToggle<CR>

" key mapping for google search
function! Google()
   call inputsave()
   let searchterm = input('Google: ')
   call inputrestore()
   return searchterm
endfunction
map <leader>g <ESC>:! /usr/bin/open -a "/Applications/Google Chrome.app" 'https://google.com/search?q=<C-R>=Google()<CR>'<CR><CR>
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"Function key bindings
"Compiler navigation bindings
:map	<F2>	:cnext<CR> 
:map	<S-F2>	:cprev<CR>
nnoremap <F3> :nohl<CR>
nnoremap <F4> :NERDTreeFind<CR>
map <F5> :silent execute " grep -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>

nnoremap <silent><F9> :MaximizerToggle<CR> 
vnoremap <silent><F9> :MaximizerToggle<CR>gv 
inoremap <silent><F9> <C-o>:MaximizerToggle<CR> 

nnoremap <silent> <F10> :bn<CR>
nnoremap <silent> <S-F10> :bp<CR>
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
" \ "\<lt>C-n>" :
" \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
" \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
" \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" 
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" imap <C-@> <C-Space>
autocmd FileType go compiler golang
autocmd FileType python compiler pylint
let g:golang_goroot=$GOROOT
"Maximizer key bindings
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
"

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
" The bundles you install wiol be listed here
"
filetype plugin indent on
" The rest of your config follows here

" Python-mode settings
"    ____  _  _  ____  _   _  _____  _  _     __  __  _____  ____  ____      ~
"   (  _ \( \/ )(_  _)( )_( )(  _  )( \( )___(  \/  )(  _  )(  _ \( ___)     ~
"    )___/ \  /   )(   ) _ (  )(_)(  )  ((___))    (  )(_)(  )(_) ))__)      ~
"   (__)   (__)  (__) (_) (_)(_____)(_)\_)   (_/\/\_)(_____)(____/(____)     ~
"

" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
" Load the whole plugin
" let g:pymode = 1
" Disable pylint checking every save
let g:pymode_lint_write = 0
"
" " Set key 'R' for run python code
" let g:pymode_run_key = 'R'
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
" Skip errors and warnings
" " E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and
" etc
let g:pymode_lint_ignore = "E501"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬
"
" automatically change window's cwd to file's dir
"set autochdir
"
" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

