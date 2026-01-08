---@brief
---
--- https://github.com/aca/emmet-ls
---
--- Package can be installed via `npm`:
--- ```sh
--- npm install -g emmet-ls
--- ```

---@type vim.lsp.Config
return {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = {
    'astro',
    'css',
    'eruby',
    'html',
    'htmlangular',
    'htmldjango',
    'less',
    'pug',
    'sass',
    'scss',
    'svelte',
    'templ',
    'typescriptreact',
    'vue',
    "typescript.tsx",
    "javascriptreact",
    "javascript.jsx",
  },
  root_markers = { '.git' },
}
