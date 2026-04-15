return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
}
-- return {
--   "nvim-treesitter/nvim-treesitter",
--   version = false, -- last release is way too old and doesn't work on Windows.
--   lazy = false,
--   build = ":TSUpdate",
--   -- event = { "BufReadPost", "BufNewFile" },
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter-textobjects",
--   },
--   cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
--   opts = {
--     ensure_installed = {
--       "bash",
--       "c",
--       "diff",
--       "html",
--       "javascript",
--       "jsdoc",
--       "json",
--       "lua",
--       "luadoc",
--       "luap",
--       "markdown",
--       "markdown_inline",
--       "python",
--       "query",
--       "regex",
--       "tsx",
--       "typescript",
--       "vim",
--       "vimdoc",
--     },
--     highlight = { enable = true },
--     indent = { enable = true },
--     -- Optional: Install parsers synchronously (good for CI or fresh installs)
--     sync_install = false,
--     -- Optional: Automatically install missing parsers when entering a buffer
--     auto_install = true,
--   },
--   config = function(_, opts)
--     require("nvim-treesitter.configs").setup(opts)
--   end,
-- }
