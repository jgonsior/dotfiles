call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
"Plug 'neovimhaskell/haskell-vim'
Plug 'lervag/vimtex'
Plug 'nelstrom/vim-markdown-folding'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/indentpython.vim'

function! DoRemote(arg)
    " UpdateRemotePlugins
endfunction

call plug#end()

" general
set mouse=a


" text editing
set linebreak
set encoding=utf-8


" tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4 " makes the spaces feel like real tabs


" keybindings
let mapleader = "\<SPACE>"
let maplocalleader = "\-"

" appearance
set termguicolors
set background=light
colorscheme solarized
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


" latex
autocmd FileType tex setlocal spell spelllang=en,de
let g:tex_comment_nospell=1
let g:vimtex_view_method = 'zathura'


" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


" markdown - must come as the very least settings in here
set nocompatible
if has("autocmd")
    filetype plugin indent on
endif
