" yank
set clipboard=unnamed

" keybindings
let mapleader = ","
let maplocalleader = ",,"

" search
set ignorecase
set smartcase
"
set mouse=a
vmap <LeftRealease> "*ygv"
set wrap
"
" tabs
set autoindent
set tabstop=4
set shiftwidth = 4
set expandtab
set softtabstop=4

function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
endfunction



call coc#config('coc.preferences', {
      \ "autoTrigger": "always",
      \ "maxCompleteItemCount": 10,
      \ "codeLens.enable": 1,
      \ "diagnostic.virtualText": 1,
      \})

let s:coc_extensions = [
      \ 'coc-dictionary',
      \ 'coc-json',
      \ 'coc-ultisnips',
      \ 'coc-tag',
      \]

for extension in s:coc_extensions
  call coc#add_extension(extension)
endfor


" Mapping selecting mappings
nmap <leader> <b> :FzfBuffers --> not working!