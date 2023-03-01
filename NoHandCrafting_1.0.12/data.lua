for name, recipe in pairs(data.raw["recipe"]) do
	if data.raw["recipe"][name].category == nil or data.raw["recipe"][name].category == "crafting" then
		data.raw["recipe"][name].category = "advanced-crafting"
	end
end

data:extend(
    {
        {
            type = "font",
            name = "fentus_font",
            from = "default-bold",
            size = 16
        }
    }
)

data.raw["gui-style"].default["nhc_fentus_button"]  =
{
	type = "button_style",
	font = "fentus_font",
	font_color = {r = 1, g = 0.2, b = 0.3},
	parent = "button",
	default_graphical_set =
	{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "low",
		corner_size = {2, 2},
		position = {8, 0}
	},
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	
	maximal_width = 100,
	minimal_width = 100,
	
	left_click_sound =
	{
		{
			filename = "__core__/sound/gui-click.ogg",
			volume = 1
		}
	},

}

data.raw["gui-style"].default["fentus_label"] =
{
	type = "label_style",
	font = "fentus_font",
	font_color = {r = 1, g = 0.2, b = 0.3},
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
}