call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'davidhalter/jedi'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs' 
Plug 'tmhedberg/SimpylFold' 
Plug 'sbdchd/neoformat'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'FooSoft/vim-argwrap'
call plug#end()

"Enable at deoplete startup
let g:deoplete#enable_at_startup = 1

"map Esc
inoremap jk <Esc>
inoremap kj <Esc>

"relative number
set number 
set relativenumber
map <F9> :set relativenumber!<CR>

"constrain gutter space for numbers
set numberwidth=1

"natural pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"use gui colors on terminal
" if (has("termguicolors"))
" 	set termguicolors
" endif

"use colorscheme
colorscheme focuspoint

"toggle Nerdtree
map <F3> :NERDTreeToggle<CR>


"map jk to normal mode in terminal
tnoremap jk <C-\><C-n>

"MACROS
let @j="ojk0Dk"
let @k="Ojk0Dj"

"set scroll offset
set scrolloff=3

"change leaderkey 
let mapleader="\<Space>"

"leader key mappings
nnoremap <leader>w  :Neoformat<CR>:w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>j @j
nnoremap <leader>k @k
nnoremap <leader>h q:
"fzf command
nnoremap <leader>l :Buffers<CR>
"end
nnoremap <leader>d :bd<CR>
nnoremap <leader>r :reg<CR>
nnoremap <leader>n :nohls<CR>
nnoremap <leader>b oimport pdb; pdb.set_trace();<Esc>

"set buffers to switch when unsaved
set hidden

"looping through buffers

"next
nnoremap <A-l> :bn<CR>
"previous
nnoremap <A-h> :bp<CR>
"switching between next and previous
nnoremap <A-p> :b#<CR>

"indent spaces automatically when entering new lines
set autoindent

"Override save prompt when navigating from unsaved buffers
set incsearch

"auto complete braces and quotes
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i 
"pane splits
set splitright
set splitbelow

"fzf remappings
nnoremap <C-p> :Files<CR>

"set foldlevel to 1
set foldlevel=1

"yank/paste to system's clipboard
set clipboard=unnamedplus
nnoremap <leader>y "+y
nnoremap <leader>p "+p

"formatting the file
nnoremap <leader>f :Neoformat<CR>
