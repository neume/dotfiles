return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', ':Git<CR>', {noremap = true})
    vim.keymap.set('n', '<leader>gc', ':Gcommit<CR>', {noremap = true})
  end,
}
