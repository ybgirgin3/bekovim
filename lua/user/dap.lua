local M = {
  "mfussenegger/nvim-dap-python",
  event = "VeryLazy",
}

function M.config()
  local dap = require "dap"

  local dap_ui_status_ok, dapui = pcall(require, "dapui")
  if not dap_ui_status_ok then
    return
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

    dap.adapters.python = {
      type = 'executable';
      command = vim.fn.stdpath('data')..'/mason/packages/debugpy/venv/bin/python',
      args = { '-m', 'debugpy.adapter' };
    }


    dap.configurations.python = {
      {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch';
        name = "Launch file";
        cwd = '${workspaceFolder}',
        program = "${file}"; -- This configuration will launch the current file if used.
        args = function()
            local args_string = vim.fn.input("Input arguments: ")
            return vim.split(args_string, " ")
        end,        -- program = function ()
        --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        -- end,
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end;
      },
    }
end


-- M = {
--   "ravenxrz/DAPInstall.nvim",
--   commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
--   config = function()
--     require("dap_install").setup {}
--     require("dap_install").config("python", {})
--   end,
-- }


return M
