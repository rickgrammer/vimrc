call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'kassio/neoterm'
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" Plug 'justinmk/vim-dirvish'

" Lua utility functions - D1
Plug 'nvim-lua/plenary.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

" Fuzzy
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" depends on D1
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-tree.lua'
" depends on D1
Plug 'TimUntersberger/neogit'

Plug 'sindrets/diffview.nvim'
call plug#end()

inoremap jk <Esc>
inoremap kj <Esc>

"relative number
set number 
set relativenumber
map <F9> :set relativenumber!<CR>

" do not let anything change relative number gutter
set signcolumn=auto

"constrain gutter space for numbers
set numberwidth=1

"natural pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"set buffers to switch when unsaved
set hidden
set encoding=utf-8

colorscheme codedark

"MACROS
let @j="ojk0Dk"
let @k="Ojk0Dj"

"set scroll offset
set scrolloff=3

"change leaderkey 
let mapleader=" "

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
" inoremap {<CR> <Space>{}<Esc>i<CR><Esc>O

"yank/paste to system's clipboard; use only for ubuntu & comment it for wsl
" nnoremap <leader>y "+y
" nnoremap <leader>p "+p

"leader key mappings
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>j @j
nnoremap <leader>k @k
nnoremap <leader>h q:
nnoremap <leader>bd :bd<CR>
nnoremap <leader>br :reg<CR>
nnoremap <leader>n :nohls<CR>
" nnoremap <leader>b oimport pdb; pdb.set_trace();<Esc>

fu! GitOrAllFiles()
   if isdirectory('.git')
       execute 'GFiles'
   else
       execute 'Files'
   endif
endfunction 

"fzf remappings
nnoremap <C-p> :call GitOrAllFiles()<CR>

set nofoldenable
set foldmethod=manual

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
" nnoremap <leader>cp i#include<bits/stdc++.h><CR>using namespace std;<CR><CR>int main() {<CR>}<Esc>O

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

set updatetime=800
set nobackup
set nowritebackup
set cmdheight=1


"  LIGHTLINE
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" vim path
nnoremap <leader>e :e $MYVIMRC<CR>


" Save session on quitting Vim
autocmd VimLeave * call MakeSession()

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile) && isdirectory(".git"))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
" Restore session on starting Vim
autocmd VimEnter * call LoadSession()
" Start NERDTree when session is available or if commands line args are passed

" store undos across sessions
if !isdirectory(expand("~/.vim/undodir"))
    call mkdir(expand("~/.vim/undodir", "p"))
endif
set undofile
set undodir=~/.vim/undodir

" highlight the entire cursor line
set cursorline

" exist out of terminal mode use jk
tnoremap jk <C-\><C-n>

" Plugged nvim-tree.lua
nnoremap <F3> :NvimTreeToggle<CR>
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" Unplugged

" Plugged telescope.nvim
noremap <C-p> :Telescope find_files<CR>
nnoremap <leader>fa :Telescope live_grep<CR>
nnoremap <leader>fl <cmd>Telescope buffers<cr>
nnoremap <leader>r <cmd>Telescope registers<cr>

lua require('telescope').load_extension('fzf')

" Unplugged

" Plugged neogit

lua << EOF
local neogit = require("neogit")
neogit.setup {
  disable_signs = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  auto_refresh = true,
  disable_builtin_notifications = false,
  commit_popup = {
      kind = "split",
  },
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    -- use { 
    --   'TimUntersberger/neogit', 
    --   requires = { 
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim' 
    --   }
    -- }
    --
    diffview = true  
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",
      -- Removes the default mapping of "s"
      ["s"] = "",
    }
  }
}
EOF
" Unplugged

" Plug LSP
lua require'lspconfig'.tsserver.setup{}
