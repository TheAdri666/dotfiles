return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  config = function()
    -- Import mason.
    local mason = require("mason")

    -- Import mason-lspconfig.
    local mason_lspconfig = require("mason-lspconfig")

    -- Import mason-tool-installer.
    local mason_tool_installer = require("mason-tool-installer")

    -- Enable mason and configure icons.
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
      -- List of servers for mason to install.
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "pyright",
        "angularls",
        "awk_ls",
        "bashls",
        "azure_pipelines_ls",
        "csharp_ls",
        "clangd",
        "clojure_lsp",
        "cmake",
        "dockerls",
        "elixirls",
        "elp",
        "eslint",
        "jsonls",
        "julials",
        "kotlin_language_server",
        "markdown_oxide",
        "phpactor",
        "ruby_lsp",
        "ast_grep",
        "sqlls",
        "vuels",
        "gitlab_ci_ls"
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- Prettier formatter.
        "stylua", -- Lua formatter.
        "isort", -- Python formatter.
        "black", -- Python formatter.
        "pylint",
        "eslint_d",
      },
    })
  end
}
