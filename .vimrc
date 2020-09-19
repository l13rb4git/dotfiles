" E576: Failed to parse ShaDa file  {{{

        if !has('nvim')
          set viminfo+=n~/vim/viminfo
        else
          " Do nothing here to use the neovim default
          " or do soemething like:
          set viminfo+=n~/.shada
        endif

"}}}

" Open .vimrc easily    {{{

        " I'm not using "command" because it need a upper case letter 
        cabbrev vrc e ~/dotfiles/.vimrc
        " Visual Split
        cabbrev vvrc vsp ~/dotfiles/.vimrc
        " In a new tab
        cabbrev tvrc tabnew ~/dotfiles/.vimrc

"}}}

" PLUGINS   {{{

" Vim-plug initialization   {{{

" Avoid modify this section, unless you are very sure of what you are doing
        let vim_plug_just_installed = 0
        let vim_plug_path = expand('~/.vim/autoload/plug.vim')
        if !filereadable(vim_plug_path)
            echo "Installing Vim-plug..."
            echo ""
            silent !mkdir -p ~/.vim/autoload
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            let vim_plug_just_installed = 1
        endif

        " manually load vim-plug the first time
        if vim_plug_just_installed
            :execute 'source '.fnameescape(vim_plug_path)
        endif

        "}}}

call plug#begin('~/.vim/plugged')

" Gruvbox colorscheme
    Plug 'morhetz/gruvbox'

" Easily interact with tmux from vim.
    Plug 'benmills/vimux'

" Navigate between tmux's panes
    Plug 'christoomey/vim-tmux-navigator'

" FZF
    Plug '~/.fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

" Vim Rooter
    Plug 'airblade/vim-rooter'

" Vim Grepper
    Plug 'mhinz/vim-grepper'

" Folding
    Plug 'pseewald/vim-anyfold'

" CSV
    Plug 'chrisbra/csv.vim'

" Synsc bottom bar of vim and tmux
    Plug 'edkolev/tmuxline.vim'

" Vim-Smile
    Plug 'jpalardy/vim-slime'

" Asynchronous Lint Engine
    Plug 'dense-analysis/ale'

" SQL Syntax
    Plug 'shmup/vim-sql-syntax'

" Emmet
    Plug 'mattn/emmet-vim'

" Deoplete ------------------------------{{{

    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      let g:deoplete#enable_at_startup = 1

    " Comrade InteliJ
      Plug 'beeender/Comrade'

    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif

"}}}

" Asynchronous completion for C and C++ 
    Plug 'zchee/deoplete-clang'

" VimRubySupport
    Plug 'vim-ruby/vim-ruby'

" Java-completion
    " Plug 'artur-shaik/vim-javacomplete2'

" DilemtMate
    Plug 'Raimondi/delimitMate'

" lh-cpp
    " Plug 'LucHermitte/lh-cpp'

" Python syntax for colorschemes
    Plug 'kh3phr3n/python-syntax'

"Python Mode
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Override configs by directory 
    Plug 'arielrossanigo/dir-configs-override.vim'

" VimMotions
    Plug 'easymotion/vim-easymotion'

" Better file browser
    Plug 'scrooloose/nerdtree'

" Instant Markdown
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Vim Markdown
    Plug 'tpope/vim-markdown'

" Code commenter
    Plug 'scrooloose/nerdcommenter'

" Class/module browser
    Plug 'majutsushi/tagbar'

" Code and files fuzzy finder
    Plug 'ctrlpvim/ctrlp.vim'

" Extension to ctrlp, for fuzzy command finder
    Plug 'fisadev/vim-ctrlp-cmdpalette'

" DevIcons
    " Plug 'ryanoasis/vim-devicons'

 " Goyo - White RoomVim Room
    Plug 'junegunn/goyo.vim'

" Git integration
    "Plug 'motemen/git-vim'

" Tab list panel
    Plug 'kien/tabman.vim'

" Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

" Terminal Vim with 256 colors colorscheme
    Plug 'fisadev/fisa-vim-colorscheme'
    Plug 'Reewr/vim-monokai-phoenix'
    Plug 'benjaminwhite/Benokai'
    Plug 'ErichDonGubler/vim-sublime-monokai'

" Consoles as buffers
    Plug 'rosenfeld/conque-term'

" Pending tasks list
    "Plug 'fisadev/FixedTaskList.vim'

" Vim Repeat
    Plug 'tpope/vim-repeat'

" Fugitive
    Plug 'tpope/vim-fugitive'

" Unimparied
    Plug 'tpope/vim-unimpaired'

" Surround
    Plug 'tpope/vim-surround'

" Commentary
    Plug 'tpope/vim-commentary'

" Autoclose
    Plug 'Townk/vim-autoclose'

" Indent text object
    Plug 'michaeljsmith/vim-indent-object'

" Indentation based movements
    Plug 'jeetsukumaran/vim-indentwise'

" vim-easy-align
    Plug 'junegunn/vim-easy-align'

" Python autocompletion, go to definition.
    Plug 'davidhalter/jedi-vim'

" COC autocompletion
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Better autocompletion
    Plug 'Shougo/neocomplcache.vim'

" Snippets manager (SnipMate), dependencies, and snippets repo
    Plug 'SirVer/ultisnips'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'honza/vim-snippets'
    Plug 'garbas/vim-snipmate'

" Git/mercurial/others diff icons on the side of the file lines
    Plug 'mhinz/vim-signify'

" Automatically sort python imports
    Plug 'fisadev/vim-isort'

" Highlight yanked area
    Plug 'machakann/vim-highlightedyank'

" Drag visual blocks arround
    Plug 'fisadev/dragvisuals.vim'

" Window chooser
    Plug 't9md/vim-choosewin'

" Python and other languages code checker
    Plug 'scrooloose/syntastic'

" Paint css colors with the real color
    Plug 'lilydjwg/colorizer'

if has('python')
    " YAPF formatter for Python
    Plug 'pignacio/vim-yapf-format'
endif

" Search results counter
    Plug 'vim-scripts/IndexedSearch'

" XML/HTML tags navigation
    Plug 'vim-scripts/matchit.zip'

" Gvim colorscheme
    Plug 'vim-scripts/Wombat'

" Peekaboo
    Plug 'junegunn/vim-peekaboo'

" Yank history navigation
    "Plug 'vim-scripts/YankRing.vim'

call plug#end()

"}}}

" Vim settings  {{{

        let mapleader=" "
        set autoread        		   " Auto reload changed files
        set lazyredraw                 " Reduce the redraw frequency
        set ttyfast                    " Send more characters in fast terminals
        set nowrap                     " Don't wrap long lines
        set listchars=extends:→        " Show arrow if line continues rightwards
        set listchars+=precedes:←      " Show arrow if line continues leftwards
        set laststatus=2               " Always display the status line
        set ruler                      " show the cursor position all the time
        set number
        set nocompatible
        set ignorecase
        set smartcase
        "set winwidth=90
        set autochdir
        " Background   {{{
        " if (&term == "pcterm" || &term == "win32")         
        "     set term=xterm 
        "     set t_Co=256         
        "     let &t_AB="\e[48;5;%dm"         
        "     let &t_AF="\e[38;5;%dm"         
        "     set termencoding=utf8         
        "     set nocompatible         
        "     inoremap <Char-0x07F> <BS>         
        "     nnoremap <Char-0x07F> <BS> 
        " endif
        set background=dark
        " Set background trasparency
        " hi Normal guibg=NONE ctermbg=NONE

"}}}
        " Showcase comments in italics
        highlight Comment cterm=italic gui=italic
        " Not display a ~ for blank lines
        autocmd VimEnter * highlight EndOfBuffer ctermfg=bg ctermbg=bg

        " always show status bar
        set ls=2
        " Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
        set splitbelow splitright
        " Enable autocompletion preview window
        set completeopt-=preview
        " When scrolling, keep cursor 8 lines away from screen border
        set scrolloff=8
        " Save as sudo
        ca w!! w !sudo tee "%"
        " Autocompletion of files and commands behaves like shell
        set wildmode=list:longest

        " Make it obvious where 80 characters is
        set textwidth=80
        set colorcolumn=+1

        syntax on

        " allow plugins by file type (required for plugins!)
        filetype on
        filetype plugin on
        filetype indent on
        
        "autocmd FileType sql colorscheme monokai-phoenix
        autocmd FileType sql setlocal tw=110

        set directory=~/.vim/dirs/tmp     " directory to place swap files in
        set backup                        " make backup files
        set backupdir=~/.vim/dirs/backups " where to put backup files
        set undofile                      " persistent undos - undo after you re-open the file
        set undodir=~/.vim/dirs/undos
        set viminfo+=n~/.vim/dirs/viminfo
        set noswapfile

        " Create needed directories if they don't exist   {{{

        if !isdirectory(&backupdir)
            call mkdir(&backupdir, "p")
        endif
        if !isdirectory(&directory)
            call mkdir(&directory, "p")
        endif
        if !isdirectory(&undodir)
            call mkdir(&undodir, "p")
        endif

"}}}

"}}}

" Tab and spaces   {{{

    " tabs and spaces handling
        set expandtab
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4

    " tab length exceptions on some file types
        autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
        autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
        autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

"}}}

" Mappings   {{{

" Copy and paste between different tmux panes   {{{

        " copy to buffer
        vmap ´ty :w! ~/.vim/.vimbuffer<CR>
        " cut to buffer
        vmap ´td :w! ~/.vim/.vimbuffer<CR> <Bar> :normal! gvdd<CR>
        " paste from buffer
        map ´tp :r ~/.vim/.vimbuffer<CR>

"}}}

" Disable arrow keys   {{{

        no <up> <Nop>
        no <down> <Nop>
        no <left> <Nop>
        no <right> <Nop>

        ino <up> <Nop>
        ino <down> <Nop>
        ino <left> <Nop>
        ino <right> <Nop>

"}}}

" Smile   {{{

        map <Leader><Leader>t <C-C><C-C>

"}}}

" Find/replace   {{{

        vnoremap ,r "hy:%s/<C-r>h//g<left><left>

"}}}

" Moving to the end and the begin of line easily   {{{

        map <Leader>h ^
        map <Leader>l $

"}}}

" Files {{{

        inoremap <leader>w <Esc>:w<CR>
        nnoremap <leader>w :w<CR>
        inoremap <leader>x <ESC>:x<CR>
        nnoremap <leader>x :x<CR>

"}}}

" Buffers   {{{

        inoremap <leader>q <ESC>:q<CR>
        nnoremap <leader>q :q<CR>

        nmap <Leader>bl :bn<CR>
        nmap <Leader>bh :bp<CR>

"}}}

" Tabs   {{{

        nmap <Leader>tl :tabnext<CR>
        nmap <Leader>th :tabprevious<CR>

"}}}

" Resize splits more quickly   {{{

        nmap <C-S-Right> <C-w>>
        nmap <C-S-Left> <C-w><

"}}}

" Keep the cursor on the center of the screen   {{{

        nnoremap <leader>zz :call VCenterCursor()<CR>

"}}}

" Vimux Shortcuts   {{{

        map rt :VimuxPromptCommand<CR>
        map tt :VimuxRunLastCommand<CR>

"}}}

" Fugitive   {{{

        noremap <Leader>gs :vertical Gstatus<CR>
        noremap <Leader>ga :Gwrite<CR>
        noremap <Leader>gc :Gco<CR>
        noremap <Leader>gm :Gmerge<CR>

"}}}

" Emmet   {{{

        let g:user_emmet_mode='nv' 
        let g:user_emmet_leader_key=',e'

"}}}

" Nerd Commenter   {{{

        "nmap <Leader>c <plug>NERDCommenterCommen 
        "nmap <Leader>c<Leader> gcc

"}}}

" TMUX - navigate windows with meta+arrows   {{{

        map <M-Right> <c-w>l
        map <M-Left> <c-w>h
        map <M-Up> <c-w>k
        map <M-Down> <c-w>j
        imap <M-Right> <ESC><c-w>l
        imap <M-Left> <ESC><c-w>h
        imap <M-Up> <ESC><c-w>k
        imap <M-Down> <ESC><c-w>j

"}}}

" show pending tasks list   {{{

        "map <F2> :TaskList<CR>

"}}}

" FZF ------------------------------{{{

        map <Leader>ff :Files<CR>
        map <Leader>fg :GFiles<CR>
        map <leader>fw :Windows<CR>
        map <leader>fbb :Buffers<CR>

        map <Leader>fl :Lines<CR>
        map <Leader>fbl :BLines<CR>
        map <Leader>fs :Snippets<CR>
        "nnoremap <leader>fg :Rg<CR>

        noremap <Leader>gl :Commits<CR>

"}}}

" CtrlP   {{{


" file finder mapping
        "let g:ctrlp_map = ',e'
" " tags (symbols) in current file finder mapping
"         nmap ,g :CtrlPBufTag<CR>
" " tags (symbols) in all files finder mapping
"         nmap ,G :CtrlPBufTagAll<CR>
" " general code finder in all files mapping
"         nmap ,f :CtrlPLine<CR>
" " recent files finder mapping
"         nmap ,m :CtrlPMRUFiles<CR>
" " commands finder mapping
"         nmap ,c :CtrlPCmdPalette<CR>
" " to be able to call CtrlP with default search text
"         function! CtrlPWithSearchText(search_text, ctrlp_command_end)
"             execute ':CtrlP' . a:ctrlp_command_end
"             call feedkeys(a:search_text)
"         endfunction
" " same as previous mappings, but calling with current word as default text
"         nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
"         nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
"         nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
"         nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
"         nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
"         nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
"         nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" " don't change working directory
"         let g:ctrlp_working_path_mode = 0
" " ignore these files and folders on file finder
"         let g:ctrlp_custom_ignore = {
"           \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
"           \ 'file': '\.pyc$\|\.pyo$',
"           \ }

"}}}

" Signify   {{{

    " mappings to jump to changed blocks
        nmap <leader>sn <plug>(signify-next-hunk)
        nmap <leader>sp <plug>(signify-prev-hunk)

"}}}

" Easy Align   {{{

    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

"}}}

" Window Chooser   {{{

        nmap  -  <Plug>(choosewin)

"}}}

" Airline   {{{

        nmap <Leader>tb :call ToggleTablineMode()<CR>

"}}}

"}}}

" Plugins Settings   {{{

" Syntastic ------------------------------{{{

" show list of errors and warnings on the current file
        " nmap <leader>e :Errors<CR>
" check also when just opened the file
        let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
        let g:syntastic_enable_signs = 0
" " custom icons (enable them if you use a patched font, and enable the previous setting)
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_warning_symbol = '⚠'
        let g:syntastic_style_error_symbol = '✗'
        let g:syntastic_style_warning_symbol = '⚠'

"}}}

" NeoComplCache ------------------------------{{{

        let g:highlightedyank_highlight_duration = 500

"}}}

" NeoComplCache ------------------------------{{{

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_ignore_case = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_auto_select = 1
        let g:neocomplcache_enable_fuzzy_completion = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_fuzzy_completion_start_length = 1
        let g:neocomplcache_auto_completion_start_length = 1
        let g:neocomplcache_manual_completion_start_length = 1
        let g:neocomplcache_min_keyword_length = 1
        let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
        let g:neocomplcache_same_filetype_lists = {}
        let g:neocomplcache_same_filetype_lists._ = '_'

"}}}

" Peekaboo ------------------------------{{{

        let g:peekaboo_compact=1
        let g:peekaboo_window="vert bo 70new"

"}}}

" Autoclose ------------------------------{{{

        " Fix to let ESC work as espected with Autoclose plugin
        let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

"}}}

" FZF ------------------------------{{{

        let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline --bind ctrl-a:select-all'
        "let $FZF_DEFAULT_COMMAND="rg --files --hidden"

        let g:fzf_buffers_jump = 1

        "Customize fzf colors to match your color scheme
        let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
          \ 'bg':      ['bg', 'Normal'],
          \ 'hl':      ['fg', 'Comment'],
          \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
          \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
          \ 'hl+':     ['fg', 'Statement'],
          \ 'info':    ['fg', 'PreProc'],
          \ 'border':  ['fg', 'Ignore'],
          \ 'prompt':  ['fg', 'Conditional'],
          \ 'pointer': ['fg', 'Exception'],
          \ 'marker':  ['fg', 'Keyword'],
          \ 'spinner': ['fg', 'Label'],
          \ 'header':  ['fg', 'Comment'] }

        let g:fzf_action = {
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-x': 'split',
          \ 'ctrl-v': 'vsplit',
          \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

        " Get Files
        command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


        " Get text in files with Rg
        command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview(), <bang>0)

"}}}

" Smile  ------------------------------{{{

        let g:slime_target = "tmux"
        let g:slime_paste_file = "$HOME/.slime_paste"
        let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

"}}}

" Rooter  ------------------------------{{{

        let g:rooter_manual_only = 1

"}}}

" Goyo  ------------------------------{{{

        let g:goyo_width = 100
        let g:goyo_height = 100
        nmap <Leader>gy :Goyo<CR>
        " set goyo_width=100%

        function! s:goyo_enter()
            " Disable automatic toggling between line number modes
                    :augroup numbertoggle
                    :  autocmd!
                    :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
                    :augroup END
        endfunction

        function! s:goyo_leave()
            " Automatic toggling between line number modes
                    :augroup numbertoggle
                    :  autocmd!
                    :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
                    :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
                    :augroup END
        endfunction

        autocmd! User GoyoEnter nested call <SID>goyo_enter()
        autocmd! User GoyoLeave nested call <SID>goyo_leave()

"}}}

" DragVisuals ------------------------------{{{

" mappings to move blocks in 4 directions
        vmap <expr> <S-M-LEFT> DVB_Drag('left')
        vmap <expr> <S-M-RIGHT> DVB_Drag('right')
        vmap <expr> <S-M-DOWN> DVB_Drag('down')
        vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
        vmap <expr> D DVB_Duplicate()

"}}}

" Signify ------------------------------{{{

        " this first setting decides in which order try to guess your current vcs
        let g:signify_vcs_list = [ 'git', 'hg' ]
        cabbrev sgt SignifyToggle 
        " nicer colors   {{{
        highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
        highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
        highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
        highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
        highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
        highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

"}}}
"}}}

" Window Chooser ------------------------------{{{

    " show big letters
        let g:choosewin_overlay_enable = 0
        let g:choosewin_statusline_replace = 0

"}}}

" Airline ------------------------------{{{

        let g:airline_powerline_fonts = 1
        let g:airline_theme = 'luna'
        let g:airline#extensions#whitespace#enabled = 0

        " TabLine{{{
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_splits = 0
        let g:airline#extensions#tabline#show_tab_count = 0
        let g:airline#extensions#tabline#show_tab_nr = 0
        let g:airline#extensions#tabline#show_tab_type = 0
        let g:airline#extensions#tabline#close_symbol = '×'
        let g:airline#extensions#tabline#show_close_button = 1

        " Toggle TabLine Mode{{{
        let g:airline#extensions#tabline#show_buffers = 1

        function! ToggleTablineMode()
            if g:airline#extensions#tabline#show_buffers
                let g:airline#extensions#tabline#show_buffers = 0
                let g:airline#extensions#tabline#show_tabs = 1
            else
                let g:airline#extensions#tabline#show_buffers = 1
                let g:airline#extensions#tabline#show_tabs = 0
            endif
            :redrawtabline
        endfunction

"}}}
"}}}

"}}}

" Jedi ------------------------------{{{

" Jedi completion is too slow
        let g:jedi#completions_enabled = 0

"}}}

" Pymode ------------------------------{{{

        let g:pymode_run = 1
        " Python Highlight
        let python_highlight_all = 1
        let python_self_cls_highlight = 1
        let g:pymode_python = 'python3'

"}}}

" Vim Easy Motion  ------------------------------{{{

        nmap S <Plug>(easymotion-s2)
        map \ <Plug>(easymotion-prefix)
        let g:EasyMotion_smartcase = 1
        let g:EasyMotion_do_shade = 0
        let g:EasyMotion_enter_jump_first = 1

"}}}

" Ale  ------------------------------{{{

" Shorten error/warning flags
        let g:ale_echo_msg_error_str = 'E'
        let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings 
        let g:ale_sign_error = '✘✘'
        let g:ale_sign_warning = '⚠'

" Disable or enable loclist at the bottom of vim 
        let g:ale_open_list = 0
        let g:ale_loclist = 0

" Setup compilers for languages
        let g:ale_linters = {
              \  'cs':['syntax', 'semantic', 'issues'],
              \  'java': ['javac']
              \ }
" Repairing cursor disappears when viewing error message
        let g:ale_echo_cursor = 0

"}}}

" Deoplete ------------------------------{{{

" Setup completion sources
        let g:deoplete#sources = {}
        let g:deoplete#sources.java = ['jc', 'file', 'buffer', 'ultisnips']
        let g:deoplete#complete_method = "omnifunc"
        let g:deoplete#auto_complete_delay=50

"}}}

" UltiSnips ----------------------------- {{{

        let g:UltiSnipsEditSplit="vertical"

"}}}

" Instant Markdown ----------------------------- {{{

        " let g:instant_markdown_browser = "vivaldi --new-window"
        autocmd BufRead,BufReadPost *.md set filetype=markdown
        " let g:instant_markdown_autostart = 0
        " let g:instant_markdown_port = 8888
        " source $HOME/.vim/ftplugin/markdown/instant-markdown.vim

"}}}

" Tagbar ----------------------------- {{{

" toggle tagbar display
        map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
        let g:tagbar_autofocus = 1

"}}}

" NERDTree ----------------------------- {{{

" toggle nerdtree display
        map <leader>n :NERDTreeToggle<CR>

        let g:NERDTreeWinPos = "right"
        let NERDTreeQuitOnOpen = 1
        let NERDTreeShowHidden = 1
        let g:NERDTreeWinSize = 60
        let g:NERDTreeChDirMode = 2
        let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

        autocmd BufWritePost * NERDTreeRefreshRoot

 " Disable numbers in the pane
        autocmd FileType nerdtree set norelativenumber

"}}}

"}}}

" Get rid of that delay using <space> in insert mode    {{{

        augroup FastEscape
            autocmd!
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=1000
        augroup END

"}}}

" Close all background buffers  {{{

        function! CloseHiddenBuffers()
            let visible = {}
            for t in range(1, tabpagenr('$'))
                for b in tabpagebuflist(t)
                    let visible[b] = 1
                endfor
            endfor

            for b in range(1, bufnr('$'))
                if bufexists(b) && !has_key(visible, b)
                    execute 'bwipeout' b
                endif
            endfor
        endfunction

"}}}

" Search   {{{

    " incremental search
        set incsearch

    " highlighted search results
        set hlsearch  

    " Unhighlight after the search is done
        nnoremap <CR> :nohlsearch<CR>

"}}}

" Automatic toggling between line number modes   {{{

        :augroup numbertoggle
        :  autocmd!
        :  autocmd BufEnter,FocusGained,InsertLeave,CmdlineLeave * set relativenumber
        :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
        :augroup END

        "nnoremap : :set norelativenumber <Bar> redraw <CR>:

        " Makes the Yanktobuffer function redraw the line number often
        "augroup cmdline_numbertoggle
            "au!
            "au CmdlineLeave : setlocal relativenumber
            "au CmdlineEnter : setlocal norelativenumber | redraw
        "augroup END

"}}}

" YankToBuffer   {{{

        function YankToBuffer()
            let currentdir = getcwd()
            silent cd ~/.vim/
            call writefile(split(@@, "\n"), '.vimbuffer')
            silent exe 'cd' currentdir
        endfunction

        autocmd! TextYankPost * call YankToBuffer()
            
"}}}

" Keep the cursor centered vertically on the screen   {{{

        let s:is_centered = 0

        function! VCenterCursor()
            if s:is_centered
                unmap j
                unmap k
                let s:is_centered = 0
            else
                nnoremap j jzz
                nnoremap k kzz
                let s:is_centered = 1
            endif
        endfunction

"}}}

" Zoom / Restore window.   {{{

        function! s:ZoomToggle() abort
            if exists('t:zoomed') && t:zoomed
                execute t:zoom_winrestcmd
                let t:zoomed = 0
            else
                let t:zoom_winrestcmd = winrestcmd()
                resize
                vertical resize
                let t:zoomed = 1
            endif
        endfunction
        command! ZoomToggle call s:ZoomToggle()
        nnoremap <silent> ,zz :ZoomToggle<CR>

"}}}

" WhiteRom  ------------------------------{{{

        function! WriteRoomToggle()
          let l:name = '_writeroom_'
          set noequalalways
          if bufwinnr(l:name) > 0
            wincmd o
          else
            let l:width = (&columns - &textwidth) / 3

            execute 
                \ 'topleft' l:width . 
                \ 'vsplit +setlocal\ nobuflisted' l:name | 
                \ wincmd p

            hi VertSplit guifg=bg guibg=NONE gui=NONE
            endif
        endfunction

        " toggle writeroom on/off
        map <silent><Leader>gg :call WriteRoomToggle()<CR>

"}}}

" Use 256 colors when possible   {{{

        if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
            let &t_Co = 256
            " colorscheme monokai-phoenix
            let g:gruvbox_guisp_fallback = "bg"
            colorscheme gruvbox

        else
            colorscheme delek
        endif

        set termguicolors
        set t_Co=256
        " let g:sublimemonokai_term_italic = 1

"}}}

" Folding   {{{

        " Any Fold   {{{
        let g:anyfold_identify_comments=2
        let g:anyfold_fold_comments=1
        cabbrev fd AnyFoldActivate 

        "}}}

        " Section Folding {{{

        set foldenable
        set foldlevelstart=10
        set foldnestmax=10
        set foldmethod=syntax

        " }}}

"}}}

" vim:foldmethod=marker
