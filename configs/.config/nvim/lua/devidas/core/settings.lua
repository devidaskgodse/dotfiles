local set = vim.opt

-- appearance
set.termguicolors = true
set.background = 'dark'
set.signcolumn = 'yes'

-- enables syntax highlighting
set.syntax = 'on' 

-- adds line numbers
set.number = true
set.relativenumber = true
set.wrap = false
set.numberwidth = 4

-- number of spaces in a <Tab>
set.softtabstop = 4
set.expandtab = true

-- autoindents
set.smartindent = true
set.shiftwidth = 4

-- highlights the matched text pattern when searching
set.incsearch = true
set.hlsearch = false

-- open splits intuitively
set.splitbelow = true
set.splitright = true

-- navigate buffers without losing unsaved work
set.hidden = true

-- start scrolling when 8 lines from top or bottom
set.scrolloff = 8

-- Save undo history
set.undofile = true

-- Enable mouse support
set.mouse = 'a'

-- case insensitive search unless capital letters are used
set.ignorecase = true
set.smartcase = true

-- clipboard
set.clipboard:append('unnamedplus')

set.iskeyword:append('-')

vim.g.mapleader = ' '
