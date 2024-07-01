return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    presets = {
      bottom_search = false,
      long_message_to_split = false,
    },
    cmdline = {
      format = {
        search_down = {
          -- view = "cmdline",
          icon = "󰍉",
        },
        search_up = {
          -- view = "cmdline",
          icon = "󰍉",
        },
      },
    },
    messages = {
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
    },
    notify = {
      view = "mini",
    },
    views = {
      cmdline_popup = {
        border = {
          style = "solid",
        },
      },
      popup = {
        border = {
          style = "solid",
        },
      },
    },
    ---@type table<string, NoiceCommand>
    commands = {
      history = {
        -- options for the message history that you get with `:Noice`
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = {
          any = {
            { event = "notify" },
            { error = true },
            { warning = true },
            { event = "msg_show", kind = { "" } },
            { event = "lsp", kind = "message" },
          },
        },
      },
      -- :Noice last
      last = {
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = {
          any = {
            { event = "notify" },
            { error = true },
            { warning = true },
            { event = "msg_show", kind = { "" } },
            { event = "lsp", kind = "message" },
          },
        },
        filter_opts = { count = 1 },
      },
      -- :Noice errors
      errors = {
        -- options for the message history that you get with `:Noice`
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = { error = true },
        filter_opts = { reverse = true },
      },
      all = {
        -- options for the message history that you get with `:Noice`
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = {},
      },
    },
  },
  -- stylua: ignore
  keys = function()
    return {
      { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>l", function() require("noice").cmd("last") end, desc = "Last Message" },
      { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>m", function() require("noice").cmd("all") end, desc = "Messages" },
      { "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<leader>nt", function() vim.cmd("Noice telescope") end, desc = "Noice telescope" },
      { "<leader>fp",
        function()
          local path = vim.fn.expand("%:p")
          LazyVim.info(path)
          require("noice").cmd("last")
          vim.api.nvim_command("silent !echo '" .. path .. "' | pbcopy")
        end, desc = "Print current file path" },
    }
  end
,
}
