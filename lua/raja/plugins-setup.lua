-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end


return packer.startup(function(use)

  use('folke/tokyonight.nvim')
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  -- use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use('nvim-tree/nvim-tree.lua')
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use('nvim-treesitter/nvim-treesitter')
  use ('rcarriga/nvim-notify')

  if packer_bootstrap then
    require("packer").sync()
  end
end)