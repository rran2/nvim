local cmp = require("cmp")
local luasnip = require('luasnip')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(1),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-Space>'] = cmp.mapping.complete(),
      
      -- 1. NAVEGAÇÃO DO MENU (MANTIDA NO <Tab>/<S-Tab>)
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item() 
        else
          fallback() -- Permite a Indentação padrão do <Tab>
        end
      end, { 'i', 's' }),
      
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item() 
        else
          fallback() -- Permite a Desindentação padrão
        end
      end, { 'i', 's' }),

      -- 2. NAVEGAÇÃO DO SNIPPET (MOVIDA PARA <C-j>/<C-k>)
      ['<C-j>'] = cmp.mapping(function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump() 
        end
      end, { 'i', 's' }),

      ['<C-k>'] = cmp.mapping(function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1) 
        end
      end, { 'i', 's' }),

    }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})
