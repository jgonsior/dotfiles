call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'
Plug 'airblade/vim-gitgutter'
"Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'neovimhaskell/haskell-vim'
Plug 'lervag/vimtex'
Plug 'nelstrom/vim-markdown-folding'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/indentpython.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'sbdchd/neoformat'
Plug 'Shougo/denite.nvim'
Plug 'w0rp/ale'


call plug#end()

" general
set mouse=a
set clipboard=unnamed
set modeline
set 

" text editing
set linebreak
set encoding=utf-8


" tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4


" keybindings
let mapleader = "\<SPACE>"
let maplocalleader = "\-"

" appearance
" set termguicolors
set background=light
colorscheme solarized8_light
let g:solarized_termcolors=256


" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
let g:airline#extensions#ale#enabled = 1

syntax on
set number
set rnu " relative numbers
set showcmd
set showmatch
set showmode

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif


" search
set hlsearch
set ignorecase
set smartcase
set incsearch


"indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=white



" saves cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


" git
set updatetime=250

"ctrlp
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" simplyfold
let g:SimpylFold_docstring_preview = 1
set foldmethod=indent
set foldlevel=99
nnoremap <space> za



" deopolete
let g:deoplete#enable_at_startup = 1


" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


" latex
autocmd FileType tex setlocal spell spelllang=en,de
let g:tex_comment_nospell=1
let g:vimtex_view_method = 'zathura'


" python specific options
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
" autocmd FileType python set breakindentopt=shift:4
let python_highlight_all=1



" js development
let g:used_javascript_libs = 'angularjs, angularui, jquery'

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |


" js development
let g:used_javascript_libs = 'angularjs, angularui, jquery'

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |




" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_indent_if = 3
let g:haskell_indent_let = 4
let g:haskell_indent_case = 2
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:cabal_indent_section = 2
let g:cabal_indent_section = 2



" auto save folding -> not working?
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 



" ale
let g:ale_sign_column_always = 1
" let g:ale_completion_enabled = 1 currently only supported by tsserver…
let g:ale_java_checkstyle_options = '-c /home/monkey/shk/code/geosoft_checks.xml'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
            \    'java': ['checkstyle'],
            \}
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1



" neoformat
let g:neoformat_java_astyle2 = {
    \ 'exe': 'astyle',
    \ 'stdin': 1,
    \ 'args' : ['--mode=java', '--indent=spaces=2', '--style=kr'],
    \ 'no_append': 1,
    \}

augroup fmt
  autocmd!
  autocmd BufWritePre *.java undojoin | Neoformat astyle2
augroup END



" java
au BufNewFile,BufRead *.java
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |




" markdown - must come as the very least settings in here
set nocompatible
if has("autocmd")
    filetype plugin indent on
endif
