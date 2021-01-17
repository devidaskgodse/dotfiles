" be iMproved, required

" ONE RULE - add and keep what is essential. evolution rules revolution.

filetype off                  " required
set nocompatible " disables VI mode so that VIm things work
filetype plugin indent on " required
syntax on


" mapping for FZF
nnoremap <Leader>F :Rg<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>h :History<CR>

" snippets directory 
let g:snippets_base_directory = '/media/machine/D/zettelkasten/snippets'
" nnoremap <Leader>t <Leader>ssP

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python

" UI Config
"set number              " show line numbers
"set relativenumber      " show relative numbering
set showcmd             " show command in bottom bar

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'vsplit'

" window splitting and movement
" window splitting removed due to incompatibility with snippets plugin
" nnoremap <Leader>s :sp<CR>
" nnoremap <Leader>v :vsp<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" spell checking and automatic text suggestion/insertion
set spelllang=en_us
set spell
set complete=.,w,b,u,t,i,kspell

""""""""" Markdown and zettelkasten setup """"""""""""""""""
" my keybindings for implementing zettelkasten
" for avoiding writing two spaces before entering a new line in markdown
autocmd FileType markdown inoremap <CR> <space><space><CR>
" create a new files with time-based tags
let g:zettelkasten = "/media/machine/D/zettelkasten/"  
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"  
nnoremap <leader>nz :NewZettel<space>
command! -nargs=1 NewReference :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.json"  
nnoremap <leader>nr :NewReference<space>

"FZF for inserting links in the file
function! InsertLink(file)
    "let filename = fnameescape(fnamemodify(a:file, ":t"))
    "why only the tail ?  I believe the whole filename must be linked unless everything is flat ...
    let filename = fnameescape(a:file)
   " let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
     " Insert the markdown link to the file in the current buffer
    let mdlink = "[".filename."](".filename.")"
    put=mdlink
endfunction

command! -nargs=1 InsertLink :call InsertLink(<f-args>)
nnoremap <Leader>i :call fzf#run({'sink': 'InsertLink'})<CR>
