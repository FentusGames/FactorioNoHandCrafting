script.on_configuration_changed(function(event)
	for playerIndex, player in pairs(game.players) do
		if player.gui.top.solar ~= nil then
			player.gui.top.solar.destroy()
		end
		if player.gui.top.steam ~= nil then
			player.gui.top.steam.destroy()
		end
		if player.gui.top.start ~= nil then
			player.gui.top.start.destroy()
		end
	end
end)

script.on_event(defines.events, function(event)
	if event.name == defines.events.on_pre_player_crafted_item then
		local player = game.players[event.player_index]
		
		player.force.manual_crafting_speed_modifier = -1
	end

	if event.name == defines.events.on_player_created then
        local player = game.players[event.player_index]
    
        player.force.manual_crafting_speed_modifier = -1
        player.clear_items_inside()
		
		if player.gui.top.start == nil then
			player.gui.top.add{name= "start", type = "label", caption = "Start", style="fentus_label"}
		end
        
		if player.gui.top.solar == nil then
			local button = player.gui.top.add{name = "solar", type = "button", caption = "Solar", style="nhc_fentus_button"}
		end
		
		if player.gui.top.steam == nil then
			local button = player.gui.top.add{name = "steam", type = "button", caption = "Steam", style="nhc_fentus_button"}
		end
    end
	
    if event.name == defines.events.on_gui_click then
		local click = event.element
        local player = game.players[event.player_index]

		if click.name == "solar" and click.caption == "Solar" then
            if player.gui.top.solar then
                player.gui.top.solar.destroy()
                player.gui.top.steam.destroy()
                player.gui.top.start.destroy()
                
                game.print(player.name.." picked solar!")
                
                player.insert({name = "assembling-machine-1", count = 1})
                player.insert({name = "small-electric-pole", count = 1})
                player.insert({name = "iron-plate", count = 4})
                
                player.insert({name = "solar-panel", count = 1})
            end
        elseif click.name == "steam" and click.caption == "Steam" then
            if player.gui.top.steam then
                player.gui.top.steam.destroy()
                player.gui.top.solar.destroy()
                player.gui.top.start.destroy()
                
                game.print(player.name.." picked steam!")
                
                player.insert({name = "assembling-machine-1", count = 1})
                player.insert({name = "small-electric-pole", count = 1})
                player.insert({name = "iron-plate", count = 4})
                
                player.insert({name = "offshore-pump", count = 1})
                player.insert({name = "boiler", count = 1})
                player.insert({name = "steam-engine", count = 1})
            end
		end
	end
end)