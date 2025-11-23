local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
  use 'goolord/alpha-nvim'
  use 'nvim-treesitter/nvim-treesitter' 
  use 'rebelot/kanagawa.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} } 
  }
--completion and shyt
  use 'hrsh7th/nvim-cmp'
  use 'windwp/nvim-autopairs'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'github/copilot.vim'
  use 'L3MON4D3/Luasnip'
  use {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  }
  use{
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
    if packer_bootstrap then
    require('packer').sync()
  end
end)
