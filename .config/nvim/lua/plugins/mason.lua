return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        require('mason').setup { }
        require('mason-lspconfig').setup {
            ensure_installed = { 'lua_ls' },
            automatic_installation = true
        }
        require('mason-lspconfig').setup_handlers {
            function(server)
                require('lspconfig')[server].setup{
                    capabilities = require('cmp_nvim_lsp').default_capabilities(),
                }
            end
        }
    end
}
