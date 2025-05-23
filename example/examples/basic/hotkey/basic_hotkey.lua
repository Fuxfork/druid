---@class examples.basic_hotkey: druid.widget
---@field root node
---@field text druid.text
local M = {}

function M:init()
	self.root = self:get_node("root")
	self.hotkey = self.druid:new_hotkey({ "key_lshift", "key_x" }, self.on_hotkey)
end


function M:on_hotkey()
	gui.animate(self.root, gui.PROP_SCALE, vmath.vector3(1.2), gui.EASING_OUTELASTIC, 0.5, 0, function()
		gui.animate(self.root, gui.PROP_SCALE, vmath.vector3(1), gui.EASING_OUTELASTIC, 0.5)
	end)
end


---@param output_log output_list
function M:on_example_created(output_log)
	self.hotkey.on_hotkey_released:subscribe(function()
		output_log:add_log_text("Hotkey Released")
	end)
end


return M
