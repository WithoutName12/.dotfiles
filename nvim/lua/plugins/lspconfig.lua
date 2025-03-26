return {

    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
            servers = {
                clangd = {
                    cmd = { "clangd", "--fallback-style=Microsoft" }, -- or "--fallback-style={IndentWidth: 4}"
                },
            },
        },
    },
}
