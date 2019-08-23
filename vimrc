" --------------------------
" -         vimrc          - 
" - last updated 7/15/2019 -
" --------------------------

" -------------------------
"       Plugins used
" -------------------------
" * command-T       <https://github.com/wincent/command-t>
" * gruvbox         <https://github.com/morhetz/gruvbox>
" * indentLine      <https://github.com/Yggdroot/indentLine>
" * nerdtree        <https://github.com/scrooloose/nerdtree>
" * supertab        <https://github.com/ervandew/supertab>
" * syntastic       <https://github.com/vim-syntastic/syntastic>
" * tagbar          <https://github.com/majutsushi/tagbar>
" * taskwiki        <https://github.com/tbabej/taskwiki>
" * vim-airline     <https://github.com/vim-airline/vim-airline>
" * vim-flake8      <https://github.com/nvie/vim-flake8>
" * vim-table-mode  <https://github.com/dhruvasagar/vim-table-mode>
" * vim-taskwarrior <https://github.com/blindFS/vim-taskwarrior>
" * vimwiki         <https://github.com/vimwiki/vimwiki>
"
" ***COLOR SCHEME***
" * Alduin 


execute pathogen#infect()
filetype plugin indent on
set t_Co=256

" Enable syntax highlighting.
syntax on
colorscheme alduin 

set number

" Tabs should be converted to a group of 2 spaces.
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set expandtab
set smarttab

" Indicate 80 char text width with black column
set colorcolumn=80
highlight colorcolumn ctermbg=0

" Auto Indent to same level as previos line
set ai

" Change terminal title to name of open file
set title
set titleold=

" Automatically indent when adding a curly bracket, etc. (extended via autocmd below)
set smartindent

" Indent 1 tab after any line that starts with 1 of the cinwords if in .py file
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Use UTF-8.
set encoding=utf-8

" Spacing for C makefiles
autocmd FileType make setlocal noexpandtab

" Disable automatic comment insertion
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Search as you type.
set incsearch

" highlight matches
set hlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set guitablabel=%N:%M%t " Show tab numbers

" Ignore case when searching.
set ignorecase

" Show autocomplete menus.
set wildmenu

" Set font and fontsize for MacVim

" open Ack with Leader-a
map <leader>a :Ack! --ignore-dir=build<Space>

" allows you to copy and paste to outside programs easily
set clipboard=unnamedplus

" sort function to a key
map <Leader>s :sort i<CR>

" delete buffer shortcut
map <Leader>d :bdelete<Space>

" sort data_indices.h (greensea specific)
map <Leader>x :'<,'>!sort -u -t= -k1,1

" easier horizontal movement of code blocks
map < <gv
map > >gv

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" prevent minibufexplorer from losing undo history
set hid

" enable control + [hjkl] to window movement commands
let g:miniBufExplMapWindowNavVim = 1

set laststatus=2

" -----------------------
" --- Plugin Settings ---
" -----------------------


" ------------------
" Syntastic settings
" ------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_loc_list_height=5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:task_rc_override = 'rc.defaultwidth=200'

" Enter values if ever want to turn off filetypes in syntastic
let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['html']}

" Enable shellcheck for .sh files
let g:syntastic_sh_checkers = ['shellcheck', 'sh']

" Enable yamllint for js files
let g:syntastic_javascript_checkers = ['eslint']

" Enable yamllint for yaml files
let g:syntastic_yaml_checkers = ['yamllint']

" ignore line too long and bad visual indent for too long lines in syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E128,E127,E403,E131,E122,E123,E999'

" set syntax highlighting for Jenkinsfile
let file_name = expand('%:t:r')
if file_name == "Jenkinsfile"
  :set syntax=groovy
endif


" -------------------
" vim-flake8 Settings
" -------------------

let g:flake8_quickfix_height=7
let g:flake8_show_quickfix=1  " don't show
"let g:flake8_error_marker='EE'     " set error marker to 'EE'
"let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
"let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
"let g:flake8_complexity_marker=''  " disable McCabe complexity warnings
"let g:flake8_naming_marker=''      " disable naming warnings

" ----------------
" Vimwiki settings
" ----------------

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'}]
let g:table_mode_corner='|'


" ------------------
" Command-T settings
" ------------------

" tell command-t to search current directory down
let g:CommandTTraverseSCM='pwd'

" tell command-t to ignore certain directories
let g:CommandTWildIgnore=&wildignore . ",bower_components,node_modules,venv,build,*.pyc"


" --------------------
" Vim-Airline settings
" --------------------

" add smart tab line
let g:airline#extensions#tabline#enabled = 1

" define separator edges
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'

" ---------------------
" Other plugin settings
" ---------------------

" Sets F5 to toggle NerdTree
map <F5> :NERDTreeToggle<CR>

" Sets F8 to toggle Tagbar
nmap <F8> :TagbarToggle<CR>
