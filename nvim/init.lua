-- init.lua
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Lazy.nvim setup
require("lazy").setup({
    -- Install onehalf color scheme
    {
        "sonph/onehalf",
        rtp = "vim",  -- Use the Vim runtime path
	lazy = false,
	config = function()
            -- Set onehalf as the color scheme
	    vim.cmd("set runtimepath+=~/.config/nvim/pack/colors/start/onehalf/vim")
	    vim.cmd("colorscheme onehalfdark")  -- Use 'onehalfdark' or 'onehalflight'
        end,
    },
  -- devicons
  { "nvim-tree/nvim-web-devicons", lazy = true },

    -- language server protocol
  { "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      require('mason').setup()
      local mason_lspconfig = require 'mason-lspconfig'
      mason_lspconfig.setup {
        ensure_installed = { "ruff", "pyright", "rust_analyzer", "gopls" }
      }
      require("lspconfig").pyright.setup {
        capabilities = capabilities,
      }
    end
  },

    -- autocompletion
  { "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    },
  },


  -- treesitter
  { "nvim-treesitter/nvim-treesitter", version = false,
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript" },
        auto_install = false,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-m>",
          }
        }
      })
    end
  },

  -- fuzzy find
  { "nvim-telescope/telescope.nvim", cmd = "Telescope", version = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>sf", "<cmd>Telescope git_files<cr>", desc = "Find Files (root dir)" },
      { "<leader><space>", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search Project" },
      { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Search Document Symbols" },
      { "<leader>sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search Workspace Symbols" },
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        }
      } 
    }
  },
  { "nvim-telescope/telescope-fzf-native.nvim", 
    build = "make",
    config = function()
      require('telescope').load_extension('fzf')
    end
  },

  -- surround text object
  { "echasnovski/mini.surround",
    config = function(_, opts)
      require('mini.surround').setup(opts)
    end
  },

  -- show indent guides on blank lines
  { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
    }
  },
})


-- Optional: Enable true colors
vim.opt.termguicolors = true
-- init.lua or within your plugin configuration setup



