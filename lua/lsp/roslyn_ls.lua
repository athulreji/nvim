-- vim.lsp.config['roslyn_ls'] = {
--   cmd = {
--      'dotnet',
--      vim.fn.expand("~") .. "/roslyn/linux-x64/Microsoft.CodeAnalysis.LanguageServer.dll",
--      '--logLevel',
--      'Information',
--      '--extensionLogDirectory',
--      vim.fs.joinpath(vim.uv.os_tmpdir(), 'roslyn_ls/logs'),
--      '--stdio',
--   },
--   filetypes = { 'cs' },
-- }
local sysname = vim.uv.os_uname().sysname
local is_windows = sysname == "Windows_NT"

local path_to_add = vim.fn.expand("~") .. (is_windows and "\\roslyn\\win-x64" or "/roslyn/linux-x64")
local current_path = vim.env.PATH or ""
local separator = is_windows and ";" or ":"

if not current_path:find(vim.pesc(path_to_add), 1, true) then
  vim.env.PATH = current_path .. (current_path ~= "" and separator or "") .. path_to_add
end
