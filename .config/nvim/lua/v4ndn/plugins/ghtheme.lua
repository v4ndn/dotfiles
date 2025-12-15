return {
  "projekt0n/github-nvim-theme",
  name = "github_dark_high_contrast",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("github-theme").setup({
      palettes = {
        all = {
          border = {
            default = "#313131",
            muted = "#313131",
            subtle = "#313131",
          },
        },
      },
      options = {
        transparent = true,
      }
    })

    -- vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#444444" })
    -- vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#444444" })
  end,
}
