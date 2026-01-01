return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        -- Các option khác nếu cần (thường để mặc định là đủ)
        enable_close = true, -- Tự động đóng thẻ
        enable_rename = true, -- Tự động đổi tên thẻ cặp (cái bạn đang cần)
        enable_close_on_slash = false, -- Tự động đóng khi gõ /
      },
      -- Cấu hình riêng cho các file type (nếu cần)
      per_filetype = {
        ["html"] = {
          enable_close = true,
        },
      },
    })
  end,
}
