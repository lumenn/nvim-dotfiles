local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnips' }
    }, {
        { name = 'buffer' },
    })

})

require('mason').setup({
    ui = {border = 'rounded'}
})

require('mason-lspconfig').setup({
    ensure_installed = {
        'sqls',
        'tsserver',
        'html',
        'terraformls',
        'lua_ls',
        'pyright',
        'powershell_es'
    }

})


require('lspconfig').lua_ls.setup{}
require('lspconfig').html.setup{}
require('lspconfig').terraformls.setup{}
require('lspconfig').powershell_es.setup{}
