set autoindent
set cindent
set colorcolumn=110
nmap ,t :call VimuxRunCommand("clear; cd " . expand("%:p:h") . " ; clear; gcc " . expand("%") . " -o " . expand("%:r") . " ; ./" . expand("%:r"))<CR>
