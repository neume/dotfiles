return {
  -- {
  --   "bluz71/vim-nightfly-guicolors",
  --   -- enable = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme nightfly]])
  --   end,
  -- },
  {
    'morhetz/gruvbox',
    enable = false,
    -- config = function()
      -- vim.cmd([[colorscheme gruvbox]])
    -- end,
  },
  -- {
  --   'rose-pine/neovim',
  --   config = function()
  --     vim.cmd([[colorscheme rose-pine]])
  --   end
  -- },
  {
    'catppuccin/nvim',
    config = function()
      local catppuccin = require('catppuccin')

      catppuccin.setup({
        flavour = 'macchiato',
      })

      vim.cmd([[colorscheme catppuccin]])
    end
  },
}
