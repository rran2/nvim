local cmp = require('cmp')
local luasnip = require('luasnip')
local lspconfig = require('lspconfig')

-- cmd setup
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<cr>']=cmp.mapping.confirm({select=true}),
    ['<C-k>'] = cmp.mapping.select_prev_item(),    -- Puxar para CIMA
    ['<C-j>'] = cmp.mapping.select_next_item(),    -- Puxar para BAIXO
    -- PADRÕES
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),

    --
    --


  }),
})


