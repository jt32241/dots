return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'mason-org/mason.nvim', config = true },
    'mason-org/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },

    'hrs7th/nvim-cmp',
  },
  config = function()

    -- [[ Configure LSP ]]

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })

        vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = 'code action' })

        end
    })

    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        virt_text_pos = 'eol',
        current_line = true,
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    require('mason').setup()
    require('mason-lspconfig').setup()

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- tsserver = {},
      -- html = { filetypes = { 'html', 'twig', 'hbs'} },

      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          -- diagnostics = { disable = { 'missing-fields' } },
        },
      },
    }

    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend(
            'force',
            {},
            capabilities, server.capabilities or {}
           )
          require('lspconfig')[server_name].setup(server)
        end,
      }
    }

    -- require("lspconfig").pylsp.setup({
    vim.lsp.config('pylsp', {
      capabilities=capabilities,
      settings = {
        pylsp = {
          plugins = {
            pylsp_mypy = { live_mode = false },
            black = { enabled = true },
          }
        }
      }
    })

    -- local lombok_path = vim.fn.expand('~/.local/share/lombok.jar')
    -- vim.lsp.config.jdtls = {
    --   capabilities=capabilities,
    --   cmd= {
    --     "jdtls",
    --     "-javaagent:" .. lombok_path,
    --     -- "-javaagent:" .. "~/.local/share/nvim/lombok-1.18.30.jar"
    --   },
    --   settings = {
    --     java = {
    --       -- Add lombok to the compile classpath
    --       project = {
    --         referencedLibraries = {
    --           lombok_path
    --         }
    --       }
    --     }
    --   }
    -- }
   local lombok_path = vim.fn.expand('~/.local/share/lombok.jar')

    -- vim.lsp.config('jdtls', {
    vim.lsp.config.jdtls = {
      cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        -- Critical: Lombok as Java agent before specifying jar
        '-javaagent:' .. lombok_path,

        '-jar', vim.fn.glob(vim.fn.stdpath('data') .. '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', vim.fn.stdpath('data') .. '/mason/packages/jdtls/config_linux',
        '-data', vim.fn.expand('~/.cache/jdtls-workspace/') .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t'),
      },

      filetypes = { 'java' },
      root_markers = { 'pom.xml', 'build.gradle', '.git' },

      settings = {
        java = {
          -- Add lombok to the compile classpath
          project = {
            referencedLibraries = {
              lombok_path
            }
          }
        }
      }
    }

    vim.lsp.enable('jdtls')
    vim.lsp.enable('pylsp')
    -- vim.lsp.config.jdtls.enable()

  end
}
-- vim: ts=2 sts=2 sw=2 et
