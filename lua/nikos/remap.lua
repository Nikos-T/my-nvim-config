vim.g.mapleader = " "

-- Move visual lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- J takes the below line and appends it in current. Do not move cursor when that happens
-- vim.keymap.set("n", "J", "mzJ`z")
--
-- When moving up/down keep in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When searching keep in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Do not overwrite the register with the word selected when pasting
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without resetting buffer" })

-- <leader>y will yank to the clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })

-- Use <leader>d to not store d into the register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete and forget" })

-- On control visual C-c same as Esc
--vim.keymap.set("i", "<C-c>", "<Esc>")

-- Q worst place in the universe
vim.keymap.set("n", "Q", "<nop>")
-- Recent projects
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")
-- LSP format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

-- quick fix navigation
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace all current word
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
-- make current file executable
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
--vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)
--

-- move between windows
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)

-- Vimspector
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
]])

-- vim.keymap.set("n", "<F9>", "<cmd>call vimspector#Launch()<cr>")
-- vim.keymap.set("n", "<F5>", "<cmd>call vimspector#StepOver()<cr>")
-- vim.keymap.set("n", "<F8>", "<cmd>call vimspector#Reset()<cr>")
-- vim.keymap.set("n", "<F11>", "<cmd>call vimspector#StepOver()<cr>")
-- vim.keymap.set("n", "<F12>", "<cmd>call vimspector#StepOut()<cr>")
-- vim.keymap.set("n", "<F10>", "<cmd>call vimspector#StepInto()<cr>")
-- map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
-- map('n', "Dw", ":call vimspector#AddWatch()<cr>")
-- map('n', "De", ":call vimspector#Evaluate()<cr>")

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
