-- main.lua
local player = require "player"
local bullet = require "bullet"
local enemy = require "enemy"

function love.load()
    player.load()
    enemy.load()
end

function love.update(dt)
    player.update(dt)
    bullet.update(dt)
    enemy.update(dt)
end

function love.draw()
    player.draw()
    bullet.draw()
    enemy.draw()
end

function love.keypressed(key)
    if key == "space" then
        bullet.spawn(player.x, player.y)
    end
end
