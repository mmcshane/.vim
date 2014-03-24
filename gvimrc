set guioptions=arie
set guifont=Deja\ Vu\ Sans\ Mono\ 11

if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
endif
map <F2> :let &lines=&lines+1<CR>
