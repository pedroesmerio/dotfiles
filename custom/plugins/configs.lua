local M = {}

M.treesitter = {
   ensure_installed = {
      "lua",
      "vim",
      "html",
      "css",
      "javascript",
      "markdown",
      "json",
      "toml",
      "c",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

return M
