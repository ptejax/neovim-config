-- Completion: nvim-cmp with LuaSnip snippets, lspkind icons and
-- buffer/path/cmdline sources.
-- Loaded at startup (not on InsertEnter/CmdlineEnter) so the `/`, `?` and `:`
-- cmdline completion is already set up the first time the cmdline is used.
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- No LSP is configured yet (nvim-lspconfig is still commented out);
    -- cmp-nvim-lsp is kept so the nvim_lsp source works as soon as one is.
    -- 'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Only accept an item explicitly selected with <Tab>/<C-n>; otherwise
        -- <CR> inserts a newline as usual.
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, {'i', 's'}),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        {
          name = 'buffer',
          keyword_length = 2,
          option = {
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end
          }
        },
        { name = 'path' },
      }),
      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = lspkind.cmp_format({
          mode = 'symbol',
          with_text = true,
          menu = {
            nvim_lsp = '[LSP]',
            luasnip = '[SNIP]',
            path = '[Path]',
            buffer = '[BUF]',
          },
          maxwidth = 50,
        }),
      },
      view = {
        entries = {
          name = 'custom',
          selection_order = 'near_cursor',
        },
      },
    })

    -- `/` cmdline setup
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    -- `:` cmdline setup
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
