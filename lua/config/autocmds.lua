-- Per-filetype indent settings live in after/ftplugin/<filetype>.lua.

-- The nvim-treesitter module system (lua/plugins/treesitter.lua) doesn't
-- reliably auto-attach the highlighter on every filetype, so start it
-- explicitly. pcall guards filetypes with no installed parser.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterAttach", { clear = true }),
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
