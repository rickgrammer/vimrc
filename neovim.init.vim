call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'kassio/neoterm'
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

"autofill braces
inoremap { {}<Esc>i
inoremap [ []<Esc>i

"opening with indented block
inoremap {<CR> <Space>{}<Esc>i<CR><Esc>O

"yank/paste to system's clipboard; use only for ubuntu & comment it for wsl
" nnoremap <leader>y "+y
" nnoremap <leader>p "+p

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

"split terminal down
nnoremap <leader>t- :sp<CR>10<C-w>-:Tnew<CR>
nnoremap <leader>t] :vs<CR>:Tnew<CR>
nnoremap <leader>tt :Tnew<CR>

"split down
nnoremap <leader>- :sp<CR>
"split right
nnoremap <leader>] :vs<CR>

"expand tab to spaces
set expandtab
"set indent width to 4 spaces
set shiftwidth=4
"make tabs 4 spaces wide
set tabstop=4

"save session before maximising the pane
fu! SaveTempSession()
   if !empty(expand("~/.session.vim"))
       echo "session saved"
       execute 'mksession! ~/.session.vim'
   endif
endfunction 
nnoremap <C-w>m :call SaveTempSession()<CR><C-w>o

"restore session thereby minimising the pane
fu! RestoreTempSession()
   if (filereadable(expand("~/.session.vim")) == 1)
       echo 'session restored'
       execute 'source ~/.session.vim'
       execute ':call delete(expand("~/.session.vim"))'
   endif
endfunction 
nnoremap <C-w>n :call RestoreTempSession()<CR>

"c++ lib
nnoremap <leader>cp i#include<bits/stdc++.h><CR>using namespace std;<CR><CR>int main() {<CR>}<Esc>O

" use it for wsl2 with windows (which you probably would never use again
" because windows is just too awesome to use). 
set clipboard+=unnamedplus
let g:clipboard =  {
          \   'name': 'win32yank-wsl-2',
          \   'copy':  {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste':  {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }

:
