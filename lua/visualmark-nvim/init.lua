local api = vim.api

local M = {
    marks_ns = nil
}

function M:enable()
    self.marks_ns = vim.api.nvim_buf_set_virtual_text(0, 0, 5,{{ "haha", "WarningMsg"}}, {})
end

function M:disable()
    if self.marks_ns == nil then
        print('Not enabled ...exiting')
        return
    end
    vim.api.nvim_buf_clear_namespace(0, self.marks_ns, 0,15)
    self.marks_ns = nil
end

function M:toggle()
    if self.marks_ns == nil then
        self:enable()
    else
        self:disable()
    end
end

return M
