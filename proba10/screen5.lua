local screen_disp_5 = {}
local img  = love.graphics.newImage("proba_anima2.png")
anim = newAnimation(img, 96, 96, 0.1, 0)
returur_sapusk_5 = 0
start_5 =  love.timer.getTime()

function screen_disp_5.update( dt )
if  who_begining_screen == -1 then
if screen5 == 1 then
    if returur_sapusk_5 == 0 then
		 right_motor_plaer2 = 0
		left_motor_plaer2 = 0
		bak_l = 1
		bak_r = 1
		bak_l_pl2 = -1
		bak_r_pl2 = -1
		new_world = 1
		timer_rasr_5 = 0
		plater1_5 = 2
		plater2_5 = 2
		pl_pocaz = pl_0
		right_motor_pl, left_motor_pl = 0,0
		ggg1 ='--'
		emding1_5 = 0
		emding_5 = 0
		pologenie_player_start_x =love.math.random(500, 750)
		ra = love.math.random(-100,100)
			world_5 = love.physics.newWorld(0, 100, true)
			world_5:setCallbacks(beginContact, endContact, preSolve, postSolve)
	 
		 ball_5 = {}
			ball_5.b = love.physics.newBody(world_5,pologenie_player_start_x,0, "dynamic")
			ball_5.b:setMass(100)
			
			ball_5.s = love.physics.newRectangleShape(20,37)
			ball_5.f = love.physics.newFixture(ball_5.b, ball_5.s)
			ball_5.f:setRestitution(0.2)    -- делаем упругим
			ball_5.f:setFriction(0.9)
			ball_5.f:setUserData("Block")
			
			
		pologenie_player_start_x_plaer2 =love.math.random(100, 450)
		ra_plaer2 = love.math.random(-100,100)	
		pl_pocaz_plaer2 = pl_0_plaer2
		right_motor_pl_plaer2, left_motor_pl_plaer2 = 0,0	
		plaer2 = {}
			plaer2.b = love.physics.newBody(world_5,pologenie_player_start_x_plaer2,0, "dynamic")
			plaer2.b:setMass(100)
			
			plaer2.s = love.physics.newRectangleShape(20,37)
			plaer2.f = love.physics.newFixture(plaer2.b, plaer2.s)
			plaer2.f:setRestitution(0.2)    -- делаем упругим
			plaer2.f:setFriction(0.9)
			plaer2.f:setUserData("Block")
			
		texturs_obg_5 ={} 
		for i,v in ipairs(texturs) do
		static_5 = {}
			static_5.b = love.physics.newBody(world_5, 400,450, "static")
			static_5.s = love.physics.newPolygonShape(v)
			static_5.f = love.physics.newFixture(static_5.b, static_5.s)
			static_5.f:setFriction(0.9)
			static_5.f:setUserData("Block")
		table.insert(texturs_obg_5, static_5) 
		end
		returur_sapusk_5 = returur_sapusk_5+1
	end
	
	
	
       if emding1_5 == 1 then 
		emding_5 = emding_5 + 1
    end 
	if emding_5 == 1 then
		if timer_rasr_5 == 0 then
			timer_rasr_5 = 1
			start_5 =  love.timer.getTime()
			right_motor_pl = 0--
			left_motor_pl = 0--
		end
	end
		if plater1_5 == 0 and plater2_5 == 0 then
			emding1_5 = emding1_5 + 1
			pobeda = 0
			timer_rasr_5 = 1
			emding_5 = 0
		end
	--text1 = text1..(love.timer.getTime()  - start)
	if timer_rasr_5 == 1 then
		if  love.timer.getTime()  - start_5 > 3 then
			timer_rasr_5 = 2
			screen5 = 0
			if pobeda == 1 then 
				game_over_screen1 = 2
				if plater1_5 == 1 then
					nadpis,nadpis_x, nadpis_y = player2_winer, 200,550
				elseif plater2_5 == 1 then
					nadpis,nadpis_x, nadpis_y = player1_winer, 200,550
				end
				nadpis2,nadpis2_x, nadpis2_y = blak_fon, 0,0
			else
				game_over_screen1 = 1
				nadpis,nadpis_x, nadpis_y = no_winer,200,500
				nadpis2,nadpis2_x, nadpis2_y = CCCR_speek,200,10
			end
			retuen_screen_for_reset = 'screen5'
			world_5:destroy()
			new_world = 0
			returur_sapusk_5 = 0
			emding_5 = 100
		else
			timer_rasr_5 = 1
		end
	end
	
	if emding_5 == 0 or timer_rasr_5 == 1 then
		world_5:update(dt)
		if timer_rasr_5 == 0 then
			player_high_motors_5(dt)
		else
			anim:update(dt)
		end
		end
end
end
end

function player_high_motors_5(dt)

x,y = ball_5.b:getX(),ball_5.b:getY()
x_plaer2,y_plaer2 = plaer2.b:getX(),plaer2.b:getY()
if plater1_5 ~= 0 then
		if ((x>2000 or x<-3000) or (y>4000 or y < -2000)) then--or (x_plaer2>2000 or x_plaer2<-2000) or (y_plaer2>4000 or y_plaer2 < -2000) then
				--emding1_5 = emding1_5 + 1
				--screen5 = 0
				--game_over_screen1 = 1
				retuen_screen_for_reset = 'screen5'
				plater1_5 = 0
			
				--nadpis = blak_fon
				--nadpis2 = list_otgovorok[love.math.random(1, 3)]
			--else
				--nadpis = blak_fon
				--nadpis2 = list_otgovorok[love.math.random(1, 3)]
			--end
		end
		if bak_r > 0 then
		if love.keyboard.isDown("right") then 
			ball_5.b:applyForce(60*math.sin( math.rad(ra)), -150*math.cos( math.rad(ra)))
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
			ball_5.b:applyForce(-60*math.sin( math.rad(ra))*dt, -150*math.cos( math.rad(ra))*dt)
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
if plater1_5 == 0 then	
	anim:update(dt)
end

if plater2_5 ~= 0 then
	if (x_plaer2>2000 or x_plaer2<-3000) or (y_plaer2>4000 or y_plaer2 < -2000) then
		retuen_screen_for_reset = 'screen5'
		plater2_5 = 0
	end
	if bak_r_pl2<0 then
		if love.keyboard.isDown("d") then 
			plaer2.b:applyForce(60*math.sin( math.rad(ra_plaer2)), -150*math.cos( math.rad(ra_plaer2)))
			right_motor_pl_plaer2 = 1
			ra_plaer2 = ra_plaer2 - 0.1
			bak_r_pl2 = bak_r_pl2 +0.0003
			love.timer.sleep(0.0001)
		else
			right_motor_pl_plaer2 = 0
		end
		else
			right_motor_pl_plaer2 = 0
		end
	if bak_l_pl2<0 then
		if love.keyboard.isDown("a") then 
			plaer2.b:applyForce(-60*math.sin( math.rad(ra_plaer2))*dt, -150*math.cos( math.rad(ra_plaer2))*dt)
			ra_plaer2 = ra_plaer2 + 0.1
			bak_l_pl2 = bak_l_pl2 +0.0003
			love.timer.sleep(0.0001)
			
			left_motor_pl_plaer2 = 1
		else
		left_motor_pl_plaer2 = 0
		end
		else
		left_motor_pl_plaer2 = 0
		end
end
if plater2_5 == 0 then
	anim:update(dt)
end

end

function screen_disp_5.draw()
if  who_begining_screen == -1 then
if new_world == 1 then
love.graphics.draw(fon7, 0, 0)
love.graphics.draw(background, 0, 0)
if screen5 == 1 or timer_rasr_5 == 1 then
if emding_5 == 0 or timer_rasr_5 == 1 then
	x,y = ball_5.b:getX(),ball_5.b:getY()
	speed_x, speed_y = ball_5.b:getLinearVelocity()

	for i,v in ipairs (texturs_obg_5) do
		love.graphics.polygon("line", v.b:getWorldPoints(v.s:getPoints()))
	end
	if ra>180 then
			ra = ra-360
		elseif ra<-180 then
			ra = ra+360
		end
	if ra_plaer2>180 then
		ra_plaer2 = ra_plaer2-360
	elseif ra_plaer2<-180 then
		ra_plaer2 = ra_plaer2+360
	end
	love.graphics.print( ball_5.b:getX(), 750, 70)
	love.graphics.print( ball_5.b:getY(), 750, 30)
	love.graphics.print( ra, 750, 50)
	love.graphics.print( speed_x, 750, 70)
	love.graphics.print( speed_y, 750, 90)

		if left_motor_pl == 1 and right_motor_pl == 1 then
			pl_pocaz = pl_2
		elseif left_motor_pl == 1 then
			pl_pocaz = pl_l
		elseif right_motor_pl == 1 then
			pl_pocaz = pl_r
		else
			pl_pocaz = pl_0
		end
	
	x_plaer2,y_plaer2 = plaer2.b:getX(),plaer2.b:getY()
	speed_x_plaer2, speed_y_plaer2 = plaer2.b:getLinearVelocity()
			if left_motor_pl_plaer2 == 1 and right_motor_pl_plaer2 == 1 then
			pl_pocaz_plaer2 = pl_2_plaer2
			
		elseif left_motor_pl_plaer2 == 1 then
			pl_pocaz_plaer2 = pl_l_plaer2
			
		elseif right_motor_pl_plaer2 == 1 then
			pl_pocaz_plaer2 = pl_r_plaer2
			
		else
			pl_pocaz_plaer2 = pl_0_plaer2
		end
	--end

	if plater1_5 ~= 0 then
		if ball_5.b:getX()>500 then
		love.graphics.draw(pl_pocaz, x, y,  math.rad(ra), 1,1, 10, 25)
		end
			love.graphics.draw(bak_l_img, 790,50,  0, -bak_l,1, 0,0 )
			love.graphics.draw(bak_r_img, 790,30,  0, -bak_r,1, 0,0 )
	else
		if ( ra < -45 and ra >  -90 ) then
			y=y-20
		end
		if ( ra < -134 and ra >  -180 ) then
			y=y-20
			x=x-20
		end
		if ( ra < -89 and ra >  -135 ) then
			y=y-30
		end
		if ( ra > 45 and ra < 90 ) then
			x = x-24
		end
		if ( ra > 90 and ra < 135 ) then
			x = x-34
		end
		if ( ra > 134 and ra < 180 ) then
			x = x-34
			y=y-30
		end
		if ball_5.b:getX()>500 then
		anim:draw(x+14,y+14,  math.rad(ra), 1,1, 10+46, 25+46)
		end
	end

			
			


		if plater2_5 ~= 0 then
		if plaer2.b:getX()<520 then
			love.graphics.draw(pl_pocaz_plaer2, x_plaer2, y_plaer2,  math.rad(ra_plaer2), 1,1, 10, 25)
		end
			love.graphics.draw(bak_l_img, 10,50,  0, -bak_l_pl2,1, 0,0 )
			love.graphics.draw(bak_r_img, 10,30,  0, -bak_r_pl2,1, 0,0 )
		else
			if ( ra_plaer2 < -45 and ra_plaer2 >  -90 ) then
				y_plaer2=y_plaer2-20
			end
			if ( ra_plaer2 < -134 and ra_plaer2 >  -180 ) then
				y_plaer2=y_plaer2-20
				x_plaer2=x_plaer2-20
			end
			if ( ra_plaer2 < -89 and ra_plaer2 >  -135 ) then
			y_plaer2=y_plaer2-30
			end
			if ( ra_plaer2 > 45 and ra_plaer2 < 90 ) then
				x_plaer2 = x_plaer2-24
				--y=y+10
			end
			if ( ra_plaer2 > 90 and ra_plaer2 < 135 ) then
				x_plaer2= x_plaer2-34
				--y=y+10
			end
			if ( ra_plaer2 > 134 and ra_plaer2 < 180 ) then
				x_plaer2 = x_plaer2-34
				y_plaer2=y_plaer2-30
			end
		if plaer2.b:getX()<520 then
		anim:draw(x_plaer2+14,y_plaer2+14,  math.rad(ra_plaer2), 1,1, 10+46, 25+46)
		end
		end

	
end
end
end
end
end

return screen_disp_5