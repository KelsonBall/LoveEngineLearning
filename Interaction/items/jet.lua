return (function (image, startx, starty)

    local accel = 250
    local speed = 0    
    local max_speed = 250
    local x = startx
    local y = starty

    local delta_r = 5
    local rotation = 0

    local transform = love.math.newTransform()

    local o = {}    

    o.draw = (function ()
        local ox, oy = transform:transformPoint(-32, -32)
        love.graphics.draw(image, x + ox, y + oy, rotation)
    end)

    o.update = (function (dt)
        local step = speed * dt
        local dr = delta_r * dt
        if love.keyboard.isDown('d') then
            rotation = rotation + dr
            transform = transform:rotate(dr)
        elseif love.keyboard.isDown('a') then
            rotation = rotation - dr
            transform = transform:rotate(-dr)
        end
        
        if love.keyboard.isDown('w') then
            speed = math.min(speed + (accel * dt), max_speed)
        elseif love.keyboard.isDown('s') then
            speed = math.max(speed - (accel * dt), 0)
        end



        local tdx, tdy = transform:transformPoint(0, -speed * dt)

        x, y = x + tdx, y + tdy

        local w, h = love.graphics.getWidth(), love.graphics.getHeight()
        if x > w then
            x = 0
        elseif x < 0 then 
            x = w
        end

        if y > h then
            y = 0
        elseif y < 0 then
            y = h
        end

    end)

    return o
end)