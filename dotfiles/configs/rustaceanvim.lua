local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
}

-- vim.g.rustaceanvim = function()
--   -- Update this path
--   local extension_path = vim.env.HOME .. '.local/share/nvim/mason/packages/codelldb/extension'
--   local codelldb_path = extension_path .. 'adapter/codelldb'
--   local liblldb_path = extension_path .. 'lldb/lib/liblldb'
--   local this_os = vim.uv.os_uname().sysname
--   local cfg = require('rustaceanvim.config')
--   return {
--     dap = {
--       adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
--     },
--   }
-- end