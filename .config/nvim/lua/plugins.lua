return require('packer').startup(function()
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-fugitive'
    use 'psliwka/vim-smoothie'
    use 'junegunn/vim-easy-align'
    use 'pantharshit00/vim-prisma'
    use 'bluz71/vim-nightfly-guicolors'
    use 'morhetz/gruvbox'
    use 'itchyny/lightline.vim'
    use {'neoclide/coc.nvim', {branch = 'release'}}
    use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
    use {'nvim-telescope/telescope-fzf-native.nvim', { run = 'make' }}
    use 'nvim-telescope/telescope.nvim'
    require('./telescope')
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'phaazon/hop.nvim'
end)

