vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line numbers.
opt.relativenumber = true -- See line number relative to current line.
opt.number = true -- See absolute line number of the current line.

-- Tabs and indentation.
opt.tabstop = 2 -- 2 spaces for tabs.
opt.shiftwidth = 2 -- 2 spaces for indent width.
opt.expandtab = true -- Expand tab to spaces.
opt.autoindent = true -- Copy indent from current line when starting a new one.

-- Line style
opt.wrap = false -- Don't wrap line overflow.

-- Search.
opt.ignorecase = true -- Ignore case when searching.
opt.smartcase = true -- Don't ignore case when using mixed casing.


-- Appearance.
opt.termguicolors = true -- Use colors in terminal gui.
opt.background = "dark" -- Color schemes with light or dark support will be made dark.
opt.signcolumn = "yes" -- Show sign column.

-- Backspace.
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position.

-- Clipboard.
opt.clipboard:append("unnamedplus") -- Use system clipboard as default register.

-- Split windows.
opt.splitright = true -- Split vertical window to the right.
opt.splitbelow = true -- Split horizontal window to the bottom.
