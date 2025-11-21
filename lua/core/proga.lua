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
  --basic mappings
    ['<cr>']=cmp.mapping.confirm({select=true}),
    
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
  -- basically if the snippet "menu" is showing it will navegate with Tab
  -- if its not showing it'll just indent as basic as it is
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item() 
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump() 
      else
        fallback() 
      end
    end, { 'i', 's' }),
    -- same shyt as before but it is to navegate backwards
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item() 
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1) 
      else
        fallback()
      end
    end, { 'i', 's' }),
    --
  }),
})


