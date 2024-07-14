-- player.lua
local player = {}
player.x = 400
player.y = 550
player.width = 50
player.height = 50  -- Adjusted height for a better aspect ratio
player.speed = 300
player.image = love.graphics.newImage('images/th.jpeg')

function player.load()
end

function player.update(dt)
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    end

    -- Prevent player from going off the screen
    if player.x < 0 then
        player.x = 0
    elseif player.x > love.graphics.getWidth() - player.width then
        player.x = love.graphics.getWidth() - player.width
    end
end

function player.draw()
    local scaleX = player.width / player.image:getWidth()
    local scaleY = player.height / player.image:getHeight()
    love.graphics.draw(player.image, player.x, player.y, 0, scaleX, scaleY)
end

return player
