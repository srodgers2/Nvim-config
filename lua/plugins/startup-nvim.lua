return {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
	require "startup".setup({
--	    local section_1 = <section>
--	    section = {
--		-- "text" -> text that will be displayed
--		-- "mapping" -> create mappings for commands that can be used
--		-- use mappings.execute_command on the commands to execute
--		-- "oldfiles" -> display oldfiles (can be opened with mappings.open_file/open_file_split)
--		type = "text", -- can be mapping or oldfiles
--		oldfiles_directory = false, -- if the oldfiles of the current directory should be displayed
--		align = "center", -- "center", "left" or "right"
--		fold_section = false, -- whether to fold or not
--		title = "title", -- title for the folded section
--		-- if < 1 fraction of screen width
--		-- if > 1 numbers of column
--		margin = 5, -- the margin for left or right alignment
--		-- type of content depends on `type`
--		-- "text" -> a table with string or a function that requires a function that returns a table of strings
--		-- "mapping" -> a table with tables in the format:
--		-- {
--		--   {<displayed_command_name>, <command>, <mapping>}
--		--   {<displayed_command_name>, <command>, <mapping>}
--		-- }
--		-- e.g. {" Find File", "Telescope find_files", "<leader>ff" }
--		-- "oldfiles" -> ""
--		content = <content>
--		    highlight = "String", -- highlight group in which the section text should be highlighted
--		default_color = "#FF0000", -- a hex color that gets used if you don't specify `highlight`
--		oldfiles_amount = 5, -- the amount of oldfiles to be displayed
--	    }
	    theme = "dashboard"
	})
    end,



}
