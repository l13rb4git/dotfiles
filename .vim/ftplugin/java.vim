" Java settings
        let g:deoplete#enable_at_startup = 1

" Make it obvious where 100 characters is
        set textwidth=100
        set colorcolumn=+1

" Mixing Vimux commands to improve workflow with files.
        nmap ,t :call VimuxRunCommand("clear; cd " . expand("%:p:h") . " ; javac " . expand("%") . " ; java " . expand("%:r"))<CR> 

