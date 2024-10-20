-- Define an `on_attach` function to set up keybindings after LSP attaches to the current buffer
local on_attach = function(_, bufnr)
  -- LSP actions (non-leader keys)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to Definition", buffer = bufnr })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to Declaration", buffer = bufnr })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Go to Implementation", buffer = bufnr })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true, desc = "Find References", buffer = bufnr })

  -- Register leader key mappings for LSP with descriptions
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action", buffer = bufnr })
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format Document", buffer = bufnr })
  vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Next Diagnostic", buffer = bufnr })
  vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Previous Diagnostic", buffer = bufnr })
  vim.keymap.set('n', '<leader>lo', vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Show Diagnostic - Open Float", buffer = bufnr })
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename Symbol", buffer = bufnr })
  vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover Documentation", buffer = bufnr })
  vim.keymap.set('n', '<leader>lx', function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
      virtual_text = isLspDiagnosticsVisible,
      underline = isLspDiagnosticsVisible,
    })
    vim.notify("Diagnostics " .. (isLspDiagnosticsVisible and "enabled" or "disabled"))
  end, { noremap = true, silent = true, desc = "Toggle Diagnostics", buffer = bufnr })

  -- Diagnostics to quickfix list
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "Add to Quickfix List", buffer = bufnr })
end


local servers = { 'clangd', 'pylsp', 'ts_ls', 'rust_analyzer' }


for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup({
    on_attach = on_attach,
  })
end

-- Initially disable diagnostics
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})


for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup({
    on_attach = on_attach
  })
end


local isLspDiagnosticsVisible = false

vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible
})

