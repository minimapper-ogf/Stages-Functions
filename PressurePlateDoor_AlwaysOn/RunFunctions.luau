local stage = script.Parent.Parent
local PressurePlateDoor_AlwaysOn = require(script.Parent:WaitForChild("PressurePlateDoor_AlwaysOn"))
PressurePlateDoor_AlwaysOn:SetupPressurePlatePermanent(stage)
