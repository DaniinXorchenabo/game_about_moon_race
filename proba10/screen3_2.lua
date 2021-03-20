local screen_disp_3 = {}
local img  = love.graphics.newImage("proba_anima2.png")
anim = newAnimation(img, 96, 96, 0.1, 0)

--no_cont1 = love.graphics.newImage ("SpaseSheep_becom_cputnic_sun1.png")
--no_cont2 = love.graphics.newImage ("CYP_no_conecting.png")
--no_cont3 = love.graphics.newImage ("no_conecting.png")
--list_otgovorok = {no_cont1,no_cont2,no_cont3,}

sss = '============'



ch_dla_dot2 = 4
 emding1 = 0
 emding_3 = 0
returur_sapusk = 0
 ch = -1
 ra_am = 0.1
 world = love.physics.newWorld(0, 100, true)
 ball = {}
 american = {}
 emding1 = 0
 emding_3 = 0
		 am_pocaz =am_0
		 pl_pocaz = pl_0
		 right_motor_pl = 0
		 left_motor_pl = 0
--utton = {}
text = ""

--button = require 'utton'
--button = utton:create(100,100, 'fire.png')
function screen_disp_3.update( dt )
if  who_begining_screen == -1 then
	if screen2 == 1 then
    if returur_sapusk == 0 then
		bak_l = 1
		bak_r = 1
		new_world = 1
		timer_rasr_3 = 0
		pobeda = 2
		am_pocaz =am_0
		pl_pocaz = pl_0
		 right_motor_pl = 0
		 left_motor_pl = 0
		ggg2,ggg1 ="--","--"
		emding1 = 0
		emding_3 = 0
		game_over_screen1 = 0
		who_begining_screen = -1
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
			--love.physics.setFriction()
			american.f = love.physics.newFixture(american.b, american.s)
			american.f:setRestitution(0.2)    -- делаем упругим
			american.f:setFriction(0.9)
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
	
    --if emding1 == 1 then 
		--emding_3 = emding_3 + 1
    --end 
	if emding_3 == 1 then
		if timer_rasr_3 == 0 then
			timer_rasr_3 = 1
			start =  love.timer.getTime()
			right_motor_pl = 0
			left_motor_pl = 0
		end
	end
	if emding_3 == 0 or timer_rasr_3 == 1 then
		world:update(dt)
		who_begining_screen = -1
		bot2(dt)
		player_high_motors_3(dt)
		if timer_rasr_3 == 0 then
			
		else
			anim:update(dt)
		end
	--text1 = text1..(love.timer.getTime()  - start)
	if timer_rasr_3 == 1 then
		if  love.timer.getTime()  - start > 3 then
			timer_rasr_3 = 2
			screen3 = 0
			if pobeda == 1 then 
				game_over_screen1 = 2
			else
				game_over_screen1 = 1
			end
			retuen_screen_for_reset = 'screen2'
			--world:destroy()
			new_world = 0
			returur_sapusk = 0
		else
			timer_rasr_3 = 1
		end
	end
	--end
end
		
		

		
	end
end

end

function player_high_motors_3(dt)
x,y = ball.b:getX(),ball.b:getY()
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


function screen_disp_3.draw()
if  who_begining_screen == -1 then
if new_world == 1 then
love.graphics.draw(fon7, 0, 0)
love.graphics.draw(background, 0, 0)
if screen2 == 1 or timer_rasr_3 == 1 then
if emding_3 == 0 or timer_rasr_3 == 1 then

	per = ball.b:getWorldPoints(ball.s:getPoints())
	x,y = ball.b:getX(),ball.b:getY()
	speed_x, speed_y = ball.b:getLinearVelocity()

	for i,v in ipairs (texturs_obg) do
		--love.graphics.polygon("line", v.static.b:getWorldPoints(v.s:getPoints()))
		love.graphics.polygon("line", v.b:getWorldPoints(v.s:getPoints()))
	end

	love.graphics.print( ball.b:getX(), 10, 210)
	love.graphics.print( ball.b:getY(), 10, 230)
	love.graphics.print( ra, 10, 250)
	love.graphics.print( speed_x, 10, 70)
	love.graphics.print( speed_y, 10, 90)
	--love.graphics.print(x_am,800,10)
	--love.graphics.print( y_am,800,30)
	--love.graphics.print( ra_am,800,50)
	--love.graphics.print(speed_x_am,800,70)
	--love.graphics.print( speed_y_am,800,90)
	--love.graphics.print( monevt,800,110)
	--love.graphics.print( pov_r_am,800,130)
	--love.graphics.print( emding1,800,150)
	--love.graphics.print(returur_sapusk ,800,170)
	--love.graphics.print(text, 50, 400)
	--love.graphics.print( texturs_obg, 10, 70)
	--love.graphics.print( texturs_obg, 10, 70)
	--love.graphics.rotate(math.rad(ra))
	
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
			if ra>180 then
			ra = ra-360
		elseif ra<-180 then
			ra = ra+360
		end
		
		if timer_rasr_3 == 1 and pobeda == 0 then
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
				--y=y+10
			end
			if ( ra > 90 and ra < 135 ) then
				x = x-34
				--y=y+10
			end
			if ( ra > 134 and ra < 180 ) then
				x = x-34
				y=y-30
			end
			
			anim:draw(x+14,y+14,  math.rad(ra), 1,1, 10+46, 25+46)
		else
			love.graphics.draw(pl_pocaz, x, y,  math.rad(ra), 1,1, 10, 25)
				love.graphics.draw(bak_l_img, 10,50,  0, bak_l,1, 0,0 )
				love.graphics.draw(bak_r_img, 10,30,  0, bak_r,1, 0,0 )
		end
	--love.graphics.draw(am_pocaz, x_am,y_am,  math.rad(ra_am), 1,1, 10,25)
	--love.graphics.draw(bak_l_img, 10,50,  0, bak_l,1, 0,0 )
	--love.graphics.draw(bak_r_img, 10,30,  0, bak_r,1, 0,0 )
end
end
end
end
end

--function beginContact(a, b, coll)

-- end
 
--function endContact(a, b, coll)
    --persisting = 0
    --text = text.."\n"..a:getUserData().." uncolliding with "..b:getUserData()
--end
 

--function preSolve(a, b, coll)
    --if persisting == 0 then    -- только говорит, когда они впервые начинают касаться
        --text = text.."\n"..a:getUserData().." touching "..b:getUserData()
    --elseif persisting < 20 then    -- затем просто начинается вести отсчет
        --text = text.." "..persisting
    --end
    --persisting = persisting + 1    -- отслеживает как много обновлений они соприкасались
--end

 
--function postSolve(a, b, coll)
--end

--function love.keypressed(key) 

  	--if love.keyboard.isDown("s") then
		--emding = 0
		--returur_sapusk = 0
	--end
--end

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

if x_am > 820 then --right
	monevt ="r"

elseif x_am < 800  then
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

function bot1(psevdo_dt)
	american.b:applyForce(60*math.sin( math.rad(ra_am)), -150*math.cos( math.rad(ra_am)))
	ra_am= ra_am - 0.1
	american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am)))
	ra_am= ra_am + 0.1
	am_pocaz = am_2
	love.timer.sleep(0.1)
end
function bot(psevdo_dt)

speed_x_am, speed_y_am = american.b:getLinearVelocity()
x_am,y_am = american.b:getX(),american.b:getY()
if x_am - 600 > 200 and  x_am - 600 < 200 then
if ra_am>50 then
	ra_am_regulator = 1
end
if ra_am<-50 then
	ra_am_regulator = -1
end
else
if ra_am>30 then
	ra_am_regulator = 1
end
if ra_am<-30 then
	ra_am_regulator = -1
end
end
if ra_am_regulator == -1 then
	ra_am = ra_am + 0.1
	polus = "+"
	american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am))*psevdo_dt)	
end
if ra_am_regulator == 1 then
	ra_am = ra_am - 0.1
	american.b:applyForce(60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am)))
	polus = "-"
end

if ra_am>=-15 and ra_am<=15 then
	ra_am_regulator = 0
end
--if monevt == "n" then
	if speed_y_am > 200 then
		dla_speed_am = 1
	end
	if speed_y_am < -100 then
		dla_speed_am = 0
	end
	if dla_speed_am == 1 then
		american.b:applyForce(60*math.sin( math.rad(ra_am)), -150*math.cos( math.rad(ra_am)))
		american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am))*psevdo_dt)
	end
--end
polus = " "
if ra_am_regulator == 0 then
polus = " || "
	if (x_am > 820 and monevt == "n") then --right
		monevt = "r"
	end
	if (x_am < 800 and monevt == "n") then
		monevt = "l"
	end
	

	--if y_am - 490 < 200 then
		if monevt == "r" then--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\!!!!!!!!!!!!!!
				if ra_am>-25 and ra_am<-20 then -- 2 этап  можно лететь с 2 двигателями
					if x_am < 800 then -- 3 этап  уже нужно включить левый двигатель
						pov_r_am = 1
					end
					if pov_r_am == 0 then
						american.b:applyForce(60*math.sin( math.rad(ra_am)), -150*math.cos( math.rad(ra_am)))
						american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am)))
					end
					if pov_r_am == 1 then
						ra_am = ra_am + 0.1
						american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am)))
						if ra_am>0 then
							monevt = "n"
						end
					end
				end
				if pov_r_am == -1 then-- 1 этап  включаем правый двигатель для поворота, чтобы лететь прямо
					ra_am = ra_am - 0.1
					american.b:applyForce(60*math.sin( math.rad(ra_am)), -150*math.cos( math.rad(ra_am)))
					if ra_am<-20 then
						pov_r_am = -1
						pov_r_am = 0
					end
				end
			end
		
		if monevt == "l" then
				if ra_am<25 and ra_am>20 then --2 этап можно лететь с 2 двигателями
					if x_am < 620 then -- 3 этап  уже нужно включить правый двигатель
						pov_l_am = 1
					end
					if pov_l_am == 0 then
						american.b:applyForce(60*math.sin( math.rad(ra_am)), -150*math.cos( math.rad(ra_am)))
						american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am))*psevdo_dt)
					end
					if pov_l_am == 1 then
						ra_am = ra_am - 0.1
						american.b:applyForce(60*math.sin( math.rad(ra_am)), -150*math.cos( math.rad(ra_am)))
						if ra_am>0 then
							pov_l_am = -1
							monevt = "n"
						end
					end
				end
				if pov_l_am == -1 then-- 1 этап  включаем левый двигатель для поворота, чтобы лететь прямо
					ra_am = ra_am + 0.1
					american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am)))
					if ra_am>24 then
						pov_l_am = 0
					end
				end
			end
		
		----------------------------------------------
		--if x_am < 600 then--left
			--ra_am = ra_am + 0.1
			--american.b:applyForce(-60*math.sin( math.rad(ra_am))*psevdo_dt, -150*math.cos( math.rad(ra_am))*psevdo_dt)
		--end
		---------------------------------------------
	--end
end
end

return screen_disp_3