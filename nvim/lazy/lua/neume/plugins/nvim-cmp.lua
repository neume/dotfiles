return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "rafamadriz/friendly-snippets", --useful snippets
  },
  config = function()
    local cmp = require('cmp')
 
    local luasnip = require('luasnip')

    local lspkind = require('lspkind')

    require("luasnip.loaders.from_vscode").lazy_load()


    
    cmp.setup({
      completion = {
        completionopt = "menu,menuone,preview,noselect",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidjh = 50,
          ellipsis_char = "...",
        }),
      }
    })
  end,
}
