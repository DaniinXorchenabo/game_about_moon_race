local screen_disp_3 = {}

function screen_disp_3.update( dt )
	if screen2 == 1 then
    if returur_sapusk == 0 then
		bak_l = 1
		bak_r = 1
		new_world = 1
		ch_dla_dot2 = 4
		ch = -1
		am_pocaz =am_0
		pl_pocaz = pl_0
		 right_motor_pl = 0
		 left_motor_pl = 0
		ggg2,ggg1 ="--","--"
		emding1 = 0
		emding = 0
		game_over_screen1 = 0
		pologenie_american_start_x =love.math.random(550, 800)
		pologenie_player_start_x =love.math.random(100, 450)
		ra = love.math.random(-100,100)
		ra_am = love.math.random(-100,100)
		ggg2 = "--"
			world = love.physics.newWorld(0, 100, true)
			world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	 
		ball = {}
			ball.b = love.physics.newBody(world,pologenie_player_start_x,0, "dynamic")
			ball.b:setMass(100)
			
			ball.s = love.physics.newRectangleShape(20,37)
			ball.f = love.physics.newFixture(ball.b, ball.s)
			ball.f:setRestitution(0.2)    -- делаем упругим
			ball.f:setFriction(0.9)
			ball.f:setUserData("Block")
		
		american = {}
			american.b = love.physics.newBody(world, pologenie_american_start_x, 0, "dynamic")
			american.b:setMass(20)
			 
			american.s = love.physics.newRectangleShape(20,37)
			american.f = love.physics.newFixture(american.b, american.s)
			american.f:setRestitution(0.2)    -- делаем упругим
			american.f:setFriction(0.9) --сила трения
			american.f:setUserData("Block")
		ra_am_regulator = 0
		pov_r_am = -1
		pov_l_am = -1
		ch = -1
		polus = " "
		monevt = "n"
		texturs_obg ={} 
		for i,v in ipairs(texturs) do
		static = {}
			static.b = love.physics.newBody(world, 400,450, "static")
			static.s = love.physics.newPolygonShape(v)
			static.f = love.physics.newFixture(static.b, static.s)
			static.f:setFriction(0.9)
			static.f:setUserData("Block")
		table.insert(texturs_obg, static) 
		end
		returur_sapusk = returur_sapusk+1
	end
	
    if emding1 == 1 then 
		emding = emding + 1
    end 
	if emding == 1 then
		world:destroy()
		returur_sapusk = 0
		new_world = 0
		retuen_screen_for_reset = 'screen2'
	elseif emding == 0 then
		world:update(dt)
		if bak_r > 0 then
		if love.keyboard.isDown("right") then 
			ball.b:applyForce(60*math.sin( math.rad(ra)), -150*math.cos( math.rad(ra)))
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
			ball.b:applyForce(-60*math.sin( math.rad(ra))*dt, -150*math.cos( math.rad(ra))*dt)
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
	
		bot2(dt)
		x,y = ball.b:getX(),ball.b:getY()
			if (x>3000 or x<-2000) or (y>4000 or y < -2000) then
				
				emding1 = emding1 + 1
				ggg1 = "BOM"
				screen2 = 0
				game_over_screen1 = 1
				retuen_screen_for_reset = 'screen2'
				nadpis = blak_fon,0,0
				random_list = love.math.random(1, 3)
				nadpis2 = list_otgovorok[random_list]
				nadpis2_x = x_list_otgovorok[random_list]
				nadpis2_y = y_list_otgovorok[random_list]
		
		end
		
	end
end

end

function screen_disp_3.draw()
love.graphics.draw(fon7, 0, 0)
love.graphics.draw(background, 0, 0)
if emding == 0 then
	per = ball.b:getWorldPoints(ball.s:getPoints())
	x,y = ball.b:getX(),ball.b:getY()
	speed_x, speed_y = ball.b:getLinearVelocity()

	for i,v in ipairs (texturs_obg) do
		love.graphics.polygon("line", v.b:getWorldPoints(v.s:getPoints()))
	end

	love.graphics.print( ball.b:getX(), 10, 130)
	love.graphics.print( ball.b:getY(), 10, 150)
	love.graphics.print( ra, 10, 110)
	love.graphics.print( speed_x, 10, 70)
	love.graphics.print( speed_y, 10, 90)

	
	if ball.b:getX()<520 then
		if left_motor_pl == 1 and right_motor_pl == 1 then
			pl_pocaz = pl_2
		elseif left_motor_pl == 1 then
			pl_pocaz = pl_l
		elseif right_motor_pl == 1 then
			pl_pocaz = pl_r
		else
			pl_pocaz = pl_0
		end
		love.graphics.draw(pl_pocaz, x, y,  math.rad(ra), 1,1, 10, 25)
	end
	if american.b:getX()>520 then
	love.graphics.draw(am_pocaz, x_am,y_am,  math.rad(ra_am), 1,1, 10,25)
	end
	love.graphics.draw(bak_l_img, 10,50,  0, bak_l,1, 0,0 )
	love.graphics.draw(bak_r_img, 10,30,  0, bak_r,1, 0,0 )
end
end

function bot2(psevdo_dt)
ch = ch+1
	stab(psevdo_dt)

	speed_x_am, speed_y_am = american.b:getLinearVelocity()
	x_am,y_am = american.b:getX(),american.b:getY()
if ra_am<89 and ra_am>-89 then--если так, то можно вклбчать стабилизацию по скорости
	--if speed_y_am > 100
	if speed_y_am > 20 then
		dla_speed_am = 1
	end
	if speed_y_am < -10 then
		dla_speed_am = 0
	end
	if dla_speed_am == 1 then
		american.b:applyForce(30*math.sin( math.rad(ra_am))*speed_y_am/100, -75*math.cos( math.rad(ra_am))*speed_y_am/100)
		american.b:applyForce(-30*math.sin( math.rad(ra_am))*psevdo_dt*speed_y_am/100, -150*math.cos( math.rad(ra_am))*psevdo_dt*speed_y_am/100)
		am_pocaz = am_2
	end
end
if ch% ch_dla_dot2 ==0 then

if x_am > 620 then --right
	monevt ="r"

elseif x_am < 600  then
	monevt = "l"
end
if y_am > 550 then
		american.b:applyForce(60*math.sin( math.rad(ra_am))*speed_y_am/50, -150*math.cos( math.rad(ra_am))*speed_y_am/50)
		american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt*speed_y_am/50, -150*math.cos( math.rad(ra_am))*psevdo_dt*speed_y_am/50)
		american.b:applyForce(60*math.sin( math.rad(ra_am))*speed_y_am/50, -150*math.cos( math.rad(ra_am))*speed_y_am/50)
		american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt*speed_y_am/50, -150*math.cos( math.rad(ra_am))*psevdo_dt*speed_y_am/50)
		am_pocaz = am_2
end
if y_am < 250 then
	ch_dla_dot2 = 4
end
to_left(psevdo_dt)
to_right(psevdo_dt)
end

end

function to_left(psevdo_dt)
if monevt == "l" and ra_am_regulator == 0 then
if speed_y_am < 200 then
	american.b:applyForce(60*math.sin( math.rad(ra_am))*speed_y_am/70, -150*math.cos( math.rad(ra_am))*speed_y_am/70)
	american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt*speed_y_am/70, -150*math.cos( math.rad(ra_am))*psevdo_dt*speed_y_am/70)
	ra_am = ra_am + 0.1
	american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt*speed_y_am/70, -150*math.cos( math.rad(ra_am))*speed_y_am/70)
	am_pocaz = am_l
	end
end
end

function to_right(psevdo_dt)
if monevt == "r" and ra_am_regulator == 0 then
if speed_y_am < 200 then
	american.b:applyForce(60*math.sin( math.rad(ra_am))*speed_y_am/70, -150*math.cos( math.rad(ra_am))*speed_y_am/70)
	american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt*speed_y_am/70, -150*math.cos( math.rad(ra_am))*psevdo_dt*speed_y_am/70)
	ra_am = ra_am - 0.1
	american.b:applyForce(60*math.sin( math.rad(ra_am))*speed_y_am/70, -150*math.cos( math.rad(ra_am))*speed_y_am/70)
	am_pocaz = am_r
	end
end
end


function stab(psevdo_dt)

if ra_am>=-0.2 and ra_am<=0.2 then
	ra_am_regulator = 0
end
if ra_am>180 then
	ra_am = 360-ra_am
end
if ra_am<-180 then
	ra_am = 360+ra_am
end

if (ra_am>30 and ra_am<=180)then
	ra_am_regulator = 1
end
if ra_am<-30 then
	ra_am_regulator = -1
end
if ra_am_regulator == -1 then
	ra_am = ra_am + 0.1
	polus = "+"
	american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am))*psevdo_dt)	
	am_pocaz = am_l
end
if ra_am_regulator == 1 then
	ra_am = ra_am - 0.1
	american.b:applyForce(60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am)))
	am_pocaz = am_r
	polus = "-"
end
end

return screen_disp_3