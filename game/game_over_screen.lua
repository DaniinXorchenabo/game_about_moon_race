local game_over_screen = {}

reset_button = utton:create(400,305, "I_will_sucsessful.png")
to_menu_batton = utton:create(400,415, "go_to_menu.png")
to_menu_batton1 = utton:create(400,455, "go_to_menu.png")
reset_button1 =  utton:create(400,355, 'I_redy_for_new_spasetravle.png')
fon9  = love.graphics.newImage("fon9.png")
nadpis = blak_fon
nadpis2 = blak_fon


function game_over_screen.update( dt )
if game_over_screen1 == 1 then
	reset_button:update(dt)
	to_menu_batton:update(dt)
	end
if game_over_screen1 == 2 then
	reset_button1:update(dt)
	to_menu_batton1:update(dt)
end
end

function game_over_screen.draw()
if game_over_screen1 == 1 then
	love.graphics.draw(fon9,0, 0)
	reset_button:draw()
	to_menu_batton:draw()
	love.graphics.draw(over, 10, 150)
	love.graphics.draw(nadpis,nadpis_x, nadpis_y)
	love.graphics.draw(nadpis2, nadpis2_x, nadpis2_y)
	end
if game_over_screen1 == 2 then
	love.graphics.draw(fon8, 0, 0)
	reset_button1:draw()
	to_menu_batton1:draw()
	love.graphics.draw(finish, 100, 50)
	love.graphics.draw(nadpis,nadpis_x, nadpis_y)
	love.graphics.draw(nadpis2, nadpis2_x, nadpis2_y)
	end
end

return game_over_screen