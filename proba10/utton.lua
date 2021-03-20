utton = {}

function utton:create(x,y,id)
local t = {}
t.toch = false
t.x = x
t.y = y
t.id = love.graphics.newImage (id)
return setmetatable(t,{__index = self})
end

function utton:update(dt)
    self.toch = false
    local x = love.mouse.getX(); local y = love.mouse.getY()
    if x > self.x and x < self.x + self.id:getWidth() and y < self.y +self.id:getHeight() and y > self.y then
  self.toch = true
    end
end

function utton:draw()
love.graphics.draw(self.id,self.x,self.y)
end

function utton:mpress(x,y)
    if self.toch then
		self.toch = false
		return true
    end
	return false
end