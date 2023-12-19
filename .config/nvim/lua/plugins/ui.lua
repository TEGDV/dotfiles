return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 1000,
    },
  },
  -- Buffer Line
  {
    "akisho/bufferline.nvim",
    keys = {
      { "<TAB>", "<Cmd>BufferLineCycleNext<CR>", desc = "NextTab" },
      { "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", desc = "PrevTab" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  -- Lua Line
  {
    "lua-line/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "catppuccin",
      },
    },
  },

  -- File Labels with Incline.Nvim
  {
    "b0o/incline.nvim",
    dependencies = {
      "catppuccin/nvim",
    },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("catppuccin.palettes.mocha")
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.red, guifg = colors.crust },
            InclineNormalNC = { guifg = colors.sapphire, guibg = colors.mantle },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  -- Logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
             ██╗ █████╗ ██████╗     ██╗  ██╗ ██████╗ ██████╗ ███████╗
             ██║██╔══██╗██╔══██╗    ██║ ██╔╝██╔═══██╗██╔══██╗██╔════╝
             ██║███████║██████╔╝    █████╔╝ ██║   ██║██║  ██║█████╗  
        ██   ██║██╔══██║██╔═══╝     ██╔═██╗ ██║   ██║██║  ██║██╔══╝  
        ╚█████╔╝██║  ██║██║         ██║  ██╗╚██████╔╝██████╔╝███████╗
         ╚════╝ ╚═╝  ╚═╝╚═╝         ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
