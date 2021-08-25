local function enable()
    print('haha enable')
end

local function disable()
    print('haha disable')
end

local function toggle()
    print('haha toggle')
end

return {
    enable = enable,
    dienable = disable,
    toggle = toggle,
}
