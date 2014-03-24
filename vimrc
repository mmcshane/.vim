set nocompatible
set bg=dark
set ls=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set nu
set ruler
set smarttab
set tabstop=4
set shiftwidth=4
set textwidth=80
"highlight ColorColumn guibg='DarkGray'
"set colorcolumn=+1
set smarttab
set expandtab
set softtabstop=4
set autoindent
set encoding=utf8
set ffs=unix,dos
set switchbuf=useopen,usetab
syn on
colo mpm
let mapleader=","
let c_space_errors=1
let c_no_ansi=1
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'

filetype plugin indent on
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set wildignore+=*.beam,.hg,*.pyc,*.o,*.obj
set wildmode=longest,list

nnoremap J mjJ`j
cmap w!! w !sudo tee % >/dev/null

"strip trailing whitespace
inoremap <C-u> <esc>gUiwea
nmap <Leader>p :CtrlP<CR>
nmap <Leader>t :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>l <C-w>l
nmap <Leader>h <C-w>h
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <silent> <Leader>/ :nohl<CR>

map <F6> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nnoremap <silent> <leader>W :call Preserve("%s/\\s\\+$//e")<CR>

au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
au VimResized * exe "normal! \<c-w>="

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['rfs_doxy.cfg', 'cd %s && git ls-files -co --exclude-standard -- src buildtools/version.yaml'],
        \ 2: ['.git', 'cd %s && git ls-files -co --exclude-standard'],
        \ 3: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }


if(filereadable(expand("~/.vimrc.local")))
    source ~/.vimrc.local
endif
    
