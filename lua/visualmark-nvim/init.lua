local api = vim.api

local M = {
    marks_ns = nil
}

function M:enable()
    if self.marks_ns ~= nil then
        print('Already enabled ...exiting')
    end

    for k,v in pairs(vim.fn.getmarklist("%")) do
        local mark_name_label = v['mark']
        local mark_name = string.sub(mark_name_label, 2)
        if string.match(mark_name, "%w") then
            local line_num = v['pos'][2] - 1
            if self.marks_ns == nil then
                self.marks_ns = vim.api.nvim_buf_set_virtual_text(0, 0, line_num,{{ mark_name_label, "WarningMsg"}}, {})
            else
                vim.api.nvim_buf_set_virtual_text(0, self.marks_ns, line_num,{{ mark_name_label, "WarningMsg"}}, {})
            end
        end
    end
end

function M:disable()
    if self.marks_ns == nil then
        print('Not enabled ...exiting')
        return
    end
    vim.api.nvim_buf_clear_namespace(0, self.marks_ns, 0, -1)
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
