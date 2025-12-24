---@brief
---
--- https://pyrefly.org/
---
---`pyrefly`, a faster Python type checker written in Rust.
--
-- `pyrefly` is still in development, so please report any errors to
-- our issues page at https://github.com/facebook/pyrefly/issues.

local function uv_script_interpreter(script_path)
  local result = vim.system(
    { 'uv', 'python', 'find', '--script', script_path },
    { text = true }
  ):wait()
  if result.code == 0 then
    return vim.fn.trim(result.stdout)
  end
end

local function uv_interpreter(script_path)
  local result = vim.system(
    { 'uv', 'python', 'find' },
    { text = true }
  ):wait()
  if result.code == 0 then
    return vim.fn.trim(result.stdout)
  end
end

---@type vim.lsp.Config
return {
  before_init = function(_, config)
    local script = vim.api.nvim_buf_get_name(0)
    local python = uv_script_interpreter(script)
    if not python then
      python = uv_interpreter(script)
    end
    config.settings = config.settings or {}
    config.settings.pythonPath = python
  end,
}
