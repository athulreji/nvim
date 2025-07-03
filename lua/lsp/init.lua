-- Import all LSPs
local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp"
for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
  if file:sub(-4) == ".lua" and file ~= "init.lua" then
    require("lsp." .. file:sub(1, -5)) -- removes `.lua`
  end
end

-- Enable LSPs
vim.lsp.enable({'basedpyright', 'roslyn_ls', 'lua_ls'})

-- Enable Auto Completion
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
