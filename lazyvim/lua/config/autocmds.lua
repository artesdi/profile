-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Leave telescope promt on ESC from insert mode
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function(event)
    if vim.bo[event.buf].filetype == "TelescopePrompt" then
      require("telescope.actions").close(vim.api.nvim_get_current_buf())
      -- vim.api.nvim_input("<ESC>")
    end
  end,
})

-- Go to coding mode
vim.api.nvim_create_user_command("Kindle", function()
  if KINDLED == nil then
    require("null-ls")
    require("refactoring")
    require("yaml-companion")
    require("telescope")
    require("ibl")
    require("gitsigns")

    vim.diagnostic.enable()

    KINDLED = true
  end
end, {})

-- Toggle diagnostics (or use built-in implementation <leader>ud)
vim.g.diagnostics_active = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.hide()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
  else
    vim.g.diagnostics_active = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    })
    vim.diagnostic.show()
  end
end
-- vim.api.nvim_set_keymap("n", "<leader>xt", ":call v:lua.toggle_diagnostics()<CR>", { desc = "Toggle diagnostic", noremap = true, silent = true })
