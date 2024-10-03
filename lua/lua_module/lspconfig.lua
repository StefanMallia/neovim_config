require("lspconfig").clangd.setup({
  on_attach = function()
  end
})

require'lspconfig'.pylsp.setup{}

local isLspDiagnosticsVisible = false
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    }) end)

vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible
})

vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>lo", vim.diagnostic.open_float)


