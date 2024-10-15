return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- To configure lazy pending updates count
    local c = require('onedark.colors')
    local cfg = vim.g.onedark_config
    local colors = {
      bg = c.bg0,
      fg = c.fg,
      red = c.red,
      green = c.green,
      yellow = c.yellow,
      blue = c.blue,
      purple = c.purple,
      cyan = c.cyan,
      gray = c.grey
    }

    local one_dark = {
      inactive = {
        a = { fg = colors.gray, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.gray, bg = colors.bg },
        c = { fg = colors.gray, bg = cfg.lualine.transparent and c.none or c.bg1 },
      },
      normal = {
        a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
        b = { fg = colors.fg, bg = c.bg3 },
        c = { fg = colors.fg, bg = cfg.lualine.transparent and c.none or c.bg1 },
      },
      visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
      replace = { a = { fg = colors.bg, bg = colors.red, gui = 'bold' } },
      insert = { a = { fg = colors.bg, bg = colors.blue, gui = 'bold' } },
      command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
      terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
    }

    -- Configure lualine with modified theme.
    lualine.setup({
      options = {
        theme = one_dark,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
