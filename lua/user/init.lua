local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme
  colorscheme = "default_theme",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
      shiftwidth = 4,
      tabstop = 4,
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
    plugins = { -- enable or disable extra plugin highlighting
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
      -- {
      --   "faith/vim-go",
      -- config = function ()
      --   require("vim-go").setup()
      -- end,
      -- },
      -- ["faith/vim-go"] = {
      --   go_highlight_types = 1,
      --   go_highlight_fields = 1,
      --   go_highlight_functions = 1,
      --   go_highlight_function_calls = 1,
      --   go_highlight_operators = 1,
      --   go_highlight_extra_types = 1,
      -- },
      -- {
      -- "anuvyklack/hydra.nvim",
      -- config = function ()
      --   require("hydra").setup {
      --     name = "Change / Resize Window",
      --     mode = { "n" },
      --           body = "<C-w>",
      --           config = {
      -- 	          -- color = "pink",
      --           },
      --           heads = {
      -- 	          -- move between windows
      -- 	          { "<C-h>", "<C-w>h" },
      -- 	          { "<C-j>", "<C-w>j" },
      -- 	          { "<C-k>", "<C-w>k" },
      -- 	          { "<C-l>", "<C-w>l" },
      --
      -- 	          -- resizing window
      -- 	          { "H", "<C-w>3<" },
      -- 	          { "L", "<C-w>3>" },
      -- 	          { "K", "<C-w>2+" },
      -- 	          { "J", "<C-w>2-" },
      --
      -- 	          -- equalize window sizes
      -- 	          { "e", "<C-w>=" },
      --
      -- 	          -- close active window
      -- 	          { "Q", ":q<cr>" },
      -- 	          { "<C-q>", ":q<cr>" },
      --
      -- 	          -- exit this Hydra
      -- 	          { "q", nil, { exit = true, nowait = true } },
      -- 	          { ";", nil, { exit = true, nowait = true } },
      -- 	          { "<Esc>", nil, { exit = true, nowait = true } },
      --           },
      --   }
      -- end,
      -- },
      -- {
      --   "simrat39/rust-tools.nvim",
      --   after = { "nvim-lspconfig", "nvim-lsp-installer" },
      --   -- Is configured via the server_registration_override installed below!
      --   config = function()
      --     -- local extension_path = vim.fn.stdpath "data" .. "/dapinstall/codelldb/extension"
      --     -- local codelldb_path = extension_path .. "/adapter/codelldb"
      --     -- local liblldb_path = extension_path .. "/lldb/lib/liblldb.so"
      --
      --     require("rust-tools").setup {
      --       server = astronvim.lsp.server_settings "rust_analyzer",
      --       -- dap = {
      --       --   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      --       -- },
      --       tools = {
      --         inlay_hints = {
      --           parameter_hints_prefix = "  ",
      --           other_hints_prefix = "  ",
      --         },
      --       },
      --     }
      --   end,
      -- },
      {
        "catppuccin/nvim",
        config = function()
          require("catppuccin").setup {
            dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.15,
            },
            transparent_background = false,
            term_colors = false,
            compile = {
              enabled = false,
              path = vim.fn.stdpath "cache" .. "/catppuccin",
            },
            styles = {
              comments = { "italic" },
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
            },
            integrations = {
              treesitter = true,
              native_lsp = {
                enabled = true,
                virtual_text = {
                  errors = { "italic" },
                  hints = { "italic" },
                  warnings = { "italic" },
                  information = { "italic" },
                },
                underlines = {
                  errors = { "underline" },
                  hints = { "underline" },
                  warnings = { "underline" },
                  information = { "underline" },
                },
              },
              coc_nvim = false,
              lsp_trouble = false,
              cmp = true,
              lsp_saga = false,
              gitgutter = false,
              gitsigns = true,
              leap = false,
              telescope = true,
              nvimtree = {
                enabled = true,
                show_root = true,
                transparent_panel = false,
              },
              neotree = {
                enabled = false,
                show_root = true,
                transparent_panel = false,
              },
              dap = {
                enabled = false,
                enable_ui = false,
              },
              which_key = false,
              indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
              },
              dashboard = true,
              neogit = false,
              vim_sneak = false,
              fern = false,
              barbar = false,
              bufferline = true,
              markdown = true,
              lightspeed = false,
              ts_rainbow = false,
              hop = false,
              notify = true,
              telekasten = true,
              symbols_outline = true,
              mini = false,
              aerial = false,
              vimwiki = true,
              beacon = true,
            },
            color_overrides = {},
            custom_highlights = {},
          }
        end,
      },
      -- disable plugins:
      ["declancm/cinnamon.nvim"] = { disable = true }, -- Slow scrolling
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.rufo,
        -- Set a linter
        null_ls.builtins.diagnostics.rubocop,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
    treesitter = {
      ensure_installed = { "lua" },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
      "gopls"
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
      gopls = {
        settings = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    -- color scheme
    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
    vim.cmd [[colorscheme catppuccin]]
    -- Set key bindings
    vim.keymap.set("n", "<C-s>", ":w!<CR>")
    -- vim.api.nvim_set_var("python3_host_prog", "/Users/ibyeongjin/.pyenv/versions/pynvim/bin/python3")
    vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/Caskroom/miniforge/base/envs/pynvim/bin/python3")
    vim.keymap.set("n", "<f1>", ":GoBuild<CR>")
    vim.keymap.set("n", "<f2>", ":GoRun %<CR>")
    vim.keymap.set("n", "<f3>", ":GoDebugBreakpoint<CR>")
    vim.keymap.set("n", "<f4>", ":GoDebugStop<CR>")
    vim.keymap.set("n", "<f5>", ":GoDebugStart %<CR>")
    vim.keymap.set("n", "<f6>", ":GoDebugContinue<CR>")
    vim.keymap.set("n", "<f7>", ":GoDebugNext<CR>")
    vim.keymap.set("n", "<f9>", ":GoDebugStep<CR>")
    vim.keymap.set("n", "<f10>", ":GoDebugStepOut<CR>")
    vim.keymap.set("n", "<f12>", ":GoDebugTest<CR>")
    -- vim.keymap.set("n", "<f12>", ":GoDebugPrint %s<CR>")
    vim.g.go_highlight_types = 1
    vim.g.go_highlight_fields = 1
    vim.g.go_highlight_functions = 1
    vim.g.go_highlight_function_calls = 1
    vim.g.go_highlight_operators = 1
    vim.g.go_highlight_extra_types = 1
    vim.g.go_highlight_generate_tags = 1
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
