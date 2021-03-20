local screen_disp_4 = {}
local img  = love.graphics.newImage("proba_anima2.png")
  -- Загрузка исходной части анимации.
   -- Создание анимации. Кадры 96х96 
   anim = newAnimation(img, 96, 96, 0.1, 0)
--texturs = {{-400,200, -400,0, -300,120, -300,200},{-300,200, -300,120, -200,160, -200,200},{-200,200,-200,160,-150,160,-150,200},{-150,200, -150,150, -120,80, -70,65, -70,200},
--	{-70,200, -70,65, -40,0, -30,10, -30,200},{-30,200, -30,10, -15,-20, -15,200},{-15,200, -15,-20, 50,0, 70,30, 70,200},{70,200, 70,30, 95,30, 120,40, 170,90, 170,200},{170,200, 170,90, 200,100, 200,200},
	--{200,200, 200,100,240,100,240,200},{270,200, 270,85, 240,100, 240,200},{270,200, 270,85, 300,30, 340,0,  340,200},}

text1 = ''
timer_rasr_4 = 0
--pl_0 = love.graphics.newImage ("pl_0.png")
--pl_l = love.graphics.newImage ("pl_l.png")
--pl_r = love.graphics.newImage ("pl_r.png")
--pl_2 = love.graphics.newImage ("pl_2.png")
--background = love.graphics.newImage ("fon1.png")
--background1 = love.graphics.newImage ("fon2.png")
--over = love.graphics.newImage ("over.jpg")
--finish = love.graphics.newImage ("finish.png")

--ch_dla_dot2 = 4
 right_motor_pl = 0
 left_motor_pl = 0
pl_pocaz = pl_0
 ggg1 ='--'
 returur_sapusk_4 = 0
 pologenie_player_start_x =love.math.random(100, 450)
 emding1_4 = 0
 emding_4 = 0
 world_4 = love.physics.newWorld(0, 100, true)
 texturs_obg_4 = {}
 new_world = 0
 ball_4 = {}
			ball_4.b = love.physics.newBody(world_4,pologenie_player_start_x,0, "dynamic")
			ball_4.b:setMass(100)
			
			ball_4.s = love.physics.newRectangleShape(20,37)
			ball_4.f = love.physics.newFixture(ball_4.b, ball_4.s)
			ball_4.f:setRestitution(0.2)    -- делаем упругим
			ball_4.f:setFriction(0.9)
			ball_4.f:setUserData("Block")

--for i,v in ipairs(texturs) do
		--static_4 = {}
		--	static_4.b = love.physics.newBody(world_4, 400,400, "static")
		--	static_4.s = love.physics.newPolygonShape(v)
			--static_4.f = love.physics.newFixture(static_4.b, static_4.s)
			--static_4.f:setFriction(0.9)
			--static_4.f:setUserData("Block")
		--table.insert(texturs_obg_4, static_4) 
--end
--screen3 = 0

function screen_disp_4.update( dt )
--screen3 = 0
--if who_begining_screen == 1 then
	--begining_screen.update( dt )
	--end
if  who_begining_screen == -1 then
if screen4 == 1 then
    if returur_sapusk_4 == 0 then
		bak_l = 1
		bak_r = 1
		new_world = 1
		timer_rasr_4 = 0
		pobeda = 0
		pl_pocaz = pl_0
		right_motor_pl, left_motor_pl = 0,0
		ggg1 ='--'
		emding1_4 = 0
		emding_4 = 0
		pologenie_player_start_x =love.math.random(100, 450)
		ra = love.math.random(-100,100)
			world_4 = love.physics.newWorld(0, 100, true)
			world_4:setCallbacks(beginContact, endContact, preSolve, postSolve)
	 
		 ball_4 = {}
			ball_4.b = love.physics.newBody(world_4,pologenie_player_start_x,0, "dynamic")
			ball_4.b:setMass(100)
			
			ball_4.s = love.physics.newRectangleShape(20,37)
			ball_4.f = love.physics.newFixture(ball_4.b, ball_4.s)
			ball_4.f:setRestitution(0.2)    -- делаем упругим
			ball_4.f:setFriction(0.9)
			ball_4.f:setUserData("Block")
			
		texturs_obg_4 ={} 
		for i,v in ipairs(texturs) do
		static_4 = {}
			static_4.b = love.physics.newBody(world_4, 400,450, "static")
			static_4.s = love.physics.newPolygonShape(v)
			static_4.f = love.physics.newFixture(static_4.b, static_4.s)
			static_4.f:setFriction(0.9)
			static_4.f:setUserData("Block")
		table.insert(texturs_obg_4, static_4) 
		end
		returur_sapusk_4 = returur_sapusk_4+1
	end
	
    if emding1_4 == 1 then 
		emding_4 = emding_4 + 1
    end 
	if emding_4 == 1 then
		if timer_rasr_4 == 0 then
			timer_rasr_4 = 1
			start =  love.timer.getTime()
			right_motor_pl = 0
			left_motor_pl = 0
		end
	end
	--text1 = text1..(love.timer.getTime()  - start)
	if timer_rasr_4 == 1 then
		if  love.timer.getTime()  - start > 3 then
			timer_rasr_4 = 2
			screen4 = 0
			if pobeda == 1 then 
				game_over_screen1 = 2
			else
				game_over_screen1 = 1
			end
			retuen_screen_for_reset = 'screen4'
			world_4:destroy()
			new_world = 0
			returur_sapusk_4 = 0
		else
			timer_rasr_4 = 1
		end
	end
	
	if emding_4 == 0 or timer_rasr_4 == 1 then
		world_4:update(dt)
		if timer_rasr_4 == 0 then
			player_high_motors_4(dt)
		else
			anim:update(dt)
		end
		end
	
end
end
end

function player_high_motors_4(dt)
x,y = ball_4.b:getX(),ball_4.b:getY()
		if (x>2000 or x<-3000) or (y>4000 or y < -2000) then
				emding1_4 = emding1_4 + 1
				ggg1 = "BOM"
				screen4 = 0
				game_over_screen1 = 1
				retuen_screen_for_reset = 'screen4'
				nadpis = blak_fon
				random_list = love.math.random(1, 3)
				random_list = love.math.random(1, 3)
				nadpis2 = list_otgovorok[random_list]
				nadpis2_x = x_list_otgovorok[random_list]
				nadpis2_y = y_list_otgovorok[random_list]
			end
		if bak_r > 0 then
		if love.keyboard.isDown("right") then 
			ball_4.b:applyForce(60*math.sin( math.rad(ra)), -150*math.cos( math.rad(ra)))
			right_motor_pl = 1
			ra= ra - 0.1
			bak_r = bak_r-0.0003
			love.timer.sleep(0.0001)
		else
			right_motor_pl = 0
		end
else
			right_motor_pl = 0
		end
		if bak_l > 0 then
		if love.keyboard.isDown("left") then 
			ball_4.b:applyForce(-60*math.sin( math.rad(ra))*dt, -150*math.cos( math.rad(ra))*dt)
			ra= ra + 0.1
			bak_l = bak_l-0.0003
			love.timer.sleep(0.0001)
			left_motor_pl = 1
		else
		left_motor_pl = 0
		end
		else
			left_motor_pl = 0
		end
end

function screen_disp_4.draw()
if  who_begining_screen == -1 then
if new_world == 1 then
love.graphics.draw(fon7, 0, 0)
love.graphics.draw(fon5_1 , 0, 0)
if screen4 == 1 or timer_rasr_4 == 1 then
if emding_4 == 0 or timer_rasr_4 == 1 then
	per = ball_4.b:getWorldPoints(ball_4.s:getPoints())
	x,y = ball_4.b:getX(),ball_4.b:getY()
	speed_x, speed_y = ball_4.b:getLinearVelocity()

	for i,v in ipairs (texturs_obg_4) do
		--love.graphics.polygon("line", v.static.b:getWorldPoints(v.s:getPoints()))
		love.graphics.polygon("line", v.b:getWorldPoints(v.s:getPoints()))
	end

	love.graphics.print( ball_4.b:getX(), 10, 10)
	love.graphics.print( ball_4.b:getY(), 10, 30)
	love.graphics.print( ra, 10, 50)
	love.graphics.print( speed_x, 10, 70)
	love.graphics.print( speed_y, 10, 90)
	
		if left_motor_pl == 1 and right_motor_pl == 1 then
			pl_pocaz = pl_2
		elseif left_motor_pl == 1 then
			pl_pocaz = pl_l
		elseif right_motor_pl == 1 then
			pl_pocaz = pl_r
		else
			pl_pocaz = pl_0
		end
		
		if ra>180 then
			ra = ra-360
		elseif ra<-180 then
			ra = ra+360
		end
		
		if timer_rasr_4 == 1 and pobeda == 0 then
			if ( ra < -45 and ra >  -90 ) then
				y=y-20
			elseif ( ra < -134 and ra >  -180 ) then
				y=y-20
				x=x-20
			elseif ( ra < -89 and ra >  -135 ) then
			y=y-30
			elseif ( ra > 45 and ra < 90 ) then
				x = x-24
			elseif ( ra > 90 and ra < 135 ) then
				x = x-34
			elseif ( ra > 134 and ra < 180 ) then
				x = x-34
				y=y-30
			end
			
			anim:draw(x+14,y+14,  math.rad(ra), 1,1, 10+46, 25+46)
		else
			love.graphics.draw(pl_pocaz, x, y,  math.rad(ra), 1,1, 10, 25)
			love.graphics.draw(bak_l_img, 10,50,  0, bak_l,1, 0,0 )
			love.graphics.draw(bak_r_img, 10,30,  0, bak_r,1, 0,0 )
		end
end
end
end
end
end


return screen_disp_4