-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
local plugin_conf = require "custom.plugins.configs"

M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the strucutre of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

M.options = {
   -- NeoVim/Vim options
   clipboard = "unnamedplus",
   cmdheight = 1,
   ruler = false,
   hidden = true,
   ignorecase = true,
   mapleader = " ",
   mouse = "a",
   number = true,
   -- relative numbers in normal mode tool at the bottom of options.lua
   numberwidth = 2,
   relativenumber = true,
   expandtab = true,
   shiftwidth = 2,
   smartindent = true,
   tabstop = 2, -- Number of spaces that a <Tab> in the file counts for
   timeoutlen = 400,
   -- interval for writing swap file to disk, also used by gitsigns
   updatetime = 250,
   undofile = true, -- keep a permanent undo (across restarts)
   -- NvChad options
   nvChad = {
      copy_cut = true, -- copy cut text ( x key ), visual and normal mode
      copy_del = true, -- copy deleted text ( dd key ), visual and normal mode
      insert_nav = true, -- navigation in insertmode
      window_nav = true,
      theme_toggler = false,
      -- used for updater
      update_url = "https://github.com/NvChad/NvChad",
      update_branch = "main",
   },
}

-- ui configs
M.ui = {
   italic_comments = false,
   -- theme to be used, check available themes with `<leader> + t + h`
   theme = "chadracula",
   -- toggle between two themes, see theme_toggler mappings
   theme_toggler = {
      "chadracula",
      "tokyonight",
   },
   -- Enable this only if your terminal has the colorscheme set which nvchad uses
   -- For Ex : if you have onedark set in nvchad, set onedark's bg color on your terminal
   transparency = false,
}

-- NvChad included plugin options & overrides

-- these are plugin related options
M.plugins = {
   -- enable and disable plugins (false for disable)
      status = {
      autosave = false, -- to autosave files
      blankline = true, -- show code scope with symbols
      bufferline = true, -- list open buffers up the top, easy switching too
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      comment = true, -- easily (un)comment code, language aware
      dashboard = true, -- NeoVim 'home screen' on open
      esc_insertmode = true, -- map to <ESC> with no lag
      feline = true, -- statusline
      gitsigns = true, -- gitsigns in statusline
      lspsignature = true, -- lsp enhancements
      neoscroll = true, -- smooth scroll
      telescope_media = true, -- media previews within telescope finders
      truezen = true, -- distraction free & minimalist UI mode
      vim_matchup = true, -- % operator enhancements
      cmp = true,
   },
   options = {
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig", -- path of file containing setups of different lsps
      },
      nvimtree = {
         enable_git = 0,
      },
      luasnip = {
         snippet_path = {},
      },
      statusline = { -- statusline related options
         -- these are filetypes, not pattern matched
         -- shown filetypes will overrule hidden filetypes
         hidden = {
            "NvimTree",
            "terminal",
         },
         shown = {
            "dashboard",
            "help",
         },
         -- default, round , slant , block , arrow
         style = "arrow",
      },
      autosave = false, -- autosave on changed text or insert mode leave
      -- timeout to be used for using escape with a key combination, see mappings.plugins.better_escape
      esc_insertmode_timeout = 300,
   },
   default_plugin_config_replace = {
     nvim_treesitter = plugin_conf.treesitter,
     nvim_tree = plugin_conf.nvimtree,
   },
}

M.mappings = {
   -- custom = {}, -- all custom user mappings
   -- close current focused buffer
   close_buffer = "<leader>x",
   copy_whole_file = "<C-a>", -- copy all contents of the current buffer
   line_number_toggle = "<leader>n", -- show or hide line number
   new_buffer = "<S-t>", -- open a new buffer
   new_tab = "<C-t>b", -- open a new vim tab
   save_file = "<C-s>", -- save file using :w
   theme_toggler = "<leader>tt", -- for theme toggler, see in ui.theme_toggler
   -- navigation in insert mode, only if enabled in options
   insert_nav = {
      backward = "<C-h>",
      end_of_line = "<C-e>",
      forward = "<C-l>",
      next_line = "<C-k>",
      prev_line = "<C-j>",
      top_of_line = "<C-a>",
   },
   --better window movement
   window_nav = {
      moveLeft = "<C-h>",
      moveRight = "<C-l>",
      moveUp = "<C-k>",
      moveDown = "<C-j>",
   },
   -- terminal related mappings
   terminal = {
      -- multiple mappings can be given for esc_termmode and esc_hide_termmode
      -- get out of terminal mode
      esc_termmode = { "jk" }, -- multiple mappings allowed
      -- get out of terminal mode and hide it
      esc_hide_termmode = { "JK" }, -- multiple mappings allowed
      -- show & recover hidden terminal buffers in a telescope picker
      pick_term = "<leader>W",
      -- below three are for spawning terminals
      new_horizontal = "<leader>h",
      new_vertical = "<leader>v",
      new_window = "<leader>w",
   },
   -- update nvchad from nvchad, chadness 101
   update_nvchad = "<leader>uu",
}

-- all plugins related mappings
M.mappings.plugins = {
   -- list open buffers up the top, easy switching too
   bufferline = {
      next_buffer = "<TAB>", -- next buffer
      prev_buffer = "<S-Tab>", -- previous buffer
   },
   -- easily (un)comment code, language aware
   comment = {
      toggle = "<leader>/", -- toggle comment (works on multiple lines)
   },
   -- NeoVim 'home screen' on open
   dashboard = {
      bookmarks = "<leader>bm",
      new_file = "<leader>fn", -- basically create a new buffer
      open = "<leader>db", -- open dashboard
      session_load = "<leader>l", -- load a saved session
      session_save = "<leader>s", -- save a session
   },
   -- map to <ESC> with no lag
   better_escape = { -- <ESC> will still work
      esc_insertmode = { "jk" }, -- multiple mappings allowed
   },
   -- file explorer/tree
   nvimtree = {
      toggle = "<C-b>",
      focus = "<leader>e",
   },
   -- multitool for finding & picking things
   telescope = {
      buffers = "<leader>fb",
      find_files = "<leader>ff",
      find_hiddenfiles = "<leader>fa",
      git_commits = "<leader>cm",
      git_status = "<leader>gt",
      help_tags = "<leader>fh",
      live_grep = "<leader>fw",
      oldfiles = "<leader>fo",
      themes = "<leader>th", -- NvChad theme picker
      -- media previews within telescope finders
      telescope_media = {
         media_files = "<leader>fp",
      },
   },
}

return M
