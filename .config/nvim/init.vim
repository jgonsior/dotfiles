" Auto install vim plug 
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'benmills/vimux'
Plug 'janko/vim-test'
Plug 'liuchengxu/vista.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'lervag/vimtex'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-cost', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-omni', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-word', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-smartf', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-gitignore', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-ultisnips', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-neosnippet', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-vim-lsp', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-emoji', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tag', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-dictionary', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-diagnostic', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-syntax', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-ccls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-phpls', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-docker', {'do': 'yarn install --frozen-lockfile'}

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'rakr/vim-one'
Plug 'edkolev/tmuxline.vim'
Plug 'NLKNguyen/papercolor-theme'


call plug#end()


if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif

set clipboard=unnamed

set showtabline=2
syntax on
colorscheme one 
set background=light
let g:PaperColor_Theme_Options = {
            \     'theme': {
            \     'default': {
            \       'transparent_background': 0,
            \ 'allow_bold': 1,
            \ 'allow_italic': 1,
            \     }
            \   },
            \ 'language': {
            \ 'python': {
            \ 'highlight_builtins':1,
            \}
            \}
            \ }
let g:one_allow_italics = 1

" keybindings
let mapleader = ","
let maplocalleader = " " " space


function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

set noswapfile


" airline
" let g:airline_theme='one'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:lightline = {
            \ 'colorscheme' : 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'currentfunction','modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'currentfunction': 'NearestMethodOrFunction'
            \ },
            \ }


let g:lightline.tabline          = {'left': [['buffers']], 'right': [['cocstatus']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number = 1
" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()


nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)


" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = "minimal"



set noshowmode


map <F2> :Vista!! <CR>


"set spell spelllang=en,de

" search
set ignorecase
set smartcase

" latex
set conceallevel=0
set wrap 
set scrolloff=5

set title
set titlestring=%{hostname()}\ \ %F\ \ \ %{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

set cursorline
set number relativenumber

set mouse=a
vmap <LeftRelease> "*ygv"
set wrap

" tabs
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set undofile

" select buffer via fzf
function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
endfunction

function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
            \   'source':  reverse(<sid>buflist()),
            \   'sink':    function('<sid>bufopen'),
            \   'options': '+m',
            \   'down':    len(<sid>buflist()) + 2
            \ })<CR>


" run formatter on save
augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END


" fzf

nmap <LocalLeader>f :GFiles<CR>
nmap <LocalLeader>b :Buffer<CR>
nmap <LocalLeader>L :Lines<CR>
nmap <LocalLeader>h :History<CR>
nmap <LocalLeader>v :Vista finder<CR>




" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

vnoremap <LocalLeader>t :call NERDComment(0,"toggle")<CR>
nnoremap <LocalLeader>t :call NERDComment(0,"toggle")<CR>

" coc
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
