" lua require 'init'
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
" Plug 'psliwka/vim-smoothie'
Plug 'junegunn/vim-easy-align'
Plug 'pantharshit00/vim-prisma'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
" Plug 'justinmk/vim-dirvish'

" Lua 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'phaazon/hop.nvim'
call plug#end()

inoremap jk <Esc>
inoremap kj <Esc>
set clipboard=unnamedplus

"relative number
set number 
set relativenumber
map <F9> :set relativenumber!<CR>
" map <F3> :vs<CR>10<C-w>-:Ex<CR>

"constrain gutter space for numbers
set numberwidth=1

"natural pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tabs
nnoremap <A-1> :tabn 1<CR>
nnoremap <A-2> :tabn 2<CR>
nnoremap <A-3> :tabn 3<CR>
nnoremap <A-4> :tabn 4<CR>
nnoremap <leader>tc :tabclose<CR>

" open netrw
nnoremap <leader>o :Ex<CR>
let g:netrw_liststyle=3

"set buffers to switch when unsaved
set hidden
set encoding=utf-8

set termguicolors
colorscheme nightfly
hi Visual guifg=#000000 guibg=#FFFFFF gui=none
hi Normal ctermbg=NONE guibg=NONE
" let g:nightflyTransparent = 1
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none

nnoremap Y y$

"MACROS
let @j='miojk0"iD`i'
let @k='miOjk0"iD`i'

"change leaderkey 
let mapleader=" "

"next
nnoremap <A-j> :bn<CR>
"previous
nnoremap <A-k> :bp<CR>
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

"leader key mappings
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>j @j
nnoremap <leader>k @k
nnoremap <leader>qh q:
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

set nofoldenable
set foldmethod=manual

"split terminal down
nnoremap <leader>t- :sp<CR>:term<CR>
nnoremap <leader>t] :vs<CR>:term<CR>
nnoremap <leader>tt :term<CR>

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

autocmd BufRead,BufNewFile *.vue,*.[tj]s*,*.css,*.prisma
    \ set shiftwidth=2 |
    \ set tabstop=2

"c++ lib
" nnoremap <leader>cp i#include<bits/stdc++.h><CR>using namespace std;<CR><CR>int main() {<CR>}<Esc>O

set updatetime=800
set nobackup
set nowritebackup
set cmdheight=1


"  LIGHTLINE
let g:lightline = {
      \ 'colorscheme': 'nightfly',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" vim path
nnoremap <leader>e :e $MYVIMRC<CR>


" Save session on quitting Vim
" autocmd VimLeave * call MakeSession()

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
" autocmd VimEnter * call LoadSession()
" Start NERDTree when session is available or if commands line args are passed

" store undos across sessions
if !isdirectory(expand("~/.vim/undodir"))
    call mkdir(expand("~/.vim/undodir", "p"))
endif
set undofile
set undodir=~/.vim/undodir

" exist out of terminal mode use jk
tnoremap jk <C-\><C-n>

" Plugged nvim-tree.lua
    " nnoremap <F3> :NvimTreeToggle<CR>
    " let g:nvim_tree_show_icons = {
    "     \ 'git': 0,
    "     \ 'folders': 0,
    "     \ 'files': 0,
    "     \ 'folder_arrows': 0,
    "     \ }
    " let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
    " let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
    " let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
    " let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" " Unplugged

" Plugged telescope.nvim
    noremap <C-p> :Telescope find_files<CR>
    nnoremap <leader>fa :Telescope live_grep<CR>
    nnoremap <leader>lr :Telescope registers<CR>
    nnoremap <leader>lc :Telescope colorscheme<CR>
    :nnoremap <leader>ll :lua require'telescope.builtin'.buffers{}<CR>

    " git
    nnoremap <leader>lgs :Telescope git_stash<CR>
    nnoremap <leader>lgb :Telescope git_branches<CR>
    nnoremap <leader>lgc :Telescope git_commits<CR>
    nnoremap <leader>lgcc :Telescope git_bcommits<CR>


    " other
    :nnoremap <leader>p :Telescope treesitter<CR>
    :nnoremap <leader>pr :Telescope lsp_references<CR>
" Unplugged

lua require('telescope').load_extension('fzf')

" Plugged Coc
    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " always
    set signcolumn=auto
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <C-e> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    nnoremap <leader>cle :CocList extensions<CR>
    nnoremap <leader>cld :CocList diagnostics<CR>
    nnoremap <leader>clc :CocList commands<CR>
    nnoremap <leader>cd :CocDisable<CR>
    nnoremap <leader>ce :CocEnable<CR>
    nnoremap <leader>cr :CocRestart<CR>
" Unplugged

" Plugged tree-sitter
lua <<EOF
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        -- custom_captures = {
          -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
          -- ["foo.bar"] = "Identifier",
        -- },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
    require'nvim-treesitter.configs'.setup {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    }
    require'nvim-treesitter.configs'.setup {
      indent = {
        enable = true
      }
    }
EOF
" Unplugged

" Plugged fugitive
    nnoremap <leader>gs :G<CR>
    nnoremap <leader>gss :Git stash<CR>
    nnoremap <leader>gsp :Git stash pop<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gll :Git log --graph --all --decorate<CR>
    nnoremap <leader>gbb :Git blame<CR>
" Unplugged

" Plugged Hop
    nnoremap <leader>ff :HopWord<CR>
" Unplugged

" Plugged easy align
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
" Unplugged

set noswapfile
set nobackup
set scrolloff=8

" reload buffer when the content is changed
set autoread
