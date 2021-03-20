local screen_disp_1 = {}


 button = require 'utton'
 button1 = utton:create(400,385, "start_button.png")
 button2 = utton:create(400,190, "I_wont_fly.png")
 button3 = utton:create(400,275, "I_wont_flyer.png")


function screen_disp_1.update( dt )
	button1:update(dt)
	button2:update(dt)
	button3:update(dt)
end

function screen_disp_1.draw()
love.graphics.draw(fon6, 0,0)
	button1:draw()
    button2:draw()
	button3:draw()
end



return screen_disp_1