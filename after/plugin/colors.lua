function ColorMyPencils(color)
    color = color or "medic_chalk"
	vim.cmd.colorscheme("blue")
    vim.cmd.colorscheme(color)
end

ColorMyPencils()

