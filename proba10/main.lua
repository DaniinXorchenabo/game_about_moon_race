function love.load()

dofile("AnAL.lua")
love.window.setMode(1000, 650, {fullscreen=false})

player1_winer = love.graphics.newImage ("player1_winer.png")
player2_winer = love.graphics.newImage ("player2_winer.png")
no_winer = love.graphics.newImage( "nobody_fly_to_spase.png")
CCCR_speek = love.graphics.newImage( "multy_plaers_CCCR_close_program.png")

bak_l_img =  love.graphics.newImage ("bak_mnogo.png")
bak_r_img =  bak_l_img
ramka_bak = love.graphics.newImage ("kontur_bak.png")

background = love.graphics.newImage  ("fon1.png")
background1 = love.graphics.newImage ("fon2.png")
fon5_1 = love.graphics.newImage("fon5_1.png")
fon6 = love.graphics.newImage ("fon6.png")
fon4 = love.graphics.newImage ("fon4.png")
fon7 = love.graphics.newImage ("fon7.jpg")
fon8 = love.graphics.newImage ("fon8.jpg")

over = love.graphics.newImage ("over.png")
finish = love.graphics.newImage ("finish.png")
--eng_fire = love.graphics.newImage ("endfire.png")

am_0 = love.graphics.newImage ("am_0.png")
am_l = love.graphics.newImage ("am_l.png")
am_r = love.graphics.newImage ("am_r.png")
am_2 = love.graphics.newImage ("am_2.png")

pl_0 = love.graphics.newImage ("pl_0.png")
pl_l = love.graphics.newImage ("pl_l.png")
pl_r = love.graphics.newImage ("pl_r.png")
pl_2 = love.graphics.newImage ("pl_2.png")

pl_0_plaer2 = pl_0
pl_l_plaer2 =pl_l
pl_r_plaer2 = pl_r
pl_2_plaer2 = pl_2

--winW, winH = love.graphics.getWidth(), love.graphics.getHeight()
end_big_levl = love.graphics.newImage ("big_levl_naklona_spaseSheep.png")
end_big_speed = love.graphics.newImage ("big_speed_posadki.png")
end_distroy_spasesheep = love.graphics.newImage ("distroy_spasesheep.png")
blak_fon = love.graphics.newImage ("black.png")

america_winer = love.graphics.newImage ("america_winer_4.png")

nadpis = blak_fon
nadpis2 = blak_fon

pobeda = 0 
texturs = {{-400,200, -400,0, -300,120, -300,200},{-300,200, -300,120, -200,160, -200,200},{-200,200,-200,160,-150,160,-150,200},{-150,200, -150,150, -120,80, -70,65, -70,200},
	{-70,200, -70,65, -40,0, -30,10, -30,200},{-30,200, -30,10, -15,-20, -15,200},{-15,200, -15,-20, 50,0, 70,30, 70,200},{70,200, 70,30, 95,30, 120,40, 170,90, 170,200},{170,200, 170,90, 200,100, 200,200},
	{200,200, 200,100,240,100,240,200},{270,200, 270,85, 240,100, 240,200},{270,200, 270,85, 300,30, 340,0, 360,30, 360,200},{360,200, 360,20, 380,-25, 420,-45, 450,-45, 480,-20, 480,200},{480,200, 480,-20, 490,0, 490,200},{490,200, 490,0, 510, 20, 510,200},{510,200, 510,20, 520, 25, 520,200},{520,200, 520,25, 540,20, 540,200},{540,200, 540,20, 560,5, 560,200},{560,200, 560,5, 580,-10, 580,200},{580,200, 580,-10, 600,-20, 600,200},}

screen2 = 0
screen1 = 1
screen4 = 0
screen5 = 0
game_over_screen1 = 0
who_begining_screen = 0
retuen_screen_for_reset = '--'

screen_disp_4    = require 'screen4'
screen_disp_3    = require 'screen3'
screen_disp_1    = require 'screen1'
screen_disp_5    = require 'screen5'
begining_screen  = require 'beginin_screens'
game_over_screen = require 'game_over_screen'

no_cont1 = love.graphics.newImage ("SpaseSheep_becom_cputnic_sun1.png")
no_cont2 = love.graphics.newImage ("CYP_no_conecting.png")
no_cont3 = love.graphics.newImage ("no_conecting.png")
list_otgovorok = {no_cont1,no_cont2,no_cont3,}
x_list_otgovorok = {150,275,275,}
y_list_otgovorok = {500,500,100,}

end
 
function love.update(dt)
if who_begining_screen ~= -1 then
	begining_screen.update( dt )
else

if screen4 == 1 then
	screen_disp_4.update( dt )
end

if screen2 == 1 then
	screen_disp_3.update( dt )
end
if screen1 == 1 then
	screen_disp_1.update( dt )
end
if game_over_screen1 == 1 or game_over_screen1 == 2  then
	game_over_screen.update( dt )
end
if screen5 == 1 then
	screen_disp_5.update( dt )
end
end
end

function love.draw()
if who_begining_screen ~= -1 then
	begining_screen.draw()
else
if screen5 == 1 then
	screen_disp_5.draw()
end
if screen4 == 1 then
	screen_disp_4.draw()
end
if screen2 == 1 then
	screen_disp_3.draw()
end
if screen1 == 1 then
 screen_disp_1.draw()
end
if game_over_screen1 == 1 or game_over_screen1 == 2 then
	game_over_screen.draw()
end

end
end

function beginContact(a, b, coll)
if screen4 == 1 then
	x_stolknovenie,y_stolknovenie, yyy,rrr = b:getMassData()
	x,y = ball_4.b:getX(),ball_4.b:getY()
	local res_pl = x - x_stolknovenie-390
	
	if res_pl <40 and res_pl>-30 then
		ggg1 = "pl_cos"
		if (speed_y <-100 or  speed_y > 100) or (ra > 15 or ra < -15) then
			if (ra > 15 or ra < -15) then
				nadpis,nadpis_x,nadpis_y = end_distroy_spasesheep,150,50
				nadpis2,nadpis2_x,nadpis2_y = end_big_levl,185,500
			else
				nadpis,nadpis_x,nadpis_y = end_distroy_spasesheep,150,50
				nadpis2,nadpis2_x,nadpis2_y = end_big_speed,185,500
			end
			emding1_4 = emding1_4 + 1
			pobeda = 0
			retuen_screen_for_reset = 'screen4'
		end
		if timer_rasr_4 == 0 then
			if speed_y<=50 and ra < 15 and ra > -15 then
				if x > 190 and x < 240 then
					nadpis,nadpis_x,nadpis_y = blak_fon,0,0
					nadpis2,nadpis2_x,nadpis2_y = blak_fon,0,0
					emding1_4 = emding1_4 + 1
					pobeda = 1
					retuen_screen_for_reset = 'screen4'
				end
			end
		end
	 end
 end
 
 
 if screen5 == 1 then
	x_stolknovenie,y_stolknovenie, yyy,rrr = b:getMassData()
	x,y = ball_5.b:getX(),ball_5.b:getY()
	x_plaer2,y_plaer2 = plaer2.b:getX(),plaer2.b:getY()
	local res_pl = x - x_stolknovenie-390
	local res_pl_plaer2 = x_plaer2 - x_stolknovenie-390

	if res_pl <40 and res_pl>-40 then
		if (speed_y <-100 or  speed_y > 100) or (ra > 15 or ra < -15) then
			if (ra > 15 or ra < -15) then
				nadpis,nadpis_x,nadpis_y = end_distroy_spasesheep,150,50
				nadpis2,nadpis2_x,nadpis2_y = end_big_levl,185,500
			else
				nadpis,nadpis_x,nadpis_y = end_distroy_spasesheep,150,50
				nadpis2,nadpis2_x,nadpis2_y = end_big_speed,185,500
			end
			plater1_5 = 0
			retuen_screen_for_reset = 'screen5'

		elseif speed_y<=50 and ra < 15 and ra > -15 then
			if (x > 580 and x < 660)  and plater1_5 ~= 0 then
				emding1_5 = emding1_5 + 1
				pobeda = 1
				retuen_screen_for_reset = 'screen5'
				plater1_5 = 1
				nadpis,nadpis_x,nadpis_y = player1_winer,150,500
				nadpis2,nadpis2_x,nadpis2_y = blak_fon,0,0
			end
		end
	 end
	if res_pl_plaer2 <40 and res_pl_plaer2>-40 then
		ggg1 = "pl_cos"
		if (speed_y_plaer2 <-100 or  speed_y_plaer2 > 100) or (ra_plaer2 > 15 or ra_plaer2 < -15) then
			if (ra_plaer2 > 15 or ra_plaer2 < -15) then
				nadpis,nadpis_x,nadpis_y = end_distroy_spasesheep,150,50
				nadpis2,nadpis2_x,nadpis2_y = end_big_levl,185,500
			else
				nadpis,nadpis_x,nadpis_y = end_distroy_spasesheep,150,50
				nadpis2,nadpis2_x,nadpis2_y = end_big_speed,185,500
			end
			plater2_5 = 0
			retuen_screen_for_reset = 'screen5'

		elseif speed_y_plaer2<=50 and ra_plaer2 < 15 and ra_plaer2 > -15 then
			if (x_plaer2 > 190 and x_plaer2 <240) and plater2_5 ~= 0 then
				emding1_5 = emding1_5 + 1
				pobeda = 1
				retuen_screen_for_reset = 'screen5'
				plater2_5 = 1
				nadpis,nadpis_x,nadpis_y = player2_winer ,150,500
				nadpis2,nadpis2_x,nadpis2_y = blak_fon,0,0
			end
		end
	 end

if plater1_5 == 0 and plater2_5 == 0 then
	emding1_5 = emding1_5 + 1
	pobeda = 0
end
 end

 
 if screen2 == 1 then
	x_am,y_am = american.b:getX(),american.b:getY()
	x_stolknovenie,y_stolknovenie, yyy,rrr = b:getMassData()
	x,y = ball.b:getX(),ball.b:getY()
	speed_x_am, speed_y_am = american.b:getLinearVelocity()

	local res = x_am - x_stolknovenie-390
	local res_pl = x - x_stolknovenie-390
	if res <30 and res>-30 then
		if speed_x_am <-100 or  (ra_am > 31 or ra_am < -31 ) then
		elseif speed_y_am<=100 and ra_am < 15 and ra_am > -15 then
			if x_am < 660 and x_am > 590 then
				emding1 = emding1 + 1
				ggg2 = "am"
				screen2 = 0
				game_over_screen1 = 1
				nadpis = america_winer
				nadpis2 = blak_fon
				retuen_screen_for_reset = 'screen2'
			end
	   end
	end
	 
	if res_pl <40 and res_pl>-30 then
		ggg1 = "pl_cos"
		if (speed_y <-100 or  speed_y > 100) or (ra > 15 or ra < -15) then
			if (ra > 15 or ra < -15) then
				nadpis,nadpis_x,nadpis_y = end_distroy_spasesheep,150,50
				nadpis2,nadpis2_x,nadpis2_y = end_big_levl,185,500
			else
				nadpis,nadpis_x,nadpis_y = end_distroy_spasesheep,150,50
				nadpis2,nadpis2_x,nadpis2_y = end_big_speed,185,500
			end
			emding1 = emding1 + 1
			ggg1 = "BOM"
			screen2 = 0
			game_over_screen1 = 1
			retuen_screen_for_reset = 'screen2'
		elseif speed_y<=50 and ra < 15 and ra > -15 then
			if x > 190 and x < 240 then
				emding1 = emding1 + 1
				ggg1 = "pl"
				retuen_screen_for_reset = 'screen2'
				screen2 = 0
				game_over_screen1 = 2
				nadpis,nadpis_x,nadpis_y = blak_fon,0,0
				nadpis2,nadpis2_x,nadpis2_y = blak_fon,0,0
			end
		end
	 end
 end
end


function love.mousepressed(x, y)
    if button1:mpress(x,y) then
	screen2 = 1
	screen1 = 0
  	screen4 = 0
	screen5 = 0
	new_world = 1
	pokas0 = 0
	who_begining_screen = -1
	per_dla_time = 0
	returur_sapusk = 0
	timer_rasr_3 = 0
	emding_3 = 0
    end
if button2:mpress(x,y) then
	pokas0 = 1
	who_begining_screen = 1
	screen4 = 1
	screen1 = 0
	screen2 = 0
	screen5 = 0
	new_world = 0
	
end
if button3:mpress(x,y) then
	pokas0 = 1
	who_begining_screen = 2
	screen5 = 1
  	screen4 = 0
	screen1 = 0
	screen2 = 0
	new_world = 0
end
if reset_button:mpress(x,y) or reset_button1:mpress(x,y) then
	game_over_screen1 = 0
	if retuen_screen_for_reset == 'screen4' then
		pokas0 = 1
		who_begining_screen = -1
		screen4 = 1
		screen1 = 0
		screen2 = 0
		screen5 = 0
		screen4 = 1
		emding_4 = 0
		returur_sapusk_4 = 0
		new_world = 0
	elseif retuen_screen_for_reset == 'screen2' then
		screen2 = 1
		emding = 0
		returur_sapusk = 0
		pokas0 = 1
		who_begining_screen = -1
		emding = 0
		new_world = 0
	elseif retuen_screen_for_reset == 'screen5' then
		screen5 = 1
		emding_5 = 0
		returur_sapusk_5 = 0
		pokas0 = 1
		who_begining_screen = -1
		emding_5 = 0
		new_world = 0
	end
	
end
if to_menu_batton:mpress(x,y) or to_menu_batton1:mpress(x,y) then
	screen1 = 1
	game_over_screen1 = 0
end
	
end


