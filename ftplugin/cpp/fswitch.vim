au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.,../include/**' | map <buffer> <leader>f :FSSplitLeft<CR>
au! BufEnter *.hpp let b:fswitchdst = 'cpp,cxx' | let b:fswitchlocs = '.,..,../../**,../../../**' | map <buffer> <leader>f :FSSplitRight<CR>
