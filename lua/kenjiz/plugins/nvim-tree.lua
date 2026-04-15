return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    -- local nvimtree_api = require("nvim-tree.api")

    -- recommended settings from nvim-tree documentations
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
        number = false,
        side = "right",
        signcolumn = "yes",
      },

      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "→",
              arrow_open = "↓",
            },
          },
        },
      },

      -- disabled window_picker for explorer to work well with window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "💡",
          info = "",
          warning = "",
          error = "",
        },
        show_on_dirs = true,
      },
      filters = {
        dotfiles = true,
        custom = {
          ".DS_Store",
          ".git",
          ".dart_tool",
          ".idea",
          ".flutter-plugins",
          ".flutter-plugins-dependencies",
          ".metadata",
          "*.iml",
        },
      },
      git = {
        ignore = false,
      },
      update_focused_file = {
        enable = true,
        ignore_list = {},
      },
    })

    -- nvimtree_api.tree.toggle({
    --   update_root = false,
    --   focus = true,
    --   find_file = false,
    -- })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set(
      "n",
      "<leader>ef",
      "<cmd>NvimTreeFindFileToggle<CR>",
      { desc = "Toggle file explorer on current buffer" }
    )
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
