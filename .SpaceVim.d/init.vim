" Dark powered mode of SpaceVim, generated by SpaceVim automatically.
let g:spacevim_realtime_leader_guide = 1
call SpaceVim#layers#load('incsearch')
"call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#haskell')
"call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#perl')
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('lang#swig')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('shell')   
call SpaceVim#layers#load('tools#screensaver')
call SpaceVim#layers#load('autocomplete')
call SpaceVim#layers#load('checkers')
call SpaceVim#layers#load('cscope')
call SpaceVim#layers#load('debug')
call SpaceVim#layers#load('git')
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('language-server-protocol')
call SpaceVim#layers#load('lang/html')
call SpaceVim#layers#load('vim')

let g:spacevim_plugin_bundle_dir = '$HOME/.dein_plugins'
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_statusline_display_mode = 0
let g:spacevim_enable_os_fileformat_icon = 1
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

"set t_8f=[38;2;%lu;%lu;%lum
"set t_8b=[48;2;%lu;%lu;%lum

let g:spacevim_colorscheme = 'NeoSolarized'
let g:spacevim_colorscheme_bg = 'light'
let g:spacevim_statusline_separator = 'slant'


"indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=7 ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#EEE8D5' ctermbg=white


" keybindings
let mapleader = "\-"
"let maplocalleader = "\-"

let g:spacevim_custom_plugins = [
\ ['nginx/nginx', {'rtp': 'contrib/vim'}],
\ ['neomutt/neomutt', {'rtp': '/blob/master/doc/neomutt-syntax.vim'}],
\ ['digitaltoad/vim-pug'],
\ ['nathanaelkane/vim-indent-guides'],
\ ]

let g:indentLine_enabled = 0

let g:spacevim_github_username = "jgonsior"

let g:spacevim_enable_cursorline = 0
let g:spacevim_enable_cursorcolumn = 0
let g:spacevim_default_indent = 4
set nocursorline

" tabs
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4


" Auto format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:neoformat_run_all_formatters = 1
