local plugins = {
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "akinsho/toggleterm.nvim", version = "*", config = { position = "horizontal" }, cmd = "ToggleTerm"
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            panel = {
                enabled = true,
                auto_refresh = true,
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<C-a>",
                    accept_word = false,
                    accept_line = false,
                    next = "<C-]>",
                    prev = "<C-[>",
                    dismiss = "<C-x>",
                },
            },
            filetypes = {
                markdown = true,
                help = true,
                yaml = true,
                toml = true,
                json = true,
                lua = true,
                python = true,
                rust = true,
                go = true,
                javascript = true,
                typescript = true,
            },
        },
    },
    {
        "mfussengegger/nvim-dap",
        config = function()
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussengegger/nvim-dap",
            "nvim-neotest/nvim-nio", -- Add this dependency
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
            local null_ls = require("null-ls")
            local lspconfig = require("lspconfig")

            -- Ensure null-ls is set up
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            return {
                sources = {
                    null_ls.builtins.diagnostics.ruff, -- Ruff diagnostics
                    null_ls.builtins.diagnostics.mypy, -- MyPy diagnostics
                    null_ls.builtins.formatting.black, -- Black for formatting
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            }
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "black",
                "debugpy",
                "mypy",
                "ruff",
                "pyright",
                "lua-language-server",
                "stylua",
                "tflint",
                "terraform-ls",
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            local lspconfig = require "lspconfig"

            -- Set up pyright for Python LSP
            lspconfig.pyright.setup {}

            -- Ensure Terraform Language Server (terraformls) is configured
            lspconfig.terraformls.setup {}

            -- Ensure TFLint is configured
            lspconfig.tflint.setup {}
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "hcl", "lua", "python" }, -- Add other languages as necessary
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false, -- Set to false for performance
                },
            }
        end,
    },
    {
        "LazyVim/LazyVim",
        config = function()
            require("lazy").setup({
                spec = {
                    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
                    { import = "plugins" },
                },
            })
        end,
    }
}

return plugins
