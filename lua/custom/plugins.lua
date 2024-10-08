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
        dependencies = "mfussengegger/nvim-dap",
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
        "nvimtools/none-ls.nvim",
        ft = { "python" },
        opts = function()
            return require "custom.configs.none-ls"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "black",
                "debugpy",
                -- "mypy",
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
                    additional_vim_regex_highlighting = true, -- This can be set to true if needed
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
