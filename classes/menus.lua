MENUS = Object:extend()

menuInfo = require "ui-map.menus"
menuLayers = menuInfo.layers

function MENUS:new()
	self.scene = "Main Menu"
	self.scenes = {}
	self.buttons = {}
	self.texts = {}
	for _, a in pairs(menuLayers) do
		self.scenes[a.name] = a.objects
		for _, b in pairs(a.objects) do
			if b.type == "button" then
				table.insert(self.buttons, b)
				btnui:newRect(a.name .. "-" .. b.name, b.x, b.y, b.width, b.height, true)
			elseif b.type == "text" then
				table.insert(self.texts, b)
			end
		end
	end
end

function MENUS:draw()
	for _, obj in pairs(self.scenes[self.scene]) do
		love.graphics.setColor(1,1,1)
		if obj.type == "text" then
			love.graphics.print(obj.text, obj.x, obj.y, 0, obj.properties["Scale"]/100)
		elseif obj.type == "button" then
			love.graphics.setColor(fcv(obj.properties["Color"]))
			love.graphics.rectangle("fill", obj.x, obj.y, obj.width, obj.height, obj.properties["Roundness"])
		end
	end
end