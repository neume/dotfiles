return {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("chatgpt").setup({
        -- api_key_cmd = "your key"
      })

      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }

      keymap.set('n', '<leader>cg', ':ChatGPT<CR>', opts)
    end,
  }
