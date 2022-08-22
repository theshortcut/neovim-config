local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
