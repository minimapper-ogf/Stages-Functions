-- StageMinigames/PressurePlateDoor.lua
-- Handles simple pressure plate triggers opening doors

local PressurePlateDoor = {}

local function setDoorState(doorPart, open, fadeTime)
	fadeTime = fadeTime or 2
	local steps = 20
	local waitTime = fadeTime / steps

	if open then
		for i = 1, steps do
			doorPart.Transparency = i / steps
			wait(waitTime)
		end
		doorPart.CanCollide = false
	else
		for i = 1, steps do
			doorPart.Transparency = 1 - (i / steps)
			wait(waitTime)
		end
		doorPart.CanCollide = true
	end
end

local function getPartFromName(parent, name)
	for _, obj in ipairs(parent:GetDescendants()) do
		if obj:IsA("BasePart") and obj.Name == name then
			return obj
		end
	end
	return nil
end

function PressurePlateDoor:SetupPressurePlate(stageModel, plateName, doorName, cubeName)
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

	local objectsOnPlate = {} -- track unique objects

	local function updateDoor()
		if next(objectsOnPlate) then
			spawn(function() setDoorState(door, true) end)
		else
			spawn(function() setDoorState(door, false) end)
		end
	end

	local function trackObject(hit, add)
		local character = hit:FindFirstAncestorOfClass("Model")
		local isPlayer = character and game.Players:GetPlayerFromCharacter(character)
		local isCube = hit.Name == cubeName or (character and character:FindFirstChild(cubeName))

		if isPlayer or isCube then
			local key = hit
			if add then
				objectsOnPlate[key] = true
			else
				objectsOnPlate[key] = nil
			end
			updateDoor()
		end
	end

	plate.Touched:Connect(function(hit)
		trackObject(hit, true)
	end)
	plate.TouchEnded:Connect(function(hit)
		trackObject(hit, false)
	end)
end

return PressurePlateDoor

