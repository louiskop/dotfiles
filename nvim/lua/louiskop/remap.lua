
-- open netrw
vim.keymap.set("n", '<leader>fi', vim.cmd.Ex)

-- move selected text 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in middle of screen when half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- copy to system clipboard 
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- paste from system clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")

-- stay in visual mode when indenting
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('x', '<', '<gv')

-- toggle comments and stay in visual mode
vim.keymap.set('x', '<C-_>', function()
    local esc = vim.api.nvim_replace_termcodes(
        '<ESC>', true, false, true
    )
    
    vim.api.nvim_feedkeys(esc, 'nx', false)

    require ('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())
    vim.api.nvim_feedkeys('gv', 'n', false)
end)

-- insert a line above and below cursor (padded line)
vim.keymap.set("n", "U", "O<ESC>o");

-- add some more space to the end of the file
vim.keymap.set("n", "<leader>m", "G10o<ESC><C-o>");
