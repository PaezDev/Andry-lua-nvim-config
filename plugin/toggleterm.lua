local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    }
})

local terminal1 = Terminal:new({
    direction = "float",
})

function _lazygit_toggle()
  lazygit:toggle()
end

function terminal1_toggle()
    terminal1:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-3>', '<cmd>lua terminal1_toggle()<CR>', {noremap = true, silent = true})
