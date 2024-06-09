return {
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.source = opts.sources or {}
      table.insert(opts.source, nls.builtins.formatting.prettier)
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    otps = {
      formatters_by_ft = {
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["vue"] = { "prettier" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "prettier" },
        ["jsonc"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
        ["svelte"] = { "prettier" },
      },
      formatters = {
        prettier = {
          condition = function(_, ctx)
            if not needs_config then
              return true
            end
            if enabled[ctx.filename] == nil then
              vim.fn.system({ "prettier", "--find-config-path", ctx.filename })
              enabled[ctx.filename] = vim.v.shell_error == 0
            end
            return enabled[ctx.filename]
          end,
        },
      },
    },
  },
}
