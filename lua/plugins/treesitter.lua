--i am ashamed to say i used some help from an llm in this because i couldn't figure out the syntax for 
--the newer version of nvim, i won't repeat it i promise
return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup()

            require("nvim-treesitter").install({
                "bash",
                "c",
		"cpp",
                "diff",
                "html",
		"java",
		"javascript",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
		"python",
                "query",
                "vim",
                "vimdoc",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "bash",
                    "c",
                    "cpp",
                    "html",
		    "java",
		    "javascript",
                    "lua",
                    "markdown",
		    "python",
                    "query",
                    "vim",
                },
                callback = function()
                    vim.treesitter.start()
		    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
