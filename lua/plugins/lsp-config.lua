return {
    {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
	    { "mason-org/mason.nvim", opts = {} },
	    "neovim/nvim-lspconfig",
	    "davidhalter/jedi-vim"
	},
	config = function()
	    require("mason-lspconfig").setup({
		ensure_installed = {
		    "lua_ls",
		    "pylsp",
		    "clangd"
		}
	    })
	end
    },
--    {
--	"davidhalter/jedi-vim",
--	config = function()
--	    vim.keymap.set("n", "<leader>d", ":lua vim.lsp.buf.format() <CR>")
--	    vim.g.jedi_goto_command = ""
--	    vim.g.jedi_goto_assignments_command = ""
--	    vim.g.jedi_goto_stubs_command = ""
--	    vim.g.jedi_goto_definitions_command = ""
--	    vim.g.jedi_documentation_command = ""
--	    vim.g.jedi_usages_command = ""
--	    vim.g.jedi_rename_command = ""
--	    vim.g.jedi_rename_command_keep_name = ""
--	    vim.g.jedi_auto_initialization = 0
--	    vim.g.jedi_auto_vim_configuration = 0
--	end
  --  },
    {
	"neovim/nvim-lspconfig",
	config = function()
	    vim.lsp.enable('pylsp')
	    vim.lsp.config('pylsp', {
		settings = {
--		    pylsp = {
			pylsp = {
			  plugins = {
			    pycodestyle = {
				maxLineLength = 100,
				enabled = true
			    },
			    jedi = {
				enabled = false
			    },
			    jedi_completion = {
				enabled = true,
			    eager = true,
				fuzzy = true
			    },
			    jedi_definition = {
				enabled = false
			    },
			    jedi_hover = {
				enabled = false
			    }
			}
			}
--		    }
		}
	    })
	    vim.keymap.set("n", "<leader>d", ":lua vim.lsp.buf.format() <CR>")
	    vim.keymap.set("n", "<leader>d", ":lua vim.lsp.buf.format() <CR>")
	    vim.g['jedi#completions_enabled'] = 1
	    --vim.g["jedi#completions_command"] = "<C- >"
	end
    }
}
