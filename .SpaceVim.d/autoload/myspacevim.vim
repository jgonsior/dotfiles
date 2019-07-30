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
set shiftwidth=4
set expandtab
set softtabstop=4


" use undofile
set undofile

set statusline^=%{coc#status()}

function! myspacevim#before() abort
    call SpaceVim#custom#SPCGroupName(['G'], '+FZF')
    call SpaceVim#custom#SPC('nore', ['G', 'f'], 'FzfFiles', 'FzfFiles', 1)
    call SpaceVim#custom#SPC('nore', ['G', 'b'], 'Fzfbuffer', 'Fzfbuffer', 1)
    let g:spacevim_autocomplete_method='coc'
endfunction

function! myspacevim#after() abort
  call coc#config('coc.preferences', {
        \ "autoTrigger": "always",
        \ "maxCompleteItemCount": 10,
        \ "codeLens.enable": 1,
        \ "diagnostic.virtualText": 1,
        \})
  let s:coc_extensions = [
        'coc-python',
        \ 'coc-dictionary',
        \ 'coc-json',
        \ 'coc-snippets',
        \ 'coc-tag',
        \]

  for extension in s:coc_extensions
    call coc#add_extension(extension)
  endfor

endfunction
