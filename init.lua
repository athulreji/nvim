-- Set leader key to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Essential Neovim settings
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.o.termguicolors = true

vim.filetype.add({
  extension = {
    xaml = "xml",
  },
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.b.completion = false
vim.lsp.inlay_hint.enable()
vim.diagnostic.config ({
    signs = true,
    underline = true,
    virtual_text = true,
    virtual_lines = false,
    update_in_insert = true,
    float = {
      header = "",
      border = 'rounded',
      focusable = true,
    }
  }
)

require("keybindings").global()

-- Load LSPs
require("lsp")

-- Load plugin specs from lua/plugins/
require("lazy").setup("plugins")
