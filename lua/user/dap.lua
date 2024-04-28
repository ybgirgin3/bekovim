local M = {
  "mfussenegger/nvim-dap-python",
  event = "VeryLazy",
}

function M.config()
  local dap = require("dap")

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
    type = 'executable',
    command = vim.fn.stdpath('data')..'/mason/packages/debugpy/venv/bin/python',
    args = { '-m', 'debugpy.adapter' }
  }

  dap.configurations.python = {
    {
      type = 'python',
      request = 'launch',
      name = "Launch file",
      cwd = '${workspaceFolder}',
      program = "${file}",
      args = function()
          local args_string = vim.fn.input("Input arguments: ")
          if args_string == '' then
              return
          else
              return vim.split(args_string, " ")
          end
      end,
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/usr/bin/python'
        end
      end
    },
  }

  dap.adapters.go = function(callback, config)
    local handle
    local pid_or_err
    local port = 38697
    handle, pid_or_err = vim.loop.spawn('dlv', {
      args = { 'dap', '-l', '127.0.0.1:' .. port },
      detached = true,
    }, function(code)
      handle:close()
      print('Delve exited with exit code: ' .. code)
    end)
    -- Wait 100ms for delve to start
    vim.defer_fn(function()
      dap.repl.open()
      callback({ type = 'server', host = '127.0.0.1', port = port })
    end, 100)
  end

  dap.configurations.go = {
    { type = 'go', name = 'Debug', request = 'launch', program = '${file}' },
    {
      type = 'go',
      name = 'Debug test',
      request = 'launch',
      mode = 'test',
      program = '${file}',
    },
  }

end

return M

