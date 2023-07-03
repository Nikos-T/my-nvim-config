-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},	-- Required
			{			  	-- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(function() vim.cmd [[MasonUpdate]] end)
				end,
			},
			{'williamboman/mason-lspconfig.nvim'},	-- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},		-- Required
			{'hrsh7th/cmp-nvim-lsp'},	-- Required
			{'L3MON4D3/LuaSnip'},		-- Required
		}
	}
	-- rust tools configured in after/plugins/lsp.lua
	use 'simrat39/rust-tools.nvim'

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or							, branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- colorscheme material
	use 'marko-cerovac/material.nvim'

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	-- undotree
	use 'mbbill/undotree'

	-- vim-fugitive
	use 'tpope/vim-fugitive'

	-- which key
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- copilot 
	use 'github/copilot.vim'

	-- float-term
	use 'voldikss/vim-floaterm'

	-- multi-cursor
	use 'mg979/vim-visual-multi'

	-- trouble
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				--
				-- position = "left", -- position of the list can be: bottom, top, left, right
				position = "bottom"
			}
		end
	}

	-- nvim-tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
		config = function()
			require'nvim-tree'.setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				view = {
					side = "right"
				},
				filters = {
					dotfiles = false
				},
				git = {
					enable = true,
					ignore = false
				}
			}
		end
	}

    -- command completion
    use 'smolck/command-completion.nvim'

end)
