return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      -- 🔥 Tích hợp Mason với DAP
      require("mason").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = { "debugpy", "codelldb" },
        automatic_installation = true,
      })

      require("dapui").setup()
      require("nvim-dap-virtual-text").setup({ commented = true })

      -- 🔥 Cấu hình Python Debug (debugpy)
      local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      dap_python.setup(debugpy_path)

      -- 🔥 Cấu hình C++ Debug (codelldb)
      local codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
      dap.adapters.lldb = {
        type = "executable",
        command = codelldb_path,
        name = "lldb",
      }

      dap.configurations.cpp = {
        {
          name = "Launch C++",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }

      -- 🎯 Định dạng biểu tượng breakpoint
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
      })
      vim.fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "DiagnosticSignError",
      })
      vim.fn.sign_define("DapStopped", {
        text = "",
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
      })

      -- 🔥 Giữ UI mở sau khi debug kết thúc
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- 📌 **Keybindings cho Debugging**
      local opts = { noremap = true, silent = true }

      -- Đặt/xóa breakpoint
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts)

      -- Chạy chương trình debug
      vim.keymap.set("n", "<leader>dc", dap.continue, opts)

      -- Step Over (Nhảy qua)
      vim.keymap.set("n", "<leader>do", dap.step_over, opts)

      -- Step Into (Nhảy vào)
      vim.keymap.set("n", "<leader>di", dap.step_into, opts)

      -- Step Out (Nhảy ra)
      vim.keymap.set("n", "<leader>dO", dap.step_out, opts)

      -- Dừng debug
      vim.keymap.set("n", "<leader>dq", dap.terminate, opts)

      -- Bật/tắt UI debug
      vim.keymap.set("n", "<leader>du", dapui.toggle, opts)
    end,
  },
}
