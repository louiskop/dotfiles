-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
 use 'wbthomason/packer.nvim'
 
 use {
	 'nvim-telescope/telescope.nvim', tag = '0.1.5',
	 requires = { {'nvim-lua/plenary.nvim'} }
 }

 use { "ellisonleao/gruvbox.nvim" }

 use {
	 'nvim-treesitter/nvim-treesitter',
	 run = function()
		 local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		 ts_update()
	 end,
 }

 use { "theprimeagen/harpoon" }

 use { "mbbill/undotree"}

 use { "tpope/vim-fugitive" }

 -- primeagen lsp setup
 use {
     'VonHeikemen/lsp-zero.nvim',
     requires = {

         -- LSP Support
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},
         {'neovim/nvim-lspconfig'},

         -- Autocompletion
         {'hrsh7th/nvim-cmp'},
         {'hrsh7th/cmp-buffer'},
         {'hrsh7th/cmp-path'},
         {'hrsh7th/cmp-nvim-lsp'},
         {'hrsh7th/cmp-nvim-lua'},
         {'saadparwaiz1/cmp_luasnip'},

         -- Snippets
         {'L3MON4D3/LuaSnip'},
         {'rafamadriz/friendly-snippets'},

    }
}

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup();
    end
}

end)
