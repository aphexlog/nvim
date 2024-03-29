local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end
    }
  }
}

M.lazygit = {
  n = {
    ["<leader>lg"] = {":lua require('lazygit').lazygit()<CR>"}
  }
}

M.copilot = {
  n = {
    ["<leader>cp"] = {":Copilot<CR>"},
  },
}

M.toggleterm = {
  n = {
    ["<leader>tt"] = {":ToggleTerm<CR>"},
  }
}

-- create mappng for stylua formatting
M.stylue = {
  n = {
    ["<leader>gf"] = {"<cmd>lua vim.lsp.buf.formatting()<CR>"},
  }
}

return M
