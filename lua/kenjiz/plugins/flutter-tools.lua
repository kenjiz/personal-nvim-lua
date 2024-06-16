return {
  { "mfussenegger/nvim-dap" },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      local flutter_tools = require("flutter-tools")
      local dap = require("dap")

      flutter_tools.setup({
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function(_)
            dap.adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
            }

            dap.configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = "$HOME/fvm/default/bin/",
                flutterSdkPath = "$HOME/fvm/default/bin/",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }

            require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_log = {
          enabled = true,
          open_cmd = ":tabedit",
        },
        lsp = {},
      })

      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>f<F4>", ":FlutterEmulators<CR>", { desc = "Flutter: Shows list of emulators" })
      keymap.set("n", "<leader>f<F5>", ":FlutterRun<CR>", { desc = "Flutter: Run current project" })
      keymap.set("n", "<leader>f<F6>", ":FlutterReload<CR>", { desc = "Flutter: Reload running project" })
      keymap.set("n", "<leader>f<F7>", ":FlutterRestart<CR>", { desc = "Flutter: Restart current project" })
      keymap.set("n", "<leader>f<F8>", ":FlutterQuit<CR>", { desc = "Flutter: Quit current project" })
      keymap.set("n", "<leader>f<F9>", ":FlutterOutlineToggle<CR>", { desc = "Flutter: Toggle widget tree" })
      keymap.set("n", "<leader>f<F10>", ":FlutterDevTools<CR>", { desc = "Flutter: Starts a dart dev tools server" })
      keymap.set(
        "n",
        "<leader>fe",
        require("telescope").extensions.flutter.commands,
        { desc = "Open Flutter tools command" }
      )
    end,
  },
  { "dart-lang/dart-vim-plugin" },
}
