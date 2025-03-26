local event = require("event.event")

---@class examples.checkbox: druid.widget
---@field button druid.button
---@field is_enabled boolean
local M = {}


function M:init()
	self.button = self.druid:new_button("root", self.on_checkbox_click) -- Button to handle checkbox
	self.icon = self:get_node("icon") -- Checkbox icon to hide/show
	self.selected = self:get_node("selected") -- Selected effect to show when checkbox is changed
	gui.set_alpha(self.selected, 0)

	self:set_state(false)

	self.on_state_changed = event.create()
end


function M:on_checkbox_click()
	self:set_state(not self.is_enabled)
	self.on_state_changed:trigger(self.is_enabled)
end


function M:set_state(is_enabled)
	if self.is_enabled == is_enabled then
		return
	end

	self.is_enabled = is_enabled
	gui.set_enabled(self.icon, self.is_enabled)

	gui.set_alpha(self.selected, 1)
	gui.animate(self.selected, "color.w", 0, gui.EASING_INSINE, 0.16)
end


function M:get_state()
	return self.is_enabled
end


return M
