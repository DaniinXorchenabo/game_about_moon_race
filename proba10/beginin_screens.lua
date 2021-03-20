local beginin_screens = {}
b_screen0_1 = love.graphics.newImage ("predfix1.png")
b_screen0_2 = love.graphics.newImage ("predfix6.png")
b_multiplay_1 = love.graphics.newImage ("otbor3.png")
b_multiplay_2 = love.graphics.newImage ("dopusk_in_treneragor.png")
b_trener_1 = love.graphics.newImage ("I_can_fly_in_spasesheep.png")
fon6 = love.graphics.newImage ("fon6.png")
per_dla_time = 0
pokas0 = 1

function beginin_screens.update( dt )
if who_begining_screen == 0 then
if pokas0 == 1 then
	if per_dla_time == 0 then
		per_dla_time = 1
		start =  love.timer.getTime()
		pokas0 = 1
	end
	
	if  love.timer.getTime()  - start > 4 then
		pokas0 = 2
		per_dla_time = 0
	else
		pokas0 = 1
	end
	end
	if pokas0 == 2 then
		if per_dla_time == 0 then
			per_dla_time = 1
			start =  love.timer.getTime()
			pokas0 = 1
	end
	if  love.timer.getTime()  - start > 4 then
		pokas0 = 0
		who_begining_screen = -1
		per_dla_time = 0
	else
		pokas0 = 2
	end
	end
end
if who_begining_screen == 1 then
	if per_dla_time == 0 then
		per_dla_time = 1
		start =  love.timer.getTime()
		pokas0 = 1
	end
	if  love.timer.getTime()  - start > 4 then
		pokas0 = 0
		who_begining_screen = -1
		per_dla_time = 0
	else
		pokas0 = 1
end
end
if who_begining_screen == 2 then
if pokas0 == 1 then
	if per_dla_time == 0 then
		per_dla_time = 1
		start =  love.timer.getTime()
		pokas0 = 1
	end
	
	if  love.timer.getTime()  - start > 4 then
		pokas0 = 2
		per_dla_time = 0
	else
		pokas0 = 1
	end
end
if pokas0 == 2 then
	if per_dla_time == 0 then
		per_dla_time = 1
		start =  love.timer.getTime()
		pokas0 = 1
	end
	if  love.timer.getTime()  - start > 4 then
		pokas0 = 0
		who_begining_screen = -1
		per_dla_time = 0
	else
		pokas0 = 2
	end
	end
end
end

function beginin_screens.draw()
if who_begining_screen ~= 0 then
	love.graphics.draw(fon4, 0,0)
end
if who_begining_screen == 0 then
	if pokas0 == 1 then
		love.graphics.draw(b_screen0_1, 175,250)
		
	end
	if pokas0 == 2 then
		love.graphics.draw(fon6, 0,0)
		love.graphics.draw(b_screen0_2, 300,200 )

	end
	
end
if who_begining_screen == 2 then
	if pokas0 == 1 then
		love.graphics.draw(b_multiplay_1, 175,250)
		
	end
	if pokas0 == 2 then
		love.graphics.draw(b_multiplay_2, 125,200 )
	end
	
end
if who_begining_screen == 1 then
	love.graphics.draw(b_trener_1, 150,200 )
end
end

return beginin_screens