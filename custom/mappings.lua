local map = require("core.utils").map

-- Vim fugitive
map("n", "<leader>gs", ":Git <CR>")
map("n", "<leader>gb", ":Git blame <CR>")
map("n", "<leader>gc", ":Gclog <CR>")
map("n", "<leader>gh", ":diffget //2 <CR>")
map("n", "<leader>gl", ":diffget //3 <CR>")

-- telescope
map("n", "<leader>fp", ":Telescope media_files <CR>")
map("n", "<leader>te", ":Telescope <CR>")

-- truezen
map("n", "<leader>ta", ":TZAtaraxis <CR>")
map("n", "<leader>tm", ":TZMinimalist <CR>")
map("n", "<leader>tf", ":TZFocus <CR>")
