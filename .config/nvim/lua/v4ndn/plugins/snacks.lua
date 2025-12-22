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

local function filter_empty_string(list)
  local next = {}
  for idx = 1, #list do
    if list[idx] ~= nil and list[idx].text ~= "" then
      table.insert(next, list[idx])
    end
  end

  return next
end


local harpoon_source = {
  finder = function()
    local output = {}
    for _, item in ipairs(filter_empty_string(require("harpoon"):list().items)) do
      if item and item.value:match("%S") then
        table.insert(output, {
          text = item.value,
          file = item.value,
          pos = { item.context.row, item.context.col },
        })
      end
    end
    return output
  end,
  filter = {
    transform = function()
      return true
    end,
  },
  preview = function(ctx)
    if Snacks.picker.util.path(ctx.item) then
      return Snacks.picker.preview.file(ctx)
    else
      return Snacks.picker.preview.none(ctx)
    end
  end,
  format = function(item)
    return {
      { item.text },
      { ":",                   "SnacksPickerDelim" },
      { tostring(item.pos[1]), "SnacksPickerRow" },
      { ":",                   "SnacksPickerDelim" },
      { tostring(item.pos[2]), "SnacksPickerCol" },
    }
  end,
  actions = {
    remove = function(picker)
      local harpoon = require("harpoon")



      for _, v in pairs(picker.list.selected) do
        harpoon:list():remove_at(v.idx)
        -- vim.notify(tostring(k) .. " " .. tostring(v), vim.log.levels.INFO)
      end

      picker:refresh()
    end
  },
  confirm = "jump",
  win = {
    input = {
      keys = {
        ["d"] = { "remove", mode = { "n" } }
      }
    }
  }
}

local function keepTerminal()
  local terminals = Snacks.terminal.list()
  if #terminals > 0 then
    local term_win = terminals[1].win
    if term_win ~= nil and vim.api.nvim_win_is_valid(term_win) then
      -- Force height to 12 lines
      vim.api.nvim_win_set_height(term_win, 12)
      -- Ensure it's at the bottom? Harder...
    end
  end
end

local function sidebarPreset(width, previewRatio)
  return {
    on_show = function()
      -- vim.notify(tostring(Snacks.terminal.get()), vim.log.levels.INFO)

      keepTerminal()
      vim.o.cmdheight = 1;
      vim.o.cmdwinheight = 1;
    end,
    on_change = function()
      keepTerminal()
      vim.o.cmdheight = 1;
      vim.o.cmdwinheight = 1;
    end,
    on_close = function()
      keepTerminal()
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
        sources = { harpoon = harpoon_source },
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
        "<leader>he",
        function()
          Snacks.picker.pick("harpoon")
        end,
        desc = "Harpoon Marks",
      },
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
