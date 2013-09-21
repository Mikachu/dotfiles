set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', { 'build' : { 'unix' : 'make -f make_unix.mak' }}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mhinz/vim-tmuxify'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'noahfrederick/vim-noctu'

syntax on
filetype plugin indent on
NeoBundleCheck

if version >= 703
	set colorcolumn=80
	set relativenumber
	set cursorcolumn cursorline
else
	set number
endif
set laststatus=2
set hlsearch
set backspace=indent,eol,start
set nowrap
set showmatch
set equalalways
set splitright
set wildmenu
set autoindent smartindent
set smartindent smarttab
set tabstop=4 softtabstop=4 shiftwidth=4
set foldmethod=marker
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set hidden
set list
set fillchars+=vert:│
set listchars=tab:\|\ ,eol:★,trail:◥,extends:>,precedes:<,nbsp:.
set showcmd
set mouse=a
set nolazyredraw
set autoread
set scrolloff=500
set t_Co=16
set shortmess+=I
set ttimeoutlen=25
set background=dark
set ofu=syntaxcomplete#Complete
set tags+=~/.vim/tags/gtk+.tags
colorscheme noctu

nnoremap <F6> :set paste!<CR>
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1

let g:airline_enable_branch = '1'
let g:airline_theme = 'dan'
let g:airline_detect_whitespace = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:tmuxify_pane_split = '-v'
let g:tmuxify_pane_size = '10'

let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

let g:unite_data_directory='~/.vim/cache/unite'
let g:unite_prompt='» '
let g:unite_source_history_yank_enable = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
let g:unite_enable_start_insert = 1
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffer  buffer<cr>
nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <leader>e :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
if executable('ag')
	set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
	set grepformat=%f:%l:%c:%m
	let g:unite_source_grep_command='ag'
	let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
	let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
	set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
	set grepformat=%f:%l:%c:%m
	let g:unite_source_grep_command='ack'
	let g:unite_source_grep_default_opts='--no-heading --no-color -a'
	let g:unite_source_grep_recursive_opt=''
endif

function! RangerChooser()
	silent !ranger --choosefile=/tmp/chosenfile `[ -z '%' ] && echo -n . || dirname %`
	if filereadable('/tmp/chosenfile')
		exec 'edit ' . system('cat /tmp/chosenfile')
		call system('rm /tmp/chosenfile')
	endif
	redraw!
endfunction
map ,r :call RangerChooser()<CR>

if has("gui_running")
	set background=dark
	set gfn=Tewi\ 11
	set guioptions-=L
	set guioptions-=r
	set guioptions-=b
	set guioptions-=T
	set guioptions-=m
endif
if version >= 703
	if exists("&undodir")
		set undodir=~/.vim/undo//
	endif
	set undofile
	set undoreload=10000
endif
if exists("&backupdir")
	set backupdir=~/.vim/backups//
endif
if exists("&directory")
	set directory=~/.vim/swaps//
endif
set undolevels=1000

autocmd! bufwritepost ~/.vimrc source ~/.vimrc
autocmd! bufwritepost ~/dotfiles/.vimrc source ~/.vimrc
ca w!! w !sudo tee >/dev/null "%"
