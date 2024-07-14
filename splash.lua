local splash = {}
splash.text = "Space Fighter"
splash.x = -love.graphics.getWidth()
splash.y = love.graphics.getHeight() / 2
splash.speed = 200
splash.active = true

function splash.update(dt)
    if splash.active then
        splash.x = splash.x + splash.speed * dt
        if splash.x > love.graphics.getWidth() then
            splash.active = false
        end
    end
end

function splash.draw()
    if splash.active then
        love.graphics.setFont(love.graphics.newFont(60))
        love.graphics.printf(splash.text, splash.x, splash.y, love.graphics.getWidth(), "left")
    end
end

return splash
