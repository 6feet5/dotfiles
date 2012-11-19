set nocompatible                " Don't want VI, only Vim
set modelines=0                 " Don't trust modelines
set hidden                      " Hide buffers, don't close them
set nowrap                      " Don't wrap lines
set tabstop=3                   " A TAB is three spaces
set shiftwidth=3                " Number of spaces to use for autoindentation
set softtabstop=3               "
set expandtab                   " Expand TAB to space
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set autoindent                  " Always indent
set copyindent                  " 
set number                      " Show line numbers
set showmatch                   " Show matching bracket
set ignorecase                  " Ignore case when searching
set smartcase                   " Ignore case if all is lower case, else case sensitive
set hlsearch                    " Highlight search terms
set incsearch                   " Show matches as you type
set encoding=utf-8              
set ruler                       
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
set visualbell
set mouse=a
set linespace=0
set foldenable
set foldmethod=manual
set gdefault
set virtualedit=block
set vb t_vb=                    " No visual or audiable bell
set formatoptions=crq
syntax on                       " We want syntax highlighting

let mapleader=","               " Use comma (,) as leader for custom mappings
" Turn off highlighting
nnoremap <leader><space> :noh<cr>
" TAB is a substitute for matching bracket
nnoremap <tab> %
vnoremap <tab> %

nnoremap j gj
nnoremap k gk
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <S-F2> :NERDTree ~/perforce<CR>
map <F2> :NERDTreeToggle<CR>
" Toggle menu with F9
map <F9> :set guioptions+=m<CR>

" And some color please

" Some gui options
set guioptions-=T                " No tool bar
set guioptions-=m                " No menu bar
set guioptions-=l                " No left scroll bar..
set guioptions-=L                " ...ever
set guioptions-=r                " Same for the right side
set guioptions-=R
set history=1000                 " Better history
let g:hybrid_use_Xresources = 1
colorscheme hybrid               " Current colorscheme from https://github.com/w0ng/vim-hybrid
set background=dark
set t_Co=256
set guifont=Inconsolata

if has('statusline')
    set laststatus=1
    set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P
endif

" No TAB expansion in makefiles
autocmd FileType make set noexpandtab
autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

