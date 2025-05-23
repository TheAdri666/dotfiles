return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- Import comment plugin safely.
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- Enable comment.
    comment.setup({
      -- For commenting tsx, jsx, svelte, html files.
      pre_hook = ts_context_commentstring.create_pre_hook(),
      padding = false,
      sticky = false,
      ignore = "none",
      mappings = {
        basic = true,
        extra = true,
        extended = true,
      },
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      post_hook = function() end,
    })
  end,
}
