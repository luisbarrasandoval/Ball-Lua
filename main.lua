require 'Ball'
require 'Block'

function love.load()
    blocks = {}
    local row = math.random(1, 30)
    local column = math.random(1, 50)
    local separation = 10
    local block_w = love.graphics.getWidth() / column - separation
    local block_h = love.graphics.getHeight() / row - separation


    for i = 1, row do
        for j = 1, column do
            local x = (j - 1) * (block_w + separation) + (separation / 2)
            local y = (i - 1) * (block_h + separation) + (separation / 2)
            table.insert(blocks, Block:new(nil, x, y, block_w, block_h))
        end
    end

    -- balls
    balls = {}
    local ball_r = 10
    local ball_vx = 100
    local ball_vy = 100
    local ball_x = love.graphics.getWidth() / 2 - ball_r
    local ball_y = love.graphics.getHeight() / 2 - ball_r
    table.insert(balls, Ball:new(nil, ball_x, ball_y, ball_r, ball_vx, ball_vy))
    
end


function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        ball = Ball:new(nil, x, y, 10, math.random(-200, 200), math.random(-200, 200))
        table.insert(balls, ball)
    end
end 

function love.update(dt)
 
    for i, ball in ipairs(balls) do
        ball.x = ball.x + ball.vx * dt
        ball.y = ball.y + ball.vy * dt
    end

    for i, ball in ipairs(balls) do
        for j, block in ipairs(blocks) do
            if ball:collide(block) then
                ball.vy = -ball.vy
                table.remove(blocks, j)
            end
        end

        ball:update(dt)
    end

    -- if zero reset
    if #blocks == 0 then
        love.load()
    end

end

function love.draw()
  for i, block in ipairs(blocks) do
    block:draw()
  end

    for i, ball in ipairs(balls) do
        ball:draw()
    end
end
