-- enemy.lua
local enemy = {}
enemy.list = {}
enemy.width = 50
enemy.height = 50
enemy.speed = 100
enemy.spawnTimer = 0
enemy.spawnInterval = 2
enemy.image = love.graphics.newImage('images/enemy.jpeg')

function enemy.load()
end

function enemy.update(dt)
    enemy.spawnTimer = enemy.spawnTimer + dt
    if enemy.spawnTimer >= enemy.spawnInterval then
        enemy.spawnTimer = 0
        local x = math.random(0, love.graphics.getWidth() - enemy.width)
        table.insert(enemy.list, {x = x, y = 0})
    end

    for i, e in ipairs(enemy.list) do
        e.y = e.y + enemy.speed * dt
        if e.y > love.graphics.getHeight() then
            table.remove(enemy.list, i)
        end
    end
end

function enemy.draw()
    local scaleX = enemy.width / enemy.image:getWidth()
    local scaleY = enemy.height / enemy.image:getHeight()
    for _, e in ipairs(enemy.list) do
        love.graphics.draw(enemy.image, e.x, e.y, 0, scaleX, scaleY)
    end
end

return enemy
