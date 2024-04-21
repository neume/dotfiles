return {
  'weizheheng/ror.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    vim.keymap.set("n", "<Leader>rc", ":lua require('ror.commands').list_commands()<CR>", { silent = true })
  end
}
