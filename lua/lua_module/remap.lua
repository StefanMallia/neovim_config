vim.g.mapleader = " "


vim.keymap.set("n", "<silent> <Esc>", ":noh<Cr><Esc>")

--copy for system clipboard
vim.keymap.set("", "<C-c>", "\"+y", { noremap = true})

vim.keymap.set("", "ZZ", "Nop")

--For home button to go to first non-blank character
vim.keymap.set("", "<Home>", "^", { noremap = true})
vim.keymap.set("i", "<Home>", "<Esc>^i", { noremap = true})

--Mapping save button
vim.keymap.set("n", "<C-s>", "<Esc>:w<Cr>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<Cr>")

--Mapping exit button
vim.keymap.set("n", "<C-q>", "<Esc>:q<Cr>")
vim.keymap.set("i", "<C-q>", "<Esc>:q<Cr>")

--For changing tabs left and right
vim.keymap.set("n", "<C-H>", "<C-PageUp>")
vim.keymap.set("n", "<C-L>", "<C-PageDown>")

--mapping <C-L> does not work in netrw as it is overwritten by its own mappings
--this line overwrites that mapping again
vim.cmd [[autocmd filetype netrw nmap <buffer> <C-L> <C-PageDown>]]
--to open new tabs in explorer
vim.cmd [[let g:netrw_browse_split = 3]]

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>0")
vim.keymap.set("n", "<leader>newtab", ":Texplore<CR>")
vim.keymap.set("n", "<leader>te", ":Texplore<CR>")


--Open new gnome terminal at current directory
vim.keymap.set("n", "<leader>terminal", ':cd %:p:h <bar> !gnome-terminal -- bash -c "exec bash;"<CR><ESC>')
