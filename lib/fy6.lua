Fy6 = Object:extend()

function Fy6:new(gx, gy, mtr)
    love.physics.setMeter(mtr or 64)
    self.world = love.physics.newWorld(gx or 0, gy or 0)
    self.object = {}
end

function Fy6:newRect(id, x, y, w, h, type)
    self.object[id] = {}
    self.object[id].class = "Rect"
    self.object[id].body = love.physics.newBody(self.world, x+w/2, y+h/2, type)
    self.object[id].x = x
    self.object[id].y = y
    self.object[id].width = w 
    self.object[id].height = h
    self.object[id].shape = love.physics.newRectangleShape(w, h)
    self.object[id].fixture = love.physics.newFixture(self.object[id].body, self.object[id].shape)
    return self.object[id]
end

function Fy6:newCirc(id, x, y, r, type)
    self.object[id] = {}
    self.object[id].class = "Circle"
    self.object[id].body = love.physics.newBody(self.world, x, y, type)
    self.object[id].x = x
    self.object[id].y = y
    self.object[id].rad = r 
    self.object[id].shape = love.physics.newCircleShape(r)
    self.object[id].fixture = love.physics.newFixture(self.object[id].body, self.object[id].shape)
    return self.object[id]
end

function Fy6:setScreenBorder()
    local ww, wh = love.graphics.getDimensions()
    self:newRect("FY6_Border1", -30, 0, 30, wh)
    self:newRect("FY6_Border2", 0, -30, ww, 30)
    self:newRect("FY6_Border3", ww, 0, 30, wh)
    self:newRect("FY6_Border4", 0, wh, ww, 30)
end

function Fy6:deleteObject(id)
    if not self.object[id].body:isDestroyed() then
        self.object[id].body:destroy()
        self.object[id] = nil
    end
end

function Fy6:update(dt)
    self.world:update(dt)
    for id, obj in pairs(self.object) do
        if not obj.body:isDestroyed() then
            self.object[id].x = self.object[id].body:getX()
            self.object[id].y = self.object[id].body:getY()
        end
    end
end

function Fy6:draw(fontsize)
    local fs = fontsize or 1
    love.graphics.setColor(0, 1, 0)
    for id, obj in pairs(self.object) do
        if not obj.body:isDestroyed() then
            if obj.class == "Rect" then
                love.graphics.polygon("line", obj.body:getWorldPoints(obj.shape:getPoints()))
            elseif obj.class == "Circle" then
                love.graphics.circle("line", obj.body:getX(), obj.body:getY(), obj.shape:getRadius())
            end
            love.graphics.print("ID: " .. id, obj.body:getX(), obj.body:getY(), 0, fs)
        end
    end
    love.graphics.setColor(1, 1, 1)
end