return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag"
  },
  config = function()
    -- Import nvim-treesitter plugin.
    local treesitter = require("nvim-treesitter.configs")

    -- Configure treesitter.
    treesitter.setup({
      -- Highlight text.
      highlight = {
        enable = true
      },
      -- Enable indentation
      indent = {
        enable = true
      },
      -- Enable autotagging using nvim-ts-autotag plugin.
      autotag = {
        enable = true
      },
      -- Ensure these language parsers are installed.
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "awk",
        "cmake",
        "clojure",
        "csv",
        "dart",
        "diff",
        "elixir",
        "erlang",
        "fish",
        "gitignore",
        "gleam",
        "go",
        "groovy",
        "haskell",
        "java",
        "jsdoc",
        "jsonc",
        "julia",
        "kotlin",
        "lua",
        "luadoc",
        "make",
        "nginx",
        "ocaml",
        "perl",
        "php",
        "phpdoc",
        "python",
        "regex",
        "ruby",
        "rust",
        "scala",
        "scss",
        "sparql",
        "sql",
        "sxhkdrc",
        "toml",
        "vue",
        "yuck",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>"
        }
      }
    })
  end
}
