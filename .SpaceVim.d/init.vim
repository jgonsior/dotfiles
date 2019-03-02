" Dark powered mode of SpaceVim, generated by SpaceVim automatically.
let g:spacevim_realtime_leader_guide = 1
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#python')

call SpaceVim#layers#load('autocomplete', {
            \ 'auto-completion-return-key-behavior' : 'nil',
            \ 'auto-completion-tab-key-behavior' : 'smart',
            \ 'auto-completion-complete-with-key-sequence' : 'nil',
            \ 'auto-completion-complete-with-key-sequence-delay' : 0.1,
            \ 'auto-completion-enable-snippets-in-popup' : 0
            \ })
call SpaceVim#layers#load('fzf')
call SpaceVim#layers#load('ui')
call SpaceVim#layers#load('checkers')
call SpaceVim#layers#load('VersionControl')
call SpaceVim#layers#load('git')
call SpaceVim#layers#load('lang#html')
call SpaceVim#layers#load('colorscheme')
set spell spelllang=de_DE

" autocomplete
let g:deoplete#enable_at_startup = 0
let g:deoplete#auto_complete_delay = 2000

let g:spacevim_enable_ycm = 1
let g:spacevim_plugin_bundle_dir = '$HOME/.dein_plugins'
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:spacevim_enable_tabline_filetype_icon = 0
let g:spacevim_enable_statusline_display_mode = 0
let g:spacevim_enable_os_fileformat_icon = 0
let g:spacevim_buffer_index_type = 1
let g:neomake_vim_enabled_makers = []
if executable('vimlint')
    call add(g:neomake_vim_enabled_makers, 'vimlint') 
endif
if executable('vint')
    call add(g:neomake_vim_enabled_makers, 'vint') 
endif
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''


" linting with ale
let g:spacevim_enable_ale = 1
let g:spaevim_enable_neomake = 0
let g:spacevim_lint_on_the_fly = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_python_flake8_options = "--max-line-length=120"

"set t_8f=[38;2;%lu;%lu;%lum
"set t_8b=[48;2;%lu;%lu;%lum

"ui
let g:spacevim_colorscheme = 'onedark'
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_statusline_separator = 'arrow'

" airline
let g:airline_theme="lucius"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#default#layout = [[ 'a', 'b', 'c'], ['x', 'y', 'z', 'error']]
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


"let g:tmuxline_powerline_separators = 0
"set Tmuxline airline_visual

" search
set ignorecase
set smartcase

" latex
set conceallevel=0
set wrap 

"indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=7 ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#2C323C' ctermbg=8


" keybindings
"let mapleader = " "
let maplocalleader = ",,"
let mapleader = ","

let g:spacevim_custom_plugins = [
            \ ['nginx/nginx', {'rtp': 'contrib/vim'}],
            \ ['neomutt/neomutt', {'rtp': '/blob/master/doc/neomutt-syntax.vim'}],
            \ ['digitaltoad/vim-pug'],
            \ ['nathanaelkane/vim-indent-guides'],
            \ ['lervag/vimtex'],
            \ ['vim-airline/vim-airline'],
            \ ['vim-airline/vim-airline-themes'],
            \ ['editorconfig/editorconfig-vim'],
            \ ]
            "\ ['edkolev/tmuxline.vim'],

call SpaceVim#layers#disable('core#statusline')
call SpaceVim#layers#disable('core#tabline')

let g:spacevim_disabled_plugins=[
            \ ['floobits/floobits-neovim'],
            \ ]

let g:indentLine_enabled = 0

let g:spacevim_enable_cursorline = 0
let g:spacevim_enable_cursorcolumn = 0
let g:spacevim_default_indent = 4
set nocursorline


set mouse=a
set wrap

" tabs
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4


function IsProject(projectname)
    let l:result = match(expand('%:p'), a:projectname)
    if l:result == -1
        return 0
    else
        return 1
    endfunction

    " use autoformat for the following projects only:
    function! SetupEnvironment()
        if IsProject("coding/doxieGoLinuxWifi") || IsProject('coding/gaenserich') || IsProject('coding/') || IsProject('coding/jiraStreamWorklog')
            let g:neoformat_run_all_formatters = 1
            let g:neoformat_enabled_javascript = ['jsbeautify']
            let g:neoformat_enabled_java = ['astyle']
            " augroup fmt
                " autocmd!
                " autocmd BufWritePre * undojoin | Neoformat
            " augroup END
        endif
    endfunction

    autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

