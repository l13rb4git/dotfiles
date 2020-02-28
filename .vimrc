" Fisa-vim-config
" http://fisadev.github.io/fisa-vim-config/

" ============================================================================
"Vim-plug initialization
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


" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)


" Open .vimrc easily 
        cabbrev vrc e ~/.vimrc
        " Visual Split
        cabbrev vvrc vsp ~/.vimrc


" E576: Failed to parse ShaDa file
        if !has('nvim')
          set viminfo+=n~/vim/viminfo
        else
          " Do nothing here to use the neovim default
          " or do soemething like:
          set viminfo+=n~/.shada
        endif

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')

" Easily interact with tmux from vim.
    Plug 'benmills/vimux'

" Navigate between tmux's panes
    Plug 'christoomey/vim-tmux-navigator'

" Folding
    Plug 'pseewald/vim-anyfold'

" Synsc bottom bar of vim and tmux
    Plug 'edkolev/tmuxline.vim'

" Asynchronous Lint Engine
    Plug 'dense-analysis/ale'

" Deoplete ------------------------------
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

" Asynchronous completion for C and C++ 
    Plug 'zchee/deoplete-clang'

" Java-completion
    " Plug 'artur-shaik/vim-javacomplete2'

" DilemtMate
    Plug 'Raimondi/delimitMate'

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

" Code commenter
    Plug 'scrooloose/nerdcommenter'

" Class/module browser
    Plug 'majutsushi/tagbar'

" Code and files fuzzy finder
    Plug 'ctrlpvim/ctrlp.vim'

" Extension to ctrlp, for fuzzy command finder
    Plug 'fisadev/vim-ctrlp-cmdpalette'

 " Goyo - White RoomVim Room
    Plug 'junegunn/goyo.vim'

" Zen coding
    Plug 'mattn/emmet-vim'

" Git integration
    Plug 'motemen/git-vim'

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
    Plug 'fisadev/FixedTaskList.vim'

" Vim Repeat
    Plug 'tpope/vim-repeat'

" Fugitve
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
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative 
" numbering every time you go to normal mode. Author refuses to add a setting 
" to avoid that)
" Plug 'myusuf3/numbers.vim'

" Plugins from vim-scripts repos:

" Search results counter
    Plug 'vim-scripts/IndexedSearch'

" XML/HTML tags navigation
    Plug 'vim-scripts/matchit.zip'

" Gvim colorscheme
    Plug 'vim-scripts/Wombat'

" Yank history navigation
    Plug 'vim-scripts/YankRing.vim'


" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif



" ============================================================================
" Vim settings and mappings
        set autoread        		   " Auto reload changed files
        set lazyredraw                 " Reduce the redraw frequency
        set ttyfast                    " Send more characters in fast terminals
        set nowrap                     " Don't wrap long lines
        set listchars=extends:→        " Show arrow if line continues rightwards
        set listchars+=precedes:←      " Show arrow if line continues leftwards
        set laststatus=2               " Always display the status line
        set ruler                      " show the cursor position all the time
        let mapleader=" "


" Get rid of that delay using <space> in insert mode
        augroup FastEscape
            autocmd!
            au InsertEnter * set timeoutlen=0
            au InsertLeave * set timeoutlen=1000
        augroup END

" no vi-compatible
        set nocompatible

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
        set splitbelow splitright

" allow plugins by file type (required for plugins!)
        filetype plugin on
        filetype indent on

" tabs and spaces handling
        set expandtab
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4

" tab length exceptions on some file types
        autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
        autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
        autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" always show status bar
        set ls=2

" incremental search
        set incsearch

" highlighted search results
        set hlsearch  

" syntax highlight on
        syntax on

" show line numbers
        set nu
        " map rln :set relativenumber<CR>
        " map abn :set norelativenumber<CR>

    " Automatic toggling between line number modes
            :augroup numbertoggle
            :  autocmd!
            :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
            :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
            :augroup END

" Showcase comments in italics
        highlight Comment cterm=italic gui=italic

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
        set completeopt-=preview

" save as sudo
        ca w!! w !sudo tee "%"

" use 256 colors when possible
        if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
            let &t_Co = 256
            colorscheme monokai-phoenix

        else
            colorscheme delek
        endif

        set termguicolors
        set t_Co=256
        let g:sublimemonokai_term_italic = 1


" when scrolling, keep cursor 8 lines away from screen border
        set scrolloff=8

" Keep the cursor centered vertically on the screen
        if !exists('*VCenterCursor')
            augroup VCenterCursor
                au!
                au OptionSet *,*.*
                    \ if and( expand("<amatch>")=='scrolloff' ,
                    \         exists('#VCenterCursor#WinEnter,WinNew,VimResized') )|
                    \      au! VCenterCursor WinEnter,WinNew,VimResized|
                    \ endif
                augroup END

                function VCenterCursor()
                    if !exists('#VCenterCursor#WinEnter,WinNew,VimResized')
                        let s:default_scrolloff=&scrolloff
                        let &scrolloff=winheight(win_getid())/2
                        au VCenterCursor WinEnter,WinNew,VimResized *,*.*
                            \ let &scrolloff=winheight(win_getid())/2
                        else
                        au! VCenterCursor WinEnter,WinNew,VimResized
                        let &scrolloff=s:default_scrolloff
                    endif
                endfunction
            endif

        nnoremap <leader>zz :call VCenterCursor()<CR>

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
        set wildmode=list:longest

" Make it obvious where 80 characters is
        set textwidth=80
        set colorcolumn=+1

" better backup, swap and undos storage
        set directory=~/.vim/dirs/tmp     " directory to place swap files in
        set backup                        " make backup files
        set backupdir=~/.vim/dirs/backups " where to put backup files
        set undofile                      " persistent undos - undo after you re-open the file
        set undodir=~/.vim/dirs/undos
        set viminfo+=n~/.vim/dirs/viminfo

" store yankring history file there too
        let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
        if !isdirectory(&backupdir)
            call mkdir(&backupdir, "p")
        endif
        if !isdirectory(&directory)
            call mkdir(&directory, "p")
        endif
        if !isdirectory(&undodir)
            call mkdir(&undodir, "p")
        endif


" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.
"
"
" Vim Motions  ------------------------------
        nmap S <Plug>(easymotion-s2)
        map \ <Plug>(easymotion-prefix)
        let g:EasyMotion_smartcase = 1

"
" DelimitMate  ------------------------------
        let delimitMate_expand_cr = 1

"
" Ale  ------------------------------
" Shorten error/warning flags
        let g:ale_echo_msg_error_str = 'E'
        let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings 
        let g:ale_sign_error = '✘✘'
        let g:ale_sign_warning = '⚠⚠'

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


" Deoplete ------------------------------
" Setup completion sources
        let g:deoplete#sources = {}
        let g:deoplete#sources.java = ['jc', 'file', 'buffer', 'ultisnips']
        let g:deoplete#complete_method = "omnifunc"
        let g:deoplete#auto_complete_delay=50


" UltiSnips ----------------------------- 
let g:UltiSnipsEditSplit="vertical"


" Tagbar ----------------------------- 

" toggle tagbar display
        map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
        let g:tagbar_autofocus = 1

" NERDTree ----------------------------- 
" toggle nerdtree display
        map <leader>n :NERDTreeToggle<CR>
        autocmd BufWritePost * NERDTreeRefreshRoot
        let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
 " Disable numbers in the pane
        autocmd FileType nerdtree set norelativenumber


" Find/replace
        vnoremap ,r "hy:%s/<C-r>h//g<left><left>

" Moving to the end and the begin of line easily
        map <Leader>h 0
        map <Leader>l $

" File, Buffers and Window Management 
        inoremap <leader>w <Esc>:w<CR>
        nnoremap <leader>w :w<CR>

        inoremap <leader>q <ESC>:q<CR>
        nnoremap <leader>q :q<CR>

        inoremap <leader>x <ESC>:x<CR>
        nnoremap <leader>x :x<CR>

        nnoremap <leader>v :vnew<CR>:NERDTreeToggle<CR>

        nmap ,n :bn<CR>
        nmap ,p :bp<CR>


" Vimux shortcuts
        map rt :VimuxPromptCommand<CR>
        map tt :VimuxRunLastCommand<CR>

" tab navigation mappings
        map <Leader>tn :tabn<CR>
        map <Leader>tp :tabp<CR>
        map <Leader>ts :tab split<CR>

" Resize splits more quickly
        nmap <C-S-Right> <C-w>>
        nmap <C-S-Left> <C-w><

" Insert Mode to Normal Mode (also write)
        " ino <S-Tab> <Esc>:w<CR>
        " map <S-Tab> :w<CR>

" tmux - navigate windows with meta+arrows
        map <M-Right> <c-w>l
        map <M-Left> <c-w>h
        map <M-Up> <c-w>k
        map <M-Down> <c-w>j
        imap <M-Right> <ESC><c-w>l
        imap <M-Left> <ESC><c-w>h
        imap <M-Up> <ESC><c-w>k
        imap <M-Down> <ESC><c-w>j


" Tasklist ------------------------------

" show pending tasks list
        map <F2> :TaskList<CR>

" CtrlP ------------------------------

" file finder mapping
        let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
        nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
        nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
        nmap ,f :CtrlPLine<CR>
" recent files finder mapping
        nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
        nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
        function! CtrlPWithSearchText(search_text, ctrlp_command_end)
            execute ':CtrlP' . a:ctrlp_command_end
            call feedkeys(a:search_text)
        endfunction
" same as previous mappings, but calling with current word as default text
        nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
        nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
        nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
        nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
        nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
        nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
        nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
        let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
          \ 'file': '\.pyc$\|\.pyo$',
          \ }


" Syntastic ------------------------------

" show list of errors and warnings on the current file
        " nmap <leader>e :Errors<CR>
" check also when just opened the file
        let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
        let g:syntastic_enable_signs = 0
" " custom icons (enable them if you use a patched font, and enable the previous 
" setting)
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_warning_symbol = '⚠'
        let g:syntastic_style_error_symbol = '✗'
        let g:syntastic_style_warning_symbol = '⚠'

" Jedi-vim ------------------------------
" All these mappings work only for python code:
" Go to definition
        let g:jedi#goto_command = ',d'
" Find ocurrences
        let g:jedi#usages_command = ',o'
" Find assignments
        let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
        nmap ,D :tab split<CR>:call jedi#goto()<CR>
" Remap goto documentation for using the Pymode option 
        let g:jedi#documentation_command = "KK"

" NeoComplCache ------------------------------

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

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Goyo  ------------------------------
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


" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
        vmap <expr> <S-M-LEFT> DVB_Drag('left')
        vmap <expr> <S-M-RIGHT> DVB_Drag('right')
        vmap <expr> <S-M-DOWN> DVB_Drag('down')
        vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
        vmap <expr> D DVB_Duplicate()
           
" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
        nmap <leader>sn <plug>(signify-next-hunk)
        nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
        highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
        highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
        highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
        highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
        highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
        highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------

" mapping
        nmap  -  <Plug>(choosewin)
" show big letters
        let g:choosewin_overlay_enable = 1

" Airline ------------------------------
" 
        let g:airline_powerline_fonts = 1
        let g:airline_theme = 'luna'
        let g:airline#extensions#whitespace#enabled = 0

" Disable arrow keys
        no <down> ddp
        no <up> ddkkp
        no <left> <Nop>
        no <right> <Nop>

        ino <up> <Nop>
        ino <down> <Nop>
        ino <left> <Nop>
        ino <right> <Nop>

" Set background trasparency
        hi Normal guibg=NONE ctermbg=NONE

" Python Highlight
        let python_highlight_all = 1
        let python_self_cls_highlight = 1
        let g:pymode_python = 'python3'

" Pymode ------------------------------
        let g:pymode_run = 1
" Mixing Vimux commands to improve workflow with python files.
        autocmd FileType python nmap ,t :call VimuxRunCommand("clear; python3 " . expand("%:p"))<CR>
        nmap gt :VimuxInspectRunner<CR>  

" Folding for vim
        let g:anyfold_identify_comments=2
        let g:anyfold_fold_comments=1
        cabbrev fd AnyFoldActivate 
