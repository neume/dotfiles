return {
  'laytan/cloak.nvim',
  config = function()
    require('cloak').setup({
      enabled = true,
      cloak_character = '*',
      highlight_group = 'Comment',
      cloak_length = 20,
      patterns = {
        {
          file_pattern = {
            '.env*',
            '.*'
          },
          cloak_pattern = '=.+',
          replace = nil,
        }
      }
    })
  end
}
