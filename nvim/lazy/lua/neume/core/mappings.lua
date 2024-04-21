local keymap = vim.keymap

-- Create new tab with current file and jump to it
keymap.set('n', '<leader>z', ':tabnew %<CR><C-o>', {noremap = true})

-- Tab navigation
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', {noremap = true})
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', {noremap = true})

vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", {noremap = true})

vim.keymap.set("n", "<leader>hmbg", function() HideMyBackground() end)
