call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'neovimhaskell/haskell-vim'
Plug 'lervag/vimtex'
Plug 'nelstrom/vim-markdown-folding'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/indentpython.vim'
Plug 'edkolev/tmuxline.vim'

function! DoRemote(arg)
    " UpdateRemotePlugins
endfunction

call plug#end()

" general
set mouse=a
set clipboard=unnamed

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

let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

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



" saves cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


" git
set updatetime=250

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
"let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
"let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
"let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
"let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
"let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
"let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
"let g:haskell_indent_if = 3
"let g:haskell_indent_let = 4
"let g:haskell_indent_case = 2
"let g:haskell_indent_where = 6
"let g:haskell_indent_before_where = 2
"let g:haskell_indent_after_bare_where = 2
"let g:haskell_indent_do = 3
"let g:haskell_indent_in = 1
"let g:haskell_indent_guard = 2
"let g:cabal_indent_section = 2
"let g:cabal_indent_section = 2


" auto save folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 



" markdown - must come as the very least settings in here
set nocompatible
if has("autocmd")
    filetype plugin indent on
endif
