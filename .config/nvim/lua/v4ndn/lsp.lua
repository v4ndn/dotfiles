vim.lsp.enable({ "biome", "gopls", "vtsls", "luals", "nills", "emmet", "harper" })
-- vim.lsp.inlay_hint.ehable(true)

local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})
