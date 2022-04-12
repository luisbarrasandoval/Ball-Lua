Ball = {
  x = 0,
  y = 0,
  width = 0,
  height = 0,
  vx = 0, -- velocity x
  vy = 0, -- velocity y
}

function Ball:new(o, x, y, r, vx, vy)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    o.x = x
    o.y = y
    o.radius = r
    o.vx = vx
    o.vy = vy

    return o
end

function Ball:collide(block)
    local dx = self.x - block.x
    local dy = self.y - block.y
    local distance = math.sqrt(dx * dx + dy * dy)
    if distance < self.radius + block.w / 2 then
        return true
    end
    return false
end

function Ball:update(dt)
    self.x = self.x + self.vx * dt
    self.y = self.y + self.vy * dt

    if self.x < 0 then
        self.x = 0
        self.vx = -self.vx
    end

    if self.x > love.graphics.getWidth() then
        self.x = love.graphics.getWidth()
        self.vx = -self.vx
    end

    if self.y < 0 then
        self.y = 0
        self.vy = -self.vy
    end

    if self.y > love.graphics.getHeight() then
        self.y = love.graphics.getHeight()
        self.vy = -self.vy
    end
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end
