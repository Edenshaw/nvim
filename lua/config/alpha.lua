local M = {}

function M.setup()
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local dashboard = require "alpha.themes.dashboard"
  local function header()
    return {
[[                                               iiii                          ]],
[[                                              i::::i                         ]],
[[                                               iiii                          ]],
[[                                                                             ]],
[[xxxxxxx      xxxxxxxvvvvvvv           vvvvvvviiiiiii    mmmmmmm    mmmmmmm   ]],
[[ x:::::x    x:::::x  v:::::v         v:::::v i:::::i  mm:::::::m  m:::::::mm ]],
[[  x:::::x  x:::::x    v:::::v       v:::::v   i::::i m::::::::::mm::::::::::m]],
[[   x:::::xx:::::x      v:::::v     v:::::v    i::::i m::::::::::::::::::::::m]],
[[    x::::::::::x        v:::::v   v:::::v     i::::i m:::::mmm::::::mmm:::::m]],
[[     x::::::::x          v:::::v v:::::v      i::::i m::::m   m::::m   m::::m]],
[[     x::::::::x           v:::::v:::::v       i::::i m::::m   m::::m   m::::m]],
[[    x::::::::::x           v:::::::::v        i::::i m::::m   m::::m   m::::m]],
[[   x:::::xx:::::x           v:::::::v        i::::::im::::m   m::::m   m::::m]],
[[  x:::::x  x:::::x           v:::::v         i::::::im::::m   m::::m   m::::m]],
[[ x:::::x    x:::::x           v:::v          i::::::im::::m   m::::m   m::::m]],
[[xxxxxxx      xxxxxxx           vvv           iiiiiiiimmmmmm   mmmmmm   mmmmmm]],
   }
  end

  dashboard.section.header.val = header()

  dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
    dashboard.button("q", "  Quit xvim", ":qa<CR>"),
  }

  local function footer()
    -- Number of plugins
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    local plugins_text = 
      "   "
      .. total_plugins
      .. " plugins"
      .. "   v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch
      .. "   "
      .. datetime

    -- Quote
    local fortune = require "alpha.fortune"
    local quote = table.concat(fortune(), "\n")

    return plugins_text .. "\n\n" .. quote
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Constant"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Function"
  dashboard.section.buttons.opts.hl_shortcut = "Type"
  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end

return M
