--[[ lvim is the global options object Linters should be filled in as strings with either a global executable or a path to an executable ]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dracula"
lvim.transparent_window = true
lvim.format_on_save = true
vim.opt.relativenumber = true


lvim.builtin.treesitter.rainbow.enable = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false

-- edit a default keymapping
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

lvim.builtin.lualine.options.theme = "dracula"

lvim.builtin.lualine.options.section_separators = { left = "", right = "" }

lvim.builtin.lualine.sections.lualine_a = { "mode" }

lvim.builtin.which_key.mappings["x"] = { "<cmd>BufferKill<CR>", "Close Buffer" }

-- Adding one line to load the LazyGit window
lvim.builtin.which_key.mappings["g"] = {
  name = "Git",
  g = { "<cmd>LazyGit<cr>", "Load LazyGit" },
  j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
  k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
  l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
  p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  u = {
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    "Undo Stage Hunk",
  },
  o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  C = {
    "<cmd>Telescope git_bcommits<cr>",
    "Checkout commit(for current file)",
  },
  d = {
    "<cmd>Gitsigns diffthis HEAD<cr>",
    "Git Diff",
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

lvim.builtin.which_key.mappings["z"] = {
  name = "ZenMode",
  a = { "<cmd>TZAtaraxis<cr>", "Ataraxis Mode" },
  m = { "<cmd>TZFocus<cr>", "Focus Mode" },
  f = { "<cmd>TZMinimalist<cr>", "Minimalist Mode" },
  f = { "<cmd>TZFocus<cr>", "Focus Mode" },
  m = { "<cmd>TZMinimalist<cr>", "Minimalist Mode" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- dashboard configuration for alpha plugin
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.alpha.dashboard.section.header.val = {
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠀⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⠁⡈⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣷⡄⠀⠀⠀⠀⠀⢀⡼⠋⠀⠀⢰⡌⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣦⡀⠀⠀⣠⡟⠁⠀⣠⣤⣼⣷⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣦⣴⡟⠀⢸⣾⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⡿⠿⠀⢸⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⠶⠟⠋⣱⡟⢿⣿⡿⣷⡄⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⢠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣤⣌⡀⠀⢰⣿⡄⠈⠻⡇⠹⣿⣷⣤⡀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⢸⣿⣿⡟⢋⣥⠶⢋⣡⣤⣼⣿⣿⣿⣿⣷⣝⠳⣾⣿⣷⣄⠀⠁⠀⢻⣿⣿⣿⣄⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⣼⣿⠟⣠⣿⣷⣿⣿⣿⣿⣿⣿⣷⣶⣤⣀⣉⡁⠈⠻⣿⣿⣷⣄⠀⠘⠿⢿⣿⣿⣧⡀⠀                          ';
  '                        ⠀⠀⢀⣤⣾⣫⣶⣿⣿⣿⡿⠿⠿⠛⠿⠿⣿⣿⣿⣿⣿⣷⣬⡙⠲⢬⣿⣿⣿⣷⡀⠀⠀⠈⠙⢿⣷⡀                          ';
  '                        ⣰⣿⣿⠟⣿⣿⠟⣫⠥⠒⣊⣑⠒⠒⠶⠶⠭⣿⣿⣿⣿⣿⣿⣶⣄⠹⣿⣍⠛⠿⣆⠀⠀⠀⠀⠈⢣⠀                          ';
  '                        ⠘⣿⣧⣾⡫⣖⣯⣷⣾⣭⣤⣀⠀⠀⣴⣶⣶⣶⣾⡿⠿⣿⣿⣿⣿⣷⣽⣿⣷⡀⠈⠃⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠈⠻⢿⣿⢿⣿⠯⢡⣦⣶⣿⢿⣶⢬⡙⠿⣿⣿⣿⣷⣦⣌⡉⠛⢿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠘⢿⠀⠻⡇⠀⠀⠙⢿⡜⣿⠘⣿⣦⡈⢻⣿⣿⣿⣿⣿⣦⣄⠈⠻⣿⣿⣷⡀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡹⣧⡙⢿⣿⡀⣿⣿⡛⠿⡷⣮⡙⠳⡀⠈⢻⣿⡇⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⡘⣿⣾⣿⡇⢹⣿⣿⡀⠈⠊⠻⣆⠀⠀⠀⢻⡗⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⡿⢻⣿⡇⢸⣿⣿⣧⢨⣷⣄⢹⣧⠀⠀⠀⠇⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠲⢤⣮⣁⣸⣿⡇⣼⣿⣿⡟⣼⣿⣿⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠛⠒⠛⠉⢹⡿⣿⠟⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⢸⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                          ';
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀';
  '⠀⠀⠀⠀⠀⣶⣶⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣶⣶⣶⠀⠀⠀⠀⠀⠀⠀⣰⣶⣶⡖⠀⠰⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀';
  '⠀⠀⠀⠀⢠⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡄⠀⠀⠀⠀⠀⣰⣿⣿⠟⠀⠀⠀⠉⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀';
  '⠀⠀⠀⠀⣸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣤⣤⣤⣤⠀⢀⣤⣤⡄⢀⣠⣤⣤⣤⣄⡀⠀⠀⢤⣤⣤⣄⠀⠀⠀⠀⣠⣤⣤⡤⠀⠀⢸⣿⣿⣇⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⣠⣤⣤⣤⡤⠀⢠⣤⣤⡄⣠⣤⣤⣤⣤⣄⠀⣀⣤⣤⣤⣤⣄⠀⠀⠀';
  '⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠾⢿⣿⣿⡟⠀⠀⣿⣿⣿⣿⠿⠿⠿⣿⣿⣷⠀⠀⠈⢿⣿⣿⣆⠀⢠⣾⣿⣿⠟⠀⠀⠀⠈⣿⣿⣿⠀⠀⠀⣰⣿⣿⡏⠀⠀⠀⠿⢿⣿⣿⡇⠀⢸⣿⣿⣿⡿⠿⠿⢿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣷⠀⠀';
  '⠀⠀⠀⢰⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⠃⠀⢠⣿⣿⡟⠀⠀⠀⠀⢸⣿⣿⠃⠀⠀⠀⠻⣿⣿⣶⣿⣿⠟⠁⠀⠀⠀⠀⠀⢻⣿⣿⡆⠀⣴⣿⣿⠏⠀⠀⠀⠀⠀⣾⣿⣿⠀⠀⢸⣿⣿⡏⠀⠀⠀⢠⣿⣿⡟⠀⠀⠀⠀⣿⣿⣿⠀⠀';
  '⠀⠀⠀⣼⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⣸⣿⣿⠃⠀⠀⠀⠀⣿⣿⡿⠀⠀⠀⠀⢀⣽⣿⣿⣿⡁⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣧⣼⣿⣿⠃⠀⠀⠀⠀⠀⢰⣿⣿⡏⠀⠀⣾⣿⣿⠁⠀⠀⠀⣸⣿⣿⠇⠀⠀⠀⢸⣿⣿⡇⠀⠀';
  '⠀⠀⢀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡇⠀⠀⣿⣿⣿⠀⠀⠀⠀⢠⣿⣿⡇⠀⠀⠀⣠⣿⣿⡿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⣸⣿⣿⠇⠀⢠⣿⣿⡟⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⣼⣿⣿⠃⠀⠀';
  '⠀⠀⢸⣿⣿⣷⣶⣶⣶⣶⣶⣶⣶⠆⠀⣾⣿⣿⠁⠀⢸⣿⣿⡇⠀⠀⠀⠀⣸⣿⣿⠁⠀⢠⣾⣿⣿⠟⠀⠘⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⣸⣿⣿⠇⠀⠀⠀⢰⣿⣿⡏⠀⠀⠀⢀⣿⣿⡿⠀⠀⠀';
  '⠀⠀⠾⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠀⠀⠿⠿⠿⠀⠀⠼⠿⠿⠁⠀⠀⠀⠀⠿⠿⠟⠀⠴⠿⠿⠟⠁⠀⠀⠀⠘⠿⠿⠿⠄⠀⠀⠀⠀⠀⠈⠿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠸⠿⠿⠇⠀⠀⠿⠿⠿⠀⠀⠀⠀⠼⠿⠿⠃⠀⠀⠀⠸⠿⠿⠇⠀⠀⠀';
}

lvim.builtin.alpha.dashboard.section.footer.val = { "Personal IDE configuration of pedroesmerio" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "folke/tokyonight.nvim" },
  { "alvan/vim-closetag" },
    "p00f/nvim-ts-rainbow",
    config = function()
      require'nvim-treesitter.configs'.setup{
        rainbow = {
          -- Setting colors
          colors = {
            "#FFD700",
            "#DA70D6",
            "#179fff",
            "#ffd90080",
            "#CC66CC80",
            "#87CEFA80",
            "#ffd90080",
            "#CC66CC80",
            "#87CEFA80",
          },
          -- Term colors
          termcolors = {
            -- Term colors here
            "Red",
            "Green",
            "Yellow",
            "Blue",
            "Magenta",
            "Cyan",
            "White",
          },
        }
      }
    end,
  },
  { "dracula/vim" },
  { "kdheepak/lazygit.nvim" },
  { "pantharshit00/vim-prisma" },
  { "styled-components/vim-styled-components" },
  { "github/copilot.vim" },
  { "terryma/vim-multiple-cursors" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "Pocco81/TrueZen.nvim",
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require ("custom.plugins.truezen")
    end,

  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        names    = true, -- "Name" codes, see https://www.w3schools.com/colors/colors_hex.asp   Blue, HotPink, OldLace, Plum, LightGreen, Coral
        RGB      = true, -- #RGB hex codes                                                      #f0f #FAB
        RRGGBB   = true, -- #RRGGBB hex codes                                                   #ffff00 #FF00FF
        RRGGBBAA = true, -- #RRGGBBAA hex codes                                                 #ffff00ff #AbCdEf
        rgb_fn   = true, -- CSS rgb() and rgba() functions                                      rgb(100,200,50) rgba(255,255,255,1.0) rgb(100%, 0%, 0%)
        hsl_fn   = true, -- CSS hsl() and hsla() functions                                      hsl(120,100%,50%) hsla(20,100%,40%,0.7)
        css      = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode     = 'background'; -- Set the display mode.
      })
    end,
  },
}

-- Load the tailwindcss in the LSP
require("lvim.lsp.manager").setup "tailwindcss"

-- Loads the vscode es7 snippets in the luasnip
-- require("luasnip/loaders/from_vscode").load { paths = { "~/.dotfiles/snippets/vscode-react-javascript-snippets/" } }
require("luasnip/loaders/from_vscode").load { paths = { "~/.dotfiles/snippets/" } }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

require("lvim.lsp.manager").setup "tailwindcss"
