vim.g.mapleader = " "


local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sr", "<C-w>R")
keymap.set("n", "<leader>sx", "<cmd>close<CR>")

keymap.set("n", "<leader>p",
           function()
             vim.api.nvim_call_function("setreg",
                                        { "+", vim.fn.fnamemodify(
                                          vim.fn.expand("%"), ":.") })
             vim.notify("Copied path to the clipboard!")
           end)

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>",
           { desc = "Telescope find files" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>",
           { desc = "Telescope buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",
           { desc = "Telescope help tags" })

keymap.set("n", "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>",
           { desc = "see code declaration" })
keymap.set("n", "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<CR>",
           { desc = "see coede implementation" })
keymap.set("n", "<leader>cf", vim.lsp.buf.format)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
keymap.set("n", "<leader>cr", vim.lsp.buf.rename)

keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
keymap.set("t", "jk", "<C-\\><C-N>", { noremap = true, silent = true })

vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { silent = true })

keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")

-- local state = "esc"
keymap.set("n", "q", "<Esc>")
keymap.set("n", "Q", "q")
-- keymap.set("n", "Q", function()
--   if state == "esc" then
--     state = "q"
--     keymap.set("n", "q", "q")
--     vim.notify("Q mode changed to default")
--   else
--     state = "esc"
--     keymap.set("n", "q", "<Esc>")
--     vim.notify("Q mode changed to esc")
--   end
-- end)

keymap.set("n", "<leader>fg", "<cmd>Easypick changed_files<CR>")

keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>",
           { desc = "Toggle file explorer" })                 -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>",
           { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>",
           { desc = "Collapse file explorer" })               -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>",
           { desc = "Refresh file explorer" })                -- refresh file explorer


keymap.set("n", "<leader>go", "<cmd>GitGutterDiffOrig<CR>",
           { desc = "Toggle file explorer" })                 -- toggle file explorer
keymap.set("n", "<leader>gt", "<cmd>GitGutterLineNrHighlightsToggle<CR>",
           { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file

vim.keymap.set("n", "<space>dq", vim.diagnostic.open_float, bufopts)
