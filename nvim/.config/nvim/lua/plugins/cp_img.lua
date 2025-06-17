return {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
        default = {
            dir_path = function()
                local filename = vim.fn.expand("%:t:r")
                return "assets/img/" .. filename
            end,
        },
    },
    keys = {
        -- suggested keymap
        { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
}
