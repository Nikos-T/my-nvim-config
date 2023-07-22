local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed {
	'tsserver',
	'eslint',
	'lua_ls',
	'rust_analyzer',
    'move_analyzer'
}

-- Fix Undefined global 'vim'
-- lsp.configure('lua_ls', {
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { 'vim' }
-- 			}
-- 		}
-- 	}
-- })


-- Diagnostics
local opts = { noremap=true, silent=true }
opts.desc = "Open diagnostics float"
vim.keymap.set('n', '<leader>t', vim.diagnostic.open_float, opts)
opts.desc = "Go to next diagnostic"
vim.keymap.set('n', '[t', vim.diagnostic.goto_prev, opts)
opts.desc = "Go to prev diagnostic"
vim.keymap.set('n', ']t', vim.diagnostic.goto_next, opts)
opts.desc = "Open diagnostics loclist"
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- on_attach(client, bufnr)
local on_attach = function(_, bufnr)
	print("on_attach (general)")

	-- Mappings
	local bufopts = { noremap=true, silent=true, buffer=bufnr }

    bufopts.desc = "Go to declaration"
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    bufopts.desc = "Go to definition"
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>w', vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    bufopts.desc = "Go to implementation"
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    bufopts.desc = "Signature help"
	vim.keymap.set('n', '<leader>sig', vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<leader>wl', function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
    bufopts.desc = "Type definition"
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    bufopts.desc = "Rename symbol"
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    bufopts.desc = "Code actions"
	vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
    bufopts.desc = "References"
	vim.keymap.set('n', '<leader>ref', vim.lsp.buf.references, bufopts)
	-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig')['rust_analyzer'].setup({
	-- on_attach(client, bufnr)
	on_attach = function(_, bufnr)
		print("on_attach (rust)")

		local rt = require('rust-tools')
		-- Hover actions
		vim.keymap.set("n", "<leader>w", rt.hover_actions.hover_actions, { buffer = bufnr, desc = "Hover actions" })
		-- Code action groups
		vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr, desc = "Code actions" })
		-- Inlay hints
		vim.keymap.set("n", "<leader>ih", rt.inlay_hints.enable, { desc = "Inlay hints" })
		vim.keymap.set("n", "<leader>nih", rt.inlay_hints.disable, { desc = "No inlay hints" })
		-- rustfmt on save
		vim.g.rustfmt_autosave = 1
		-- vim.keymap.set("n", ":w", ":w|:!cargo fmt")
	end
})

require('lspconfig')['tsserver'].setup({
    on_attach = on_attach
})

require('lspconfig')['move_analyzer'].setup({
    on_attach = on_attach,
    cmd = { "~/.cargo/bin/move-analyzer" }
})

lsp.on_attach = on_attach
lsp.setup()

local cmp = require('cmp')
cmp.setup({
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<Tab>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		['<C-Space>'] = cmp.mapping.complete(),
	}
})
