BTNUI = Object:extend()

function BTNUI:new()
    self.buttons = {}
end

function BTNUI:newRect(id, x, y, w, h, wake)
    self.buttons[id] = {
        type = "Rect",
        x = x or 0,
        y = y or 0,
        width = w or 0,
        height = h or 0,
        wake = wake,
        hovered = false
    }
    return self.buttons[id]
end

function BTNUI:newCirc(id, x, y, r, wake)
    self.buttons[id] = {
        type = "Circ",
        x = x or 0,
        y = y or 0,
        rad = r or 0,
        wake = wake,
        hovered = false
    }
    return self.buttons[id]
end

function BTNUI:editBtnRect(id, x, y, w, h, wake)
    self.buttons[id] = {
        type = self.buttons[id].type,
        x = x or self.buttons[id].x,
        y = y or self.buttons[id].y,
        width = w or self.buttons[id].width,
        height = h or self.buttons[id].height,
        wake = wake or self.buttons[id].wake,
        hovered = self.buttons[id].hovered
    }
    return self.buttons[id]
end

function BTNUI:editBtnCirc(id, x, y, r, wake)
    self.buttons[id] = {
        type = self.buttons[id].type,
        x = x or self.buttons[id].x,
        y = y or self.buttons[id].y,
        rad = r or self.buttons[id].rad,
        wake = wake or self.buttons[id].wake,
        hovered = self.buttons[id].hovered
    }
    return self.buttons[id]
end

function BTNUI:refresh()
    for _, obj in pairs(self.buttons) do
        obj.x = 0
        obj.y = 0
        if obj.type == "Rect" then
            obj.width = 0
            obj.height = 0
        else
            obj.rad = 0
        end
        obj.wake = false
    end
end

function BTNUI:update(dt)
    local mx, my = love.mouse.getPosition()

    for _, obj in pairs(self.buttons) do
        obj.hovered = obj.type == "Rect" and mx >= obj.x and mx <= obj.x + obj.width and my >= obj.y and my <= obj.y + obj.height
        obj.hovered = obj.type == "Circ" and ((obj.x-mx)^2+(obj.y-my)^2)^0.5 < obj.rad
    end
end

function BTNUI:isHovered(id)
    return self.buttons[id].hovered  
end

function BTNUI:draw(fontsize)
    local fs = fontsize or 1
    love.graphics.setColor(1, 1, 0)
    for id, obj in pairs(self.buttons) do
        if obj.wake then
            if obj.type == "Rect" then
                love.graphics.rectangle("line", obj.x, obj.y, obj.width, obj.height)
                love.graphics.print("ID: " .. id, obj.x, obj.y, 0, fs)
                love.graphics.print("Hovered: " .. tostring(obj.hovered), obj.x, obj.y + obj.height/2, 0, fs)
            elseif obj.type == "Circ" then
                love.graphics.circle("line", obj.x, obj.y, obj.rad)
                love.graphics.print("ID: " .. id, obj.x, obj.y, 0, fs)
                love.graphics.print("Hovered: " .. tostring(obj.hovered) .. tostring(self:isHovered(id)), obj.x, obj.y + obj.rad/2, 0, fs)
            end
        end
    end
    love.graphics.setColor(1, 1, 1)
end