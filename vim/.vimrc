" Author: Chen Hua Wei
" ===========================================================================
" Vim-plug initialization

set encoding=utf-8
set clipboard=unnamed
set shortmess+=c 
set mouse=a
set backspace=indent,eol,start
set guifont=Noto\ Mono\ for\ Powerline:h12
" Highlight the cursor
set cursorcolumn
set cursorline
colorscheme vividchalk
" Set search Option
set ignorecase
set smartcase
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

" Set Gui fonts. Need install powerline fonts
" link: https://github.com/powerline/fonts
" set guifont=Noto\ Mono\ for\ Powerline:h12


" save as sudo
ca w!! w !sudo tee "%"
if has("gui_running")
    syntax on
    set hlsearch
    colorscheme vividchalk
    set bs=2
    set ai
    set ruler
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" Too hex Code 
nmap ,h :%! xxd <CR>
nmap ,n :%! xxd -r <CR>

" ============================================================================
autocmd VimEnter set shortmess-=c
autocmd BufWritePost $MYVIMRC source $MYVIMRC
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" ============================================================================
" Load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif


" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')
" theme
Plug 'tpope/vim-vividchalk'
" Ctags
Plug 'vim-scripts/taglist.vim'
" Plugins from github repos:
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'
" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Task List
Plug 'vim-scripts/TaskList.vim'
" vim go
Plug 'fatih/vim-go'
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
" Surround
Plug 'tpope/vim-surround'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Python autocompletion, go to definition.
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips'
" Snippets manager (SnipMate), dependencies, and snippets repo
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
" gitgutter
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" csv.vim
Plug 'chrisbra/csv.vim'
" Folder
Plug 'tmhedberg/SimpylFold'
" vim pep8
Plug 'tell-k/vim-autopep8'
" css highlight
Plug 'hail2u/vim-css3-syntax'
" css color visualization
Plug 'ap/vim-css-color'
" js highlight
Plug 'pangloss/vim-javascript'
" html5 complete
Plug 'othree/html5.vim'
" auto pairs
Plug 'jiangmiao/auto-pairs'
" auto complete
Plug 'Valloric/YouCompleteMe'
"   
Plug 'plytophogy/vim-virtualenv'
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
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
" Arduino Syntax
Plug 'sudar/vim-arduino-syntax'
" Platformio Support
Plug 'coddingtonbear/neomake-platformio'
" Tell vim-plug we finished declaring plugins, so it can load them
Plug 'tweekmonster/django-plus.vim'
" add words to fill the space 
Plug 'vim-scripts/loremipsum'
" With bufexplorer, you can quickly and easily switch between buffers by using
" the one of the default public interfaces: 
Plug 'jlanzarotta/bufexplorer'

" The Most Recently Used (MRU) plugin provides an easy access to a list of 
" recently opened/edited files in Vim. This plugin automatically stores the 
" file names as you open/edit them in Vim.
Plug 'yegappan/mru'

call plug#end()


" ============================================================================
" Install plugins when run vim the first time

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif



" ============================================================================
" Auto add head info in .py file
function! HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()


" ============================================================================
" Js highlight
let javascript_enable_domhtmlcss = 1


" ============================================================================
" Taglist
" Taglist on right
let Tlist_Use_Right_Window=1
" Taglist close if is its windows is the last
let Tlist_Exit_OnlyWindow=1
" Taglist menu show
" let Tlist_Show_Menu=1
" Taglist auto start
" let Tlist_Auto_Open=1
let Tlist_WinWidth = 16
" no vi-compatible
set nocompatible


" ============================================================================
" Git gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
set updatetime=250



" ============================================================================
" Allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
" allow intent guide in startup
let g:indent_guides_enable_on_vim_startup=1
" display in second floor
let g:indent_guides_start_level=2
" indent size
let g:indent_guides_guide_size=1
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd   FileType   html            setlocal   shiftwidth=4 tabstop=4 softtabstop=4
autocmd   FileType   htmldjango      setlocal   shiftwidth=4 tabstop=4 softtabstop=4
autocmd   FileType   javascript      setlocal   shiftwidth=4 tabstop=4 softtabstop=4
autocmd   FileType   xml             setlocal   omnifunc=xmlcomplete#CompleteTags


" ============================================================================
" NerdTree
" auto start NerdTree
" autocmd VimEnter * NERDTree
" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>
let NERDSpaceDelims=1
" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>



" ============================================================================
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
"set wildmode=list:longest


" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.
" Run Python

autocmd BufRead *.py nmap <F8> :w <Esc> G:r!python3 %<CR>`.
autocmd filetype c nnoremap <F8> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F8> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd BufRead *.py nnoremap <buffer> <F9> :w <CR> :exec '!python3' shellescape(@%, 1)<CR>
autocmd BufRead *.py nnoremap <buffer> <F10> :w <CR> :exec '!python3 -m pdb' shellescape(@%, 1)<CR>
" AutoFormat
noremap <F6> :Autoformat<CR>


" ============================================================================
" Tagbar -----------------------------
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
" ============================================================================
" NERDTree -----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" ============================================================================
" Tasklist

" show pending tasks list
map <F2> :TaskList<CR>


" ============================================================================
" CtrlP

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :Ag<CR>
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

" ============================================================================
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
            \ 'file': '\.pyc$\|\.pyo$',
            \ }


" ============================================================================
" Syntastic

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous
" setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ============================================================================
" Jedi-vim

" All these mappings work only for python code:
" Go to definition
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

let g:jedi#popup_select_first=0
set completeopt=longest,menuone
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0

" ============================================================================
" Emmet ---
let g:user_emmet_settings = {
            \  'indentation' : '  ',
            \  'perl' : {
            \    'aliases' : {
            \      'req' : 'require '
            \    },
            \    'snippets' : {
            \      'use' : "use strict\nuse warnings\n\n",
            \      'warn' : "warn \"|\";",
            \    }
            \  }
            \}

let g:user_emmet_expandabbr_key = '<c-e>'

let g:use_emmet_complete_tag = 1


" ============================================================================
" Autoclose

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}



" ============================================================================
" DragVisuals -
" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()



" ============================================================================
" Signify

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)


nmap <leader>sp <plug>(signify-prev-hunk)

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1



" ============================================================================
" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

nnoremap <C-I> :bn<CR>


" ============================================================================
" YouCompleteMe
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F7> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
nnoremap <leader>lo :lopen<CR>  "open locationlist
nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'nerdtree' : 1,
            \}
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsListSnippets="<c-e>"
" let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]
" ret g:ycm_python_binary_path = 'python3'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" ============================================================================
" Vim go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" let g:go_fmt_command = "goimports"


" ============================================================================
" bufExplorer plugin
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
nmap ,b :BufExplorer<cr>

" ============================================================================

" ============================================================================
" MRU 
let MRU_Max_Entries = 400
map ,rf :MRU<CR>
" ============================================================================
" Confortable motion
" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" ============================================================================
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
