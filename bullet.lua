-- bullet.lua
local bullet = {}
local enemy = require "enemy"

bullet.list = {}
bullet.speed = 500
bullet.width = 5
bullet.height = 20

function bullet.spawn(x, y)
    table.insert(bullet.list, {x = x, y = y})
end

function bullet.update(dt)
    for i = #bullet.list, 1, -1 do
        local b = bullet.list[i]
        b.y = b.y - bullet.speed * dt

        if b.y < 0 then
            table.remove(bullet.list, i)
        else
            for j = #enemy.list, 1, -1 do
                local e = enemy.list[j]
                if checkCollision(b.x, b.y, bullet.width, bullet.height, e.x, e.y, enemy.width, enemy.height) then
                    table.remove(bullet.list, i)
                    table.remove(enemy.list, j)
                    break
                end
            end
        end
    end
end

function bullet.draw()
    for _, b in ipairs(bullet.list) do
        love.graphics.rectangle("fill", b.x, b.y, bullet.width, bullet.height)
    end
end

function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
           x2 < x1 + w1 and
           y1 < y2 + h2 and
           y2 < y1 + h1
end

return bullet
