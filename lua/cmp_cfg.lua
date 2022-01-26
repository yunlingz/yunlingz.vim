local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-c>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  },
  sources = cmp.config.sources({{name = 'nvim_lsp'}, {name = 'vsnip'}}, {
    {name = 'buffer'},
  }, {{name = 'path'}}),
})

cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}}),
})

