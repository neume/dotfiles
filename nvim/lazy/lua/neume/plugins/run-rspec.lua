return {
  'itmammoth/run-rspec.vim',
  config = function()
    local keymap = vim.keymap

    keymap.set('n', '<leader>a', ':RunSpecAll<CR>', { noremap = true })
    keymap.set('n', '<leader>r', ':RunSpec<CR>', { noremap = true })
    keymap.set('n', '<leader>l', ':RunSpecLine<CR>', { noremap = true })
    keymap.set('n', '<leader>e', ':RunSpecLastRun<CR>', { noremap = true })
    keymap.set('n', '<leader>cr', ':RunSpecCloseResult<CR>', { noremap = true })

    vim.g.run_rspec_bin = 'bundle exec rspec'
  end,
}
