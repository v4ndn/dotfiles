return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "iceberg_dark",
        component_separators = { left = "|", right = "|" },
        globalstatus = true,
      }
    })
  end
}
