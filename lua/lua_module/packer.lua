-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'ParamagicDev/vim-medic_chalk'

  use
  {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}  )

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

--  use {
--	  'VonHeikemen/lsp-zero.nvim',
--	  requires = {
--		  -- LSP Support
--		  {'neovim/nvim-lspconfig'},
--		  {'williamboman/mason.nvim'},
--		  {'williamboman/mason-lspconfig.nvim'},
--
--		  -- Autocompletion
--		  {'hrsh7th/nvim-cmp'},
--		  {'hrsh7th/cmp-buffer'},
--		  {'hrsh7th/cmp-path'},
--		  {'saadparwaiz1/cmp_luasnip'},
--		  {'hrsh7th/cmp-nvim-lsp'},
--		  {'hrsh7th/cmp-nvim-lua'},
--
--		  -- Snippets
--		  {'L3MON4D3/LuaSnip'},
--		  {'rafamadriz/friendly-snippets'},
--	  }
--  }
--  use 'mfussenegger/nvim-dap-python'
  use 'nvim-lua/plenary.nvim'
--  use 'mfussenegger/nvim-dap'
--use 'neovim/nvim-lspconfig'
--  use 'simrat39/rust-tools.nvim'

  --use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
  --
  use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}


  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    require("nvim-tree").setup {}
  end
  }

end)


