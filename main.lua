Object = require "lib.classic"
kazari = require "lib.kazari"
require "lib.btnui"
require "lib.fy6"
require "lib.palette"

math.randomseed(os.time())
function love.load()
    font = love.graphics.setNewFont("lib/Baloo2.ttf", 100)
    bg = love.graphics.newImage("lib/ballpics.png")
    ww, wh = love.graphics.getDimensions()
    ticker = 0
    btnui = BTNUI()
    fy6 = Fy6()
    time = os.time()-1771673600
    timer = 10
    timerInit = 10
    pxl, pyl = 0, 0

    fy6:setScreenBorder()

    TargetPhys = fy6:newCirc("Target", ww*math.random(), wh*math.random(), 30, "dynamic")
    TargetPhys.body:setLinearVelocity(math.sin(time/5)*600, math.cos(time/5)*600)
    TargetPhys.fixture:setRestitution(1)

    TargetHit = btnui:newCirc("Target")
end


function love.update(dt)
    timer = math.max(timer - dt, 0)
    time = os.time()-1771673600
    fy6.world:setGravity(math.sin(time/2)*625, math.cos(time/2)*625)
    ticker = ticker + dt
    btnui:editBtnCirc("Target", TargetPhys.x, TargetPhys.y, TargetPhys.rad+30, true)
    px, py = TargetPhys.body:getPosition()
    pxl, pyl = pxl+0.1*(px-pxl), pyl+0.1*(py-pyl)

    if timer == 0 then
        timer = timerInit
    end

    fy6:update(dt)
    btnui:update(dt)
end

function love.mousepressed()
    if btnui:isHovered("Target") then
        TargetPhys.body:setPosition(ww*math.random(), wh*math.random())
        TargetPhys.body:setLinearVelocity(math.sin(time/5)*600, math.cos(time/5)*600)
    end
end

function love.draw()
    love.graphics.setBackgroundColor(fcv("purple2"))

    -- TIMER CIRCLE
    love.graphics.setColor(fcv("orange1"))
    love.graphics.circle("fill", ww/2, wh/2, (ww*ww+wh*wh)^0.5/2*(timer/timerInit))

    -- BACKGROUND
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.setColor(fcv("black2"))
    love.graphics.draw(bg, pxl/10, pyl/10, 0, 1, 1, 1920, 1080)
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(fcv("black2"))
    love.graphics.circle("fill", TargetPhys.x, TargetPhys.y, TargetPhys.rad+8)
    for i = 0, 2 do
        love.graphics.setColor(fcv("orange" .. 3-i))
        love.graphics.circle("fill", TargetPhys.x, TargetPhys.y, TargetPhys.rad-8*i)
    end

    -- TIMER
    love.graphics.setColor(fcv("black3"))
    love.graphics.print(math.ceil(timer), ww/2, wh/2, 0, 0.5, 0.5, font:getWidth(math.ceil(timer))/2, font:getHeight()/2)

    love.graphics.setColor(1,1,1)

    btnui:draw(0.5)
    --fy6:draw(0.5)
end
