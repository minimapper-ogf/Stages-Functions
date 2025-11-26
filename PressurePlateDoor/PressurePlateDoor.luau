-- StageMinigames/PressurePlateDoor.lua
-- Handles simple pressure plate triggers opening doors

local StageMinigames = {}

-- Fade door transparency and disable collisions
local function openDoor(doorPart, fadeTime)
	fadeTime = fadeTime or 2 -- seconds
	local steps = 20
	local waitTime = fadeTime / steps

	for i = 1, steps do
		local alpha = i / steps
		doorPart.Transparency = alpha
		wait(waitTime)
	end
	doorPart.CanCollide = false
end

-- Helper to get the first descendant part by name (works for models)
local function getPartFromName(parent, name)
	for _, obj in ipairs(parent:GetDescendants()) do
		if obj:IsA("BasePart") and obj.Name == name then
			return obj
		end
	end
	return nil
end

-- Sets up a pressure plate event
-- stageModel: the root Model of the stage
-- plateName: the part/model that acts as the pressure plate
-- doorName: the door part/model to open
-- cubeName: optional name of the moveable cube (default "MoveCube")
function StageMinigames:SetupPressurePlate(stageModel, plateName, doorName, cubeName)
	plateName = plateName or "PressurePlate"
	doorName = doorName or "PressureDoor"
	cubeName = cubeName or "MoveCube"

	local plate = getPartFromName(stageModel, plateName)
	local door = getPartFromName(stageModel, doorName)

	if not plate then
		warn("Pressure plate not found:", plateName)
		return
	end
	if not door then
		warn("Pressure door not found:", doorName)
		return
	end

	-- When touched by player or moveable cube
	plate.Touched:Connect(function(hit)
		local character = hit:FindFirstAncestorOfClass("Model")
		local isPlayer = character and game.Players:GetPlayerFromCharacter(character)
		local isCube = hit.Name == cubeName or (character and character:FindFirstChild(cubeName))

		if isPlayer or isCube then
			-- Open the door (fade + remove collisions)
			openDoor(door)
		end
	end)
end

return StageMinigames
