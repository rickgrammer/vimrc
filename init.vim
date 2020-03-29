call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs' 
Plug 'tmhedberg/SimpylFold' 
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
colorscheme minimalist

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

"lightline configuration
let g:lightline = {
	\ 'colorscheme': 'seoul256',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead'
        \ },
\ }

"python file indentation
nnoremap <leader>a ALEToggle<CR>
au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4

"linting with ALE
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nnoremap <leader>f :ALEFix<CR>
let g:ale_fix_on_save = 1
nnoremap <leader>e :ALENextWrap<CR>
nnoremap <leader>q :ALEPreviousWrap<CR>
nnoremap <leader>a :ALEToggle<CR>

"jedi
let g:jedi#goto_command = "<leader>jg"
let g:jedi#goto_assignments_command = "<leader>ja"
let g:jedi#goto_stubs_command = "<leader>js"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command = ""
let g:jedi#usages_command = "<leader>ju"

" fugitive git bindings
" nnoremap <space>ga :Git add %:p<CR><CR>
" nnoremap <space>gs :Gstatus<CR>
" nnoremap <space>gc :Gcommit -v -q<CR>
" nnoremap <space>gt :Gcommit -v -q %:p<CR>
" nnoremap <space>gd :Gdiff<CR>
" nnoremap <space>ge :Gedit<CR>
" nnoremap <space>gr :Gread<CR>
" nnoremap <space>gw :Gwrite<CR><CR>
" nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <space>gp :Ggrep<Space>
" nnoremap <space>gm :Gmove<Space>
" nnoremap <space>gb :Git branch<Space>
" nnoremap <space>go :Git checkout<Space>
" nnoremap <space>gps :Dispatch! git push<CR>
" nnoremap <space>gpl :Dispatch! git pull<CR>
