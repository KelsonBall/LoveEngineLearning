jet = require("items.jet")

images = {}

items = {}

function love.conf(t)
    t.console = true
end

function love.load()
    images["jet"] = love.graphics.newImage("assets/jet.png")

    items["player"] = jet(images["jet"], 300, 400)    
end

function love.update(dt)
    for k,v in pairs(items) do
        v.update(dt)
    end    
end

function love.draw(dt)
    for k,v in pairs(items) do
        v.draw()
    end
    love.graphics.print("Hello world", 10, 10)
end