return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    local indent_blankline_augroup = vim.api.nvim_create_augroup("indent_blankline_augroup", { clear = true })
    vim.api.nvim_create_autocmd("ModeChanged", {
      group = indent_blankline_augroup,
      pattern = "[vV\x16]*:*",
      command = "IBLEnable",
      desc = "Enable indent-blankline when exiting visual mode",
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      group = indent_blankline_augroup,
      pattern = "*:[vV\x16]*",
      command = "IBLDisable",
      desc = "Disable indent-blankline when exiting visual mode",
    })

    require("ibl").setup({
      indent = {
        char = "│",
        highlight = "IndentBlanklineChar",
        smart_indent_cap = true,
      },
    })
    vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#555555", nocombine = true })
  end,
}
