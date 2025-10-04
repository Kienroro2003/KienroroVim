return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- Import plugin safely
    local comment = require("Comment")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- Enable comment plugin with custom keymaps
    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
      mappings = {
        basic = false, -- Tắt phím tắt mặc định
        extra = false,
      },
    })

    -- Cài đặt phím tắt tùy chỉnh
    local opts = { noremap = true, silent = true }

    -- Comment dòng
    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, opts)

    -- Comment khối
    vim.keymap.set("n", "<leader>*", function()
      require("Comment.api").toggle.blockwise.current()
    end, opts)

    -- Comment trong Visual mode
    vim.keymap.set("v", "<leader>/", function()
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, opts)

    vim.keymap.set("v", "<leader>*", function()
      require("Comment.api").toggle.blockwise(vim.fn.visualmode())
    end, opts)
  end,
}
