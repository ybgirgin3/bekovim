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

	local function get_python_path()
		local venv_path = os.getenv("VIRTUAL_ENV")
		if venv_path then
			return venv_path .. "/bin/python"
		end

		return vim.fn.exepath("python3") or vim.fn.exepath("python")
	end

	-- launch.json dosyasını okuma
	local function read_launch_json()
		local path = ".vscode/launch.json"
		local file = io.open(path, "r")
		if file then
			local content = file:read("*a")
			file:close()
			local json = vim.fn.json_decode(content)
			return json
		else
			return nil
		end
	end

	-- launch.json'dan DAP yapılandırmalarını ayarlama
	local function setup_python_dap()
		local launch_config = read_launch_json()
		if launch_config and launch_config.configurations then
			for _, config in ipairs(launch_config.configurations) do
				if config.type == "python" then
					-- dap.configurations.python ayarlarını yapılandır
					table.insert(dap.configurations.python, {
						type = config.type,
						request = config.request,
						name = config.name,
						program = config.program,
						console = config.console or "integratedTerminal",
						args = config.args or {},
					})

					-- Eğer `pythonPath` gibi bir ayar varsa, dap.adapters.python'a ekle
					if config.pythonPath then
                        print('python config is exists')
						dap.adapters.python = {
							type = "executable",
							command = config.pythonPath, -- launch.json'daki pythonPath kullanılır
							args = { "-m", "debugpy.adapter" },
						}
					else
						-- pythonPath yoksa, sistemdeki varsayılan Python yorumlayıcısını kullan
                        print('no python path')
						dap.adapters.python = {
							type = "executable",
							command = get_python_path(),
							args = { "-m", "debugpy.adapter" },
						}
					end
				end
			end
		else
			print("launch.json bulunamadı veya geçerli bir Python yapılandırması yok.")
		end
	end

	setup_python_dap()

	dap.adapters.go = function(callback, config)
		local handle
		local pid_or_err
		local port = 38697
		handle, pid_or_err = vim.loop.spawn("dlv", {
			args = { "dap", "-l", "127.0.0.1:" .. port },
			detached = true,
		}, function(code)
			handle:close()
			print("Delve exited with exit code: " .. code)
		end)
		-- Wait 100ms for delve to start
		vim.defer_fn(function()
			dap.repl.open()
			callback({ type = "server", host = "127.0.0.1", port = port })
		end, 100)
	end

	dap.configurations.go = {
		{ type = "go", name = "Debug", request = "launch", program = "${file}" },
		{
			type = "go",
			name = "Debug test",
			request = "launch",
			mode = "test",
			program = "${file}",
		},
	}
end

return M
