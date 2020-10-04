call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
call plug#end()

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

"set buffers to switch when unsaved
set hidden

colorscheme industry

"map leader to space
map <Space> <Leader>

"MACROS
let @j="ojk0Dk"
let @k="Ojk0Dj"

"set scroll offset
set scrolloff=3

"change leaderkey 
let mapleader="\<Space>"

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

"pane splits
set splitright
set splitbelow

"yank/paste to system's clipboard
set clipboard=unnamedplus
nnoremap <leader>y "+y
nnoremap <leader>p "+p

"leader key mappings
nnoremap <leader>w :w!<CR>
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

"fzf remappings
nnoremap <C-p> :Files<CR>

set foldlevel=1

"toggle Nerdtree
map <F3> :NERDTreeToggle<CR>

"terminal map
tnoremap jk <C-\><C-n>




