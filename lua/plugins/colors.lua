--plug ins require you to return a table 'return {}' inside the curly braces
--it returns stuff, we can return a table of tables using 2 curly braces
--as such: 'return {{}}'

--not really sure how this works 100%

local function enable_transparency()
      vim.api.nvim_set_hl(0, 'Normal', {bg='none'})
end

return {
      --start of table
      {
	    --name of repo:
	    "folke/tokyonight.nvim",
	    --unnamed function to call other functions on startup i assume 
	    config = function()
		  vim.cmd.colorscheme "tokyonight"
		  enable_transparency()
	    end
      },
      --end of table (comma for any other tables we wanna add)
      {
	  --lua line is the coloured line above the spot where commands are entered
	  --aesthetics
	  --usually u install by naming the repo but in this case it needs dependencies
	  "nvim-lualine/lualine.nvim",
	  --so we include them here
	  dependencies = {
	      "nvim-tree/nvim-web-devicons",
	  },
	  --options for the plugin
	  opts = {
	      theme = "tokyonight"
	  },
      },
}
