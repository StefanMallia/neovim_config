require('dap-python').setup('python')
local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
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
        return 'python'
      end
    end;
  },
}

--local rt = require("rust-tools")
--
--rt.setup({
--  server = {
--    on_attach = function(_, bufnr)
--      -- Hover actions
--      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--      -- Code action groups
--      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--    end,
--  },
--})


--dap.adapters.codelldb = {
--    type = 'server',
--    host = '127.0.0.1',
--    port = 13000
--}
--
--dap.configurations.c = {
--    {
--        type = 'codelldb',
--        request = 'launch',
--        program = function()
--            return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
--        end,
--        --program = '${fileDirname}/${fileBasenameNoExtension}',
--        cwd = '${workspaceFolder}',
--        terminal = 'integrated'
--    }
--}
--
--dap.configurations.cpp = dap.configurations.c
--
--dap.configurations.rust = {
--    {
--        type = 'codelldb',
--        request = 'launch',
--        program = function()
--            return vim.fn.input('Path to executable: ', vim.fn.finddir('target/debug/', ".;"), 'file')
--        end,
--        cwd = '${workspaceFolder}',
--        terminal = 'integrated',
--        sourceLanguages = { 'rust' }
--    }
--}



local dap = require('dap')
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
