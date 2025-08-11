-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
local plugins = {
	{ "RRethy/base16-nvim", name = "base1e-woodland", priority = 1000 },
	{ "mason-org/mason-lspconfig.nvim",
    	   opts = {
            ensure_installed = { "lua_ls", "rust_analyzer" },
    	   },
           dependencies = {
           { 
	    "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
           },
       },
}

require("lazy").setup(plugins, {})

vim.cmd("colorscheme base16-gruvbox-dark-hard")

