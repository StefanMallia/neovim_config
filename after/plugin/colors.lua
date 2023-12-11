function ColorMyPencils(color)
    color = color or "medic_chalk"
	--color = color or "kanagawa"
	vim.cmd.colorscheme("blue")
    vim.cmd.colorscheme(color)

end

ColorMyPencils()

