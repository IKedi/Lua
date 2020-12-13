local module = {}

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

module.GetSaveTemplate = function()
    return template
end

module.GetVersion = function()
    return "2.1"
end

return module
