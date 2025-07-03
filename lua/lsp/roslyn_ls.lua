vim.lsp.config['roslyn_ls'] = {
  cmd = {
     'dotnet',
     vim.fn.expand("~") .. "/roslyn/linux-x64/Microsoft.CodeAnalysis.LanguageServer.dll",
     '--logLevel',
     'Information',
     '--extensionLogDirectory',
     vim.fs.joinpath(vim.uv.os_tmpdir(), 'roslyn_ls/logs'),
     '--stdio',
  },
  filetypes = { 'cs' },
}
