call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'kassio/neoterm'
Plug 'tomasiser/vim-code-dark'
Plug 'Pocco81/Catppuccino.nvim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'pantharshit00/vim-prisma'
" Plug 'wellle/targets.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'justinmk/vim-dirvish'

" Lua 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'phaazon/hop.nvim'
" Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

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

" tabs
nnoremap <A-1> :tabn 1<CR>
nnoremap <A-2> :tabn 2<CR>
nnoremap <A-3> :tabn 3<CR>
nnoremap <A-4> :tabn 4<CR>
nnoremap <leader>tc :tabclose<CR>

"set buffers to switch when unsaved
set hidden
set encoding=utf-8

colorscheme codedark

nnoremap Y y$

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

autocmd BufRead,BufNewFile *.vue,*.[tj]s*,*.css,*.prisma
    \ set shiftwidth=2 |
    \ set tabstop=2

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
    " files
    noremap <C-p> :Telescope find_files<CR>
    nnoremap <leader>fa :Telescope live_grep<CR>
    nnoremap <leader>lr :Telescope registers<CR>
    nnoremap <leader>lc :Telescope colorscheme<CR>
    :nnoremap <leader>ll :lua require'telescope.builtin'.buffers{}<CR>

    " git
    nnoremap <leader>gls :Telescope git_stash<CR>
    nnoremap <leader>glb :Telescope git_branches<CR>
    nnoremap <leader>glc :Telescope git_commits<CR>
    nnoremap <leader>glcc :Telescope git_bcommits<CR>


    " other
    :nnoremap <leader>p :Telescope treesitter<CR>
    :nnoremap <leader>pr :Telescope lsp_references<CR>

    lua require('telescope').load_extension('fzf')
" Unplugged

" Plugged Coc
    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " always
    set signcolumn=yes
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
set nowrap
set nobackup
set scrolloff=8
