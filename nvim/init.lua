-- Colorscheme
vim.opt.termguicolors = true
vim.cmd("colorscheme onehalfdark")

vim.opt.number = true
vim.opt.relativenumber = true

-- Lazy (Package Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Which-Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
          "<leader>?",
          function()
	    require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
 
  -- Mini Icons (Which-Key Optional Requirement)
  { 'echasnovski/mini.nvim', version = false },

  -- nvim-web-devicons (Which-Key Optional Requirement)
  "nvim-tree/nvim-web-devicons",
})

