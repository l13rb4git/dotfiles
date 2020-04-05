set autoindent
set cindent
set colorcolumn=110
nmap ,tc :call VimuxRunCommand("clear; cd " . expand("%:p:h") . " ; clear; gcc " . expand("%") . " -o " . expand("%:r"))<CR>
nmap ,tr :call VimuxRunCommand("./" . expand("%:r"))<CR>
