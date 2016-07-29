" VIMRC by astyfx
" https://github.com/VundleVim/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/neocomplete'

" NERDtree, a filesystem explorer
Plugin 'scrooloose/nerdtree'

" Fugitive allows use git in vim
Plugin 'tpope/vim-fugitive'

Plugin 'unterzicht/vim-virtualenv'

" html5, HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim
Plugin 'othree/html5.vim'

" Powerline, a utility plugin which allows you to create better-looking, more
" functional vim statuslines
Plugin 'Lokaltog/vim-powerline'

" Syntastic, Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

" Surround provides mappings to easily delete, change and add surroundings in
" pairs : parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-surround'

" vim-indent-guides, a plugin for visually displaying indent levels in Vim.
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'klen/python-mode'

" Vim-go
Plugin 'fatih/vim-go'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Emmet-vim
Plugin 'mattn/emmet-vim'

" NerdTree git plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable

set encoding=UTF-8
set fileencoding="UTF-8"

colorscheme maui

set smarttab
set expandtab " Expand TABs to spaces
set shiftwidth=2 " size of an 'indent'
set tabstop=2 " size of a hard tabstop, still it is \t
set softtabstop=2 " sets the number of columns for a TAB

set guifont=Hack

"set autoindent
set cindent
set smartindent " smart new line indent after if or for
set nocompatible
set nobackup

" auto new line
set nowrap
set number
set ruler
set title
"set linebreak
set cursorline
set sm " showmatch -> show macthced brackets
set background=dark
set hlsearch
set ignorecase
set history=1000

"set showbreak=>>
set ls=2 " always show status line

set cmdheight=2
set backspace=2
set laststatus=2

" plugin settings
"
" for NERD Tree
"" press ctrl + n to toggle NERD Tree
map <C-n> :NERDTreeToggle<CR>
"" auto close vim if the only window left open is a NERD Tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"
autocmd FileType python set colorcolumn=120

" for git Commit Message
autocmd Filetype gitcommit setlocal spell textwidth=72

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level=2
let g:jsx_ext_required = 0 " for syntax highlighting in .js

let g:explVertical=1
let g:explSplitRight=1
let g:explStartRight=1
let g:explWinSize=20

let g:syntastic_python_checkers = [] " for pymode lint ignore

" Settings for python-mode

let g:pymode_virtualenv=1 
let g:pymode_folding=0                                
let g:pymode_utils_whitespaces=0                                
let g:pymode_syntax=0                                           
let g:pymode_lint=1
let g:pymode_lint_ignore="E111,E501,W"
let g:pymode_lint_checker="pyflakes,pep8,pep257,mccabe"
let g:pymode_lint_minheight=5       
let g:pymode_lint_maxheight=15
let g:pymode_lint_write=0
let g:pymode_lint_mccabe_complexity=10
let g:pymode_syntax_highlight_self=0
let g:pymode_doc=0
let g:pymode_rope=0
let g:pymode_rope_vim_completion=0

let g:pymode_run=1
let g:pymode_python="python"
let g:pymode_run_bind ='<F5>'


" Settings for jedi-vim

let g:jedi#usages_command="<leader>z"
let g:jedi#show_call_signatures=0
let g:jedi#popup_on_dot=1
let g:jedi#popup_select_first=0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

let g:NERDTreeUpdateOnWrite = 0

set statusline=%<%F%h%m%r%h%w%y\ %{strftime(\"%Y/%m/%d-%H:%M:%S\")}%=\ (%l,%v)\ ASCII:%b\ %P

" comment setting
" custom auto comment by harry
function! CommonComment()
    let s:comment_map = {
                \   "c": '\/\/',
                \   "cpp": '\/\/',
                \   "go": '\/\/',
                \   "java": '\/\/',
                \   "javascript": '\/\/',
                \   "php": '\/\/',
                \   "python": '#',
                \   "ruby": '#',
                \   "vim": '"',
                \ }

  if has_key(s:comment_map, &filetype)
    let comment_leader = s:comment_map[&filetype]
  else
    let comment_leader = '\/\/'
  end

  exe "nmap ; :s/^/" . comment_leader . "/ge<CR>:let @/ = \"\"<CR>"
  exe "nmap ;; :s/^" . comment_leader . "//ge<CR>:let @/ = \"\"<CR>"
  exe "vmap ; :s/^/" . comment_leader . "/ge<CR>:let @/ = \"\"<CR>"
  exe "vmap ;; :s/^" . comment_leader . "//ge<CR>:let @/ = \"\"<CR>"
endfunction

function! XmlComment()
  exe "nmap ; :s/^\\(.*\\)\\n/<!--\\1-->\\r/ge<CR>:let @/ = \"\"<CR>"
  exe "nmap ;; :s/^<!--\\(.*\\)-->\\n/\\1\\r/ge<CR>:let @/ = \"\"<CR>"
  exe "vmap ; :s/^\\(.*\\)\\n/<!--\\1-->\\r/ge<CR>:let @/ = \"\"<CR>"
  exe "vmap ;; :s/^<!--\\(.*\\)-->\\n/\\1\\r/ge<CR>:let @/ = \"\"<CR>"
endfunction

autocmd BufEnter *.* call CommonComment()
autocmd BufEnter *.html,*.htm,*.xml call XmlComment()


map <Leader>sv :source ~/.vimrc<CR>

set colorcolumn=120
