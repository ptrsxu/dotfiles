---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!
M.dap = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle Breakpoint"
    },
    ["<leader>dc"] = {
      "<cmd> DapContinue <CR>",
      "Dap Continue"
    },
    ["<leader>di"] = {
      "<cmd> DapStepInto <CR>",
      "DapStepInto"
    },
    ["<leader>do"] = {
      "<cmd> DapStepOut <CR>",
      "DapStepOut"
    },
    ["<leader>dn"] = {
      "<cmd> DapStepOver <CR>",
      "DapStepOver"
    },
    ["<leader>dr"] = {
      "<cmd> RustLsp debuggables <CR>",
      "Debug Ruuning Rust"
    },
    ["<leader>ds"] = {
      function()
        require("dapui").toggle()
      end,
      "Open Debugging Sidebar"
    },
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end,
      "Debug Running Python"
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

return M
