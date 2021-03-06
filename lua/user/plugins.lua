local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer failed to load")
  return
end

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
  use("tpope/vim-fugitive")
  use("folke/which-key.nvim")
  use("lewis6991/impatient.nvim")
  use({
    "goolord/alpha-nvim",
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  })
  use({"lewis6991/gitsigns.nvim", tag = "release" })
  use({"kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
  use({"akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons"})

  -- fzf
  use("junegunn/fzf")
  use("junegunn/fzf.vim")

  -- Treesitter
  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

  -- Telescope
  use({'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}})
  use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make'})

  -- Cmp
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua") -- completions for nvim lua config

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use('jose-elias-alvarez/nvim-lsp-ts-utils') -- typescript utilities

  -- Null-LS
  use("jose-elias-alvarez/null-ls.nvim") -- formatter

  -- Colorschemes
  use("rmehri01/onenord.nvim")
  use("folke/tokyonight.nvim")
  use("rafamadriz/neon")
  use("sainnhe/edge")
  -- use("RRethy/nvim-base16")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
