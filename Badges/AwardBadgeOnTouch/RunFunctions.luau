local stage = script.Parent.Parent

-- AwardBadgeOnTouch
local AwardBadgeOnTouch = require(script.Parent:WaitForChild("AwardBadgeOnTouch"))
AwardBadgeOnTouch:AwardBadgeOnTouch(stage.partname, badgeid)
