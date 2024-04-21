return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    local mason = require('mason')

    local mason_lspconfig = require('mason-lspconfig')

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        'html',
        'emmet_ls',
        'cssls',
        'tailwindcss',
        'lua_ls',
        'ruby_ls',
        -- 'rubocop',
        'yamlls',
      },
      automatic_installation = true,
    })
  end,
}
