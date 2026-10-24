-- Csvview setup
return {
  'hat0uma/csvview.nvim',
  config = function()
    require('csvview').setup({
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        -- Above comments are the suggestions from the package documentation
        -- Remapped to avoid clashing with tab-switching / nvim-cmp
        jump_next_field_end = { "<C-l>", mode = { "n", "v" } },
        jump_prev_field_end = { "<C-h>", mode = { "n", "v" } },
        -- jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        -- jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        -- No row mappings: j/k move between rows. (<S-Enter> for the previous
        -- row never worked anyway; the terminal sends it as plain <Enter>.)
      },
    })
  end,
}
