function love.draw()
    local x, y = love.mouse.getPosition()
    love.graphics.print("Hello World", x, y)
end