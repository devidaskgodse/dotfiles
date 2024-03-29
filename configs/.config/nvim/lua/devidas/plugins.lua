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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- preferred colorscheme
  use 'bluz71/vim-nightfly-guicolors' 
  -- file explorer
  use 'nvim-tree/nvim-tree.lua'
  -- icones
  use 'kyazdani42/nvim-web-devicons'
  -- status line
  use 'nvim-lualine/lualine.nvim'

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { {'nvim-lua/plenary.nvim'} }} ) -- fuzzy finder

  -- which key
  use({"folke/which-key.nvim", config = function() 
      vim.o.timeout = true
      vim.o.timeoutlen = 30
      require("which-key").setup {}
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
