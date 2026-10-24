-- Plugin-specific mappings live with their plugin spec (lua/plugins/*.lua),
-- the terminal toggle lives in lua/fixed_terminal.lua.
-- vim.keymap.set is non-recursive by default, so `noremap = true` is not needed.

-- Switching between tabs
vim.keymap.set('n', '<Tab>', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>', { silent = true })

-- Switching between window splits
vim.keymap.set('n', '<A-Left>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<A-Down>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<A-Up>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<A-Right>', '<C-w>l', { silent = true })

-- Switching from terminal mode to normal mode
vim.keymap.set("t", "<C-]>", [[<C-\><C-n>]], { silent = true })

-- Scrolling half a page up or down
vim.keymap.set("n", "<C-j>", "<C-d>", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-u>", { silent = true })
