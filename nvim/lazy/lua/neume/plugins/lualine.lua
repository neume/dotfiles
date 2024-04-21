return {
  'nvim-lualine/lualine.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')
    local lazy_status = require('lazy.status')

    lualine.setup {
      options = {
        theme = 'catppuccin',
        icons_enabled = true,
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        -- lualine_y = {'progress'},
        lualine_x = {
          {
            lazy_status.update,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e65' },
          },
        },
        lualine_y = {'encoding', 'fileformat', 'filetype'},
        lualine_z = {'location'},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    }
  end,
}
