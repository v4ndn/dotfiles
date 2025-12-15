local exclude = {
  "**/yarn.lock",
  "**/package-lock.json",
  "**/node_modules/**",
  "**/.terraform/**",
  "**/*.log",
  "**/dist/**",
  "**/build/**",
  "**/debug",
  "**/release",
  "**/Cargo.lock",
  "**/.git/**",
  "**/venv",
  "**/.idea",
  "**/.next",
}

local function sidebarPreset(width, previewRatio)
  return {
    on_show = function()
      vim.o.cmdheight = 1;
      vim.o.cmdwinheight = 1;
    end,
    on_change = function()
      vim.o.cmdheight = 1;
      vim.o.cmdwinheight = 1;
    end,
    on_close = function()
      vim.o.cmdheight = 1;
      vim.o.cmdwinheight = 1;
    end,
    layout = {
      layout = {
        backdrop = false,
        width = width,
        min_width = width,
        height = 0,
        position = "right",
        border = "none",
        box = "vertical",
        {
          win = "input",
          height = 1,

          title = "{title} {live} {flags}",
          title_pos = "left",
          border = "bottom",
        },
        { win = "list",    border = "none" },
        { win = "preview", title = "{preview}", height = previewRatio, border = "top" },
      },
    }
  }
end

return {
  {
    "folke/snacks.nvim",
    priority = 2000,
    opts = {
      bigfile = {},
      picker = {
        preset = "vscode",
        layout = {
          layout = {
            width = 0.1,
            border = true,
          },
        },
      },

      terminal = {
        win = {
          position = "bottom",
          max_height = 12,
          stack = true,
        },
      },
      indent = {
        indent = {
          enabled = false,
        },
        chunk = {
          enabled = true,
          char = {
            horizontal = "─",
            vertical = "│",
            corner_top = "╭",
            corner_bottom = "╰",
            arrow = "─",
          },
        },
        animate = {
          enabled = true, -- vim.fn.has("nvim-0.10") == 1,
          style = "out",
          easing = "outCubic",
          duration = {
            step = 20,   -- ms per step
            total = 200, -- maximum duration
          },
        },
      },
    },
    keys = {
      {
        "<leader>tt",
        function()
          Snacks.terminal.toggle()
        end,
      },
      {
        "<leader>fs",
        function()
          Snacks.picker.smart(sidebarPreset(60, 0.7));
        end,
        desc = "Smart Find Files"
      },
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers(sidebarPreset(30, 0.4));
        end,
        desc = "Buffers"
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.grep(sidebarPreset(60, 0.7))
        end,
        desc = "Grep"
      },
      { "<leader>:",  function() Snacks.picker.command_history() end,              desc = "Command History" },
      { "<leader>fe", function() Snacks.picker.explorer(sidebarPreset(30, 1)) end, desc = "File Explorer" },
      {
        "<leader>fc",
        function()
          Snacks.picker.git_status(sidebarPreset(100, 0.8))
        end,
        desc = "Git changed files"
      },
      { "<leader>fh", function() Snacks.picker.help(sidebarPreset(60, 0.4)) end, desc = "Help Pages" }
    },
  }
}
