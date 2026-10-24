-- File explorer on the left.
-- Not lazy-loaded: it replaces netrw, e.g. for `nvim <directory>`.
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
  config = function()
    -- recommended: disable netrw so it doesn't conflict
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = { side = "left", width = 40, preserve_window_proportions = true },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = { enable = true },
        },
      },
    })

    vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { silent = true })
  end,
}
