vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.textwidth = 80
vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"

vim.filetype.add({
  extension = {
    xaml = "xml",
  },
})

vim.diagnostic.config({ virtual_text = true })

vim.pack.add({
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/saghen/blink.lib",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/seblyng/roslyn.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/folke/which-key.nvim",
}, { confirm = false })

require("kanagawa").setup({
  transparent = true,
  colors = {
    theme = {
        all = {
            ui = { bg_gutter = "none"
            }
        }
    }
  }
})

vim.cmd.colorscheme("kanagawa")

require("lualine").setup()

require("nvim-treesitter.install").install{"fish", "c_sharp", "c", "cpp", "python", "rust", "make", "xml"}

require("blink.cmp").setup({ fuzzy = { implementation = "lua" } })

require("mason").setup()

require("oil").setup()

require("telescope").setup()

require("keybindings").global()

require("keybindings").telescope()

require("keybindings").lsp()

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
})

vim.lsp.enable({"clangd", "lua_ls"})
