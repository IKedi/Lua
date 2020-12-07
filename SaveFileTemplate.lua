local template = [[local SettingList = %s

local ModifierList = %s

local KeybindList = %s

local up = {}

up.Settings = function()
    return SettingList
end

up.Modifiers = function()
    return ModifierList
end

up.Keybinds = function()
    return KeybindList
end

return up]]

return template
