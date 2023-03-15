local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.api.nvim_set_keymap(
   "n",
   "<space>fb",
   "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
   {noremap = true}
)
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--require("telescope").setup {
--  extensions = {
--    file_browser = {
--      theme = "ivy",
--      -- disables netrw and use telescope-file-browser in its place
--      hijack_netrw = true,
--      mappings = {
--        ["i"] = {
--          -- your custom insert mode mappings
--        },
--        ["n"] = {
--          -- your custom normal mode mappings
--        },
--      },
--    },
--  },
--}
--require("telescope").load_extension "file_browser"
