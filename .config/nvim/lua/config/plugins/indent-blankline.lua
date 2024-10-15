return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowOrange",
      "RainbowYellow",
      "RainbowGreen",
      "RainbowCyan",
      "RainbowBlue",
      "RainbowViolet",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E7202E" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FC8403" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FBDF1E" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#00FF5D" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#03D3FC" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0D5CDD" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#940CEE" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }

    require("ibl").setup({
      indent = {
        highlight = highlight,
        char = "▏",
      },
      scope = { enabled = false },
    })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
