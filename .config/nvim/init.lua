require("v4ndn.core")
require("v4ndn.lazy")
require("v4ndn.lsp")
vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN,
      max = vim.diagnostic.severity.ERROR,
    },
  },
})
vim.cmd("colorscheme github_dark_default")
