local function enable()
    vim.api.nvim_buf_set_virtual_text(0, 0, 5,{{ "haha", "WarningMsg"}}, {})
    print('haha testshadsdsa')
end

local function disable()
    vim.api.nvim_buf_clear_namespace(0, 0, 0,15)
    print('haha disable')
end

local function toggle()
    print('haha toggle')
end

return {
    enable = enable,
    disable = disable,
    toggle = toggle,
}
