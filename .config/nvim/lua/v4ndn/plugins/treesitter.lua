return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  config = function()
    treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      highlight = { enable = true },
    })
  end
  ,
  lazy = false,
  build = ":TSUpdate"
}
