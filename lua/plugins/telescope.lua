-- Telescope with the native fzf sorter.
-- No telescope keymaps are defined, so it is only used via :Telescope;
-- loading on that command (or on require('telescope...')) is safe.
return {
  'nvim-telescope/telescope.nvim',
  version = '*', -- latest release tag (packer: tag = '*')
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
      }
    }
    require('telescope').load_extension('fzf')
  end,
}
