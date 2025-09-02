---@diagnostic disable: undefined-global
---@diagnostic disable-next-line: undefined-global
---
---
--- nvim settings
vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.scrolloff = 10
vim.cmd("set shiftwidth=4")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"





-- lazy packages
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins')


local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>/', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})


local configs = require("nvim-treesitter.configs")

configs.setup({

	ensure_installed = { "lua", "javascript", "python" },
	highlight = { enable = true },
	indent = { enable = true }
})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

require("telescope").setup {

	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
				-- even more opts
			}
		}
	}
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

vim.bufhidden = { "hide" }



--Functions--
local function checkmess()
	local config = vim.diagnostic.config()
	local is_virtual_text_enabled = config.virtual_text
	--    print(is_virtual_text_enabled)
	if is_virtual_text_enabled then
		vim.diagnostic.config({ virtual_text = false })
		print("Virtual Text Disabled")
	else
		vim.diagnostic.config({ virtual_text = true })
		print("Virtual Text Enabled")
	end
end


local function runfile()

	local filetype = vim.bo.filetype
	local filepath = vim.fn.expand('%:p')             -- Get the full path of the current file
	local directory = vim.fn.fnamemodify(filepath, ':h') -- Get the directory of the file
	local filename = vim.fn.expand('%:t:r')

	local write = ":wa"

	vim.cmd(write)

	if filetype == "c" then

		local command = string.format(":TermExec cmd='cd %s && gcc -o %s %s && ./%s && rm -f ./%s' <CR>", directory,
			filename, filepath, filename, filename)

		vim.cmd(command)

	elseif filetype == "python" then

		local command = string.format(":TermExec cmd='cd %s && python %s' <CR>", directory, filepath)

		vim.cmd(command)

	elseif filetype == "lua" then
		local command = string.format(":TermExec cmd='cd %s && lua %s' <CR>", directory, filepath)

		vim.cmd(command)
	end
end


vim.api.nvim_create_user_command('AutoBracket', function(opts)

    if opts.args == 'true' or opts.args == 'True' then

	vim.keymap.set("i", "{", brackets)
	print("Brackets will automatically complete")

    else

	vim.keymap.del('i', '{')
	print("Brackets are not automated")

    end
end, {nargs = 1})


local brackets = function()
    local right = vim.api.nvim_replace_termcodes("<Right>", true, false, true)
    local left = vim.api.nvim_replace_termcodes("<Left>", true, false, true)
    local back = vim.api.nvim_replace_termcodes("<BS>", true, false, true)
    local backspace_key = vim.api.nvim_replace_termcodes("<Del><BS>", true, false, true)
--    vim.fn.feedkeys("{}", "i")
    vim.api.nvim_put({"{}"}, "b", false, false)
    vim.fn.feedkeys("hhhh", "n")
    vim.fn.feedkeys(back, "i")
    vim.fn.feedkeys(left, "i")
    local keypress = vim.fn.getchar()

    if type(keypress) == "number" then
	local keypress = vim.fn.nr2char(keypress)
	if keypress == "}" then
	    vim.fn.feedkeys(right, "i")
	else
	    vim.fn.feedkeys(keypress, "i")
	end

    else
	local keypush = vim.fn.keytrans(keypress)

	if keypush == "<BS>" then

	    vim.fn.feedkeys(backspace_key, "i")

	end


    end

end
--Keymaps

vim.opt.completeopt = ("menuone,longest")
vim.keymap.set("n", "<leader>r", runfile)
vim.diagnostic.config({ virtual_text = true })
--vim.keymap.set("n", "<Leader>r", ":TermExec cmd='python %' dir='%:p:h' <CR>")
vim.keymap.set("n", "<leader>d", ":lua vim.lsp.buf.format() <CR>")
vim.keymap.set("n", "<leader>m", checkmess)
vim.keymap.set("n", "<C-w>", ":q <CR>")
--vim.keymap.set("i", "{", function() brackets() end)
-- vim.keymap.set("i", "{}<Left><BS>", "<Del><BS>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
--vim.keymap.set("n", "{", "{}<Left>")
