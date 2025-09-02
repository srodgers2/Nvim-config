return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module "neo-tree"
	---@type neotree.Config?
	config = function()
		vim.keymap.set('n', '<C-`>', ':Neotree toggle<CR>', {})
		vim.keymap.set('n', '<leader>`', ':Neotree<CR>', {})
	end
}
