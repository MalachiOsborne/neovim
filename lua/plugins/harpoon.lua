return{
    {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
	    require("harpoon"):setup()
	end,
	keys = {
	    { "<leader>a", function() require("harpoon"):list():add() end, desc = "harpoon file", },
	    { "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
	    { "<C-p>", function() require("harpoon"):list():prev() end, desc = "previous file",},
	    { "<C-n>", function() require("harpoon"):list():next() end, desc = "next file",},
	},
    },
}
