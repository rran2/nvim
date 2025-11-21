local lspconfig = require('lspconfig')
local cmp_lsp = require('cmp_nvim_lsp')
local cmp = require('cmp')
local luasnip = require('luasnip')

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "⟳",
            package_uninstalled = "✗",
        },
    },
})

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
end

require("mason-lspconfig").setup({
    ensure_installed = { 
        "lua_ls", "pyright", "rust_analyzer", "clangd", 
        "bashls", "ts_ls",
    },

    handlers = {
        -- Configuração especial para Lua_LS
        ["lua_ls"] = function()
             lspconfig.lua_ls.setup {
                on_attach = on_attach,
                capabilities = cmp_lsp.default_capabilities(),
                settings = {
                    Lua = {
                      diagnostics = {
                        globals = { "vim" },
                      },
                      workspace = {
                        library = {
                          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                          [vim.fn.stdpath "config" .. "/lua"] = true,
                        },
                      },
                    },
                }
             }
        end,
        -- Handler para todos os outros servidores que não têm configurações especiais (pyright, clangd, etc.)
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = on_attach, -- Usa a mesma função de keymaps
                capabilities = cmp_lsp.default_capabilities(),
            })
        end,
    },
})
