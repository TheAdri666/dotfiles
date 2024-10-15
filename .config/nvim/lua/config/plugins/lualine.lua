return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- To configure lazy pending updates count
    local colors = {
      bg = "#2F2F2F",
      fg = "#ABB2BF",
      red = "#F85151",
      green = "#3AF249",
      yellow = "#EFE07A",
      blue = "#3A78FF",
      purple = "#AE81FF",
      cyan = "#14B9FA",
      gray = "#C0C0C0",
    }

    local adri_theme = {
      inactive = {
        a = { fg = colors.gray, bg = colors.bg, gui = "bold" },
        b = { fg = colors.gray, bg = colors.bg },
        c = { fg = colors.gray, bg = colors.bg },
      },
      normal = {
        a = { fg = colors.bg, bg = colors.green, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
      visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
      replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
      insert = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
      command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
      terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
    }

    -- Configure lualine with modified theme.
    lualine.setup({
      options = {
        theme = adri_theme,
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
