
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "⟳",
            package_uninstalled = "✗",
        },
    },
})

local lspconfig = require('lspconfig')
local cmp_lsp = require('cmp_nvim_lsp') 

require("mason-lspconfig").setup({
    ensure_installed = { 
        "lua_ls", "pyright", "rust_analyzer", "clangd", 
        "bashls", "ts_ls",
    },
    
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = cmp_lsp.default_capabilities(), 
            })
        end,
    },
})
