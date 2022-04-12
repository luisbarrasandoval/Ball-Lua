require 'utils'

Block = {
  x = 0,
  y = 0,
  w = 0,
  h = 0,
  color = {0, 0, 0},
}

function Block:new(o, x, y, w, h, color)
  local o = o or {}
  setmetatable(o, self)
  self.__index = self
  o.x = x
  o.y = y
  o.w = w
  o.h = h
  o.color = color or randomColor()
  return o  
end

function Block:update(dt)

end

function Block:draw()
  -- love.graphics.setColor(math.random(0, 255), math.random(0, 255), math.random(0, 255))
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end