-- Define an `on_attach` function to set up keybindings after LSP attaches to the current buffer
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- LSP actions
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)      -- Go to definition
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)     -- Go to declaration
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)            -- Hover documentation
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)  -- Go to implementation
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)      -- Find references
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)  -- Rename symbol
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code action
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)   -- Format document
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)    -- Go to previous diagnostic
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)    -- Go to next diagnostic
--  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts) -- Show diagnostics in a floating window
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts) -- Add diagnostics to quickfix list
  vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next, opts) -- Go to previous diagnostic
  vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev, opts) -- Go to previous diagnostic 
  vim.keymap.set('n', '<leader>lo', vim.diagnostic.open_float, opts) -- Show diagnostics in a floating window
  vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
      vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
      }) end) -- Toggle diagnostic visibility
end

local servers = { 'clangd', 'pylsp', 'tsserver', 'rust_analyzer' }

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

