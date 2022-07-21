""""""""""""""""""""""""""""""""""""
" Plugins setup
""""""""""""""""""""""""""""""""""""

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/goyo.vim'
" Plug 'lukesmithxyz/vimling'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'renerocksai/telekasten.nvim'
" Plug 'tpope/vim-commentary'
" Plug 'jreybert/vimagit'
" Plug 'tpope/vim-fugitive'
" Plug 'vim-airline/vim-airline'
call plug#end()

""""""""""""""""""""""""""""""""""""
" remove
""""""""""""""""""""""""""""""""""""
set nocompatible " disables VI mode so that VIm things work
set shortmess+=I " Disable the default Vim startup message.
set noerrorbells visualbell t_vb= " Disable audible bell because it's annoying.

" Unbind/Rebind some useless/annoying default key bindings.
nmap Q <Nop> 
noremap ; :
noremap : ;
imap ii <Esc>
au BufEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au BufLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

""""""""""""""""""""""""""""""""""""
" reconfigure
""""""""""""""""""""""""""""""""""""
filetype off                  
filetype plugin indent on 
syntax on " turn on syntax highlighting

set hidden  " let's you edit new files without saving the current one
set backspace=indent,eol,start " allows backspacing over anything
"set hidden " hides a buffer with unsaved changes
set incsearch " searching as you type
set clipboard+=unnamedplus " using system clipboard from `+` and `*` registers
" spell checking and automatic text suggestion/insertion
set spelllang=en_us
set complete=.,w,b,u,t,i,kspell

" case insensitive search
set ignorecase
set smartcase

set number              " show line numbers
set relativenumber      " show relative numbering

set showcmd             " show command in bottom bar
" set laststatus=2        " show filename above the bottom status bar
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 
" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow


""""""""""""""""""""""""""""""""""""
" additions
""""""""""""""""""""""""""""""""""""

" spell-check via function keys
nnoremap <F2> :set spell! spell?<CR>
imap <F2> <C-O><F2>

" window splitting and movement
nnoremap <Leader>s :sp<CR>
nnoremap <Leader>v :vsp<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Moving visual selection blocks
vnoremap K xkP`[V`]
vnoremap U xp`[V`]
vnoremap H dhPgvhoho
vnoremap L dpgvlolo

" timestamps
inoremap \td <C-R>=strftime('%Y-%m-%d')<C-M>
inoremap \th <C-R>=strftime('%H%M')<C-M>
inoremap \tf <C-R>=strftime('%c')<C-M>

" mapping fuzzy file opening using FZF
nnoremap <Leader>A :Ag<CR>
nnoremap <Leader>ff :Files<CR> 
nnoremap <Leader>h :History<CR>

"""""""""""""""""""""""""""""
" Navigating the hard way
"""""""""""""""""""""""""""""
" in normal mode...
" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
" inoremap <Left>  <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up>    <ESC>:echoe "Use k"<CR>
" inoremap <Down>  <ESC>:echoe "Use j"<CR>

"""""""""""""""""""""""""""""
" for markdown
"""""""""""""""""""""""""""""

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'vsplit'

" lf.vim shortcuts
nnoremap <leader>l :Lf<CR>

" Fugitive keymaps
nnoremap <leader>gc :Git<space>commit<CR>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gpl :Gpull<CR>
" nnoremap <leader> :<CR>
" nnoremap <leader> :<CR>
" nnoremap <leader> :<CR>

