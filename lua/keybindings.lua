local M = {}

-- Global mapping utility
local function map(mode, lhs, rhs, desc, opts)
  local options = vim.tbl_extend("force", {
    noremap = true,
    silent = true,
    desc = desc,
  }, opts or {})
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Global Keymaps
function M.global()
    map('n', '<C-b>', '<C-b>zz','')
    map('n', '<C-f>', '<C-f>zz','')
    map('n', '<C-d>', '<C-d>zz','')
    map('n', '<C-u>', '<C-u>zz','')
    map('n', '<leader>sd', vim.diagnostic.open_float, 'Show diagnostics popup')
    map('n', '<leader>sp', function()
        print(vim.fn.expand('%:p'))
    end, 'Show buffer path')
    map('n', 'K', function()
        vim.lsp.buf.hover({
            border = 'rounded',
        })
    end, 'Show Signature')
end

-- Fzf-lua keymaps
function M.fzf()
  local fzf = require('fzf-lua')
  map('n', '<leader>ff', fzf.files, 'Find files')
  map('n', '<leader>fg', fzf.live_grep, 'Live grep')
  map('n', '<leader>fb', fzf.buffers, 'Find buffers')
  map('n', '<leader>fr', fzf.resume, 'Resume Find')
end

-- LSP keymaps
function M.lsp(bufnr)
  local fzf = require('fzf-lua')
  local opts = { buffer = bufnr }

  map('n', 'grn', vim.lsp.buf.rename, "Rename symbol", opts)
  map({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, "Code action", opts)
  map('n', 'grr', fzf.lsp_references, "Find references", opts)
  map('n', 'gri', fzf.lsp_implementations, "Go to implementation", opts)
  map('n', 'grt', fzf.lsp_typedefs, "Go to type definition", opts)
  map('n', 'grd', fzf.lsp_definitions, "Go to definition", opts)
  map('n', 'grs', fzf.lsp_document_symbols, "Document symbols", opts)
  map('n', 'grD', vim.lsp.buf.declaration, "Go to declaration", opts)
  map('n', 'grx', function() fzf.diagnostics_document() end, "Show buffer diagnostics", opts)
  map('n', '<space>lr', function () vim.cmd("lsp restart") end, "Restart LSP server")

end

return M
