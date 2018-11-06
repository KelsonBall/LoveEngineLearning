local geometry_shader = nil
local warp_shader = nil
local jet = nil

function love.load()
    jet = love.graphics.newImage("assets/jet.png")
    geometry_shader = require("shaders.geometry_shader")()
    warp_shader = require("shaders.warp_shader")()
end

function love.draw()
   drawColorRect()
   updateJetParams()
   drawJet()
   drawUnshaded()    
end

function drawColorRect()
    love.graphics.setShader(geometry_shader)
    love.graphics.rectangle("fill", 50, 50, 64, 64)
end

local warp_amount = 0
local max_warp = 0.6
local delay = 0
local max_delay = 50

function updateJetParams()
    if delay >= max_delay then
        warp_amount = warp_amount + 0.005
        if warp_amount > max_warp then
            warp_amount = 0
            delay = 0
        end
    else
        delay = delay + 1
    end
end

function drawJet()
    warp_shader:send("WarpAmount", warp_amount)
    love.graphics.setShader(warp_shader)
    love.graphics.draw(jet, 150, 150)
end

function drawUnshaded()
    love.graphics.setShader()
    love.graphics.draw(jet, 250, 50)
    love.graphics.rectangle("fill", 250, 250, 64, 64)
end