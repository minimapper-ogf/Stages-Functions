-- StageFunctions/AwardBadgeOnTouch
local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")

local AwardBadgeOnTouch = {}

-- Table to keep track of already connected parts
local ConnectedParts = {}

-- Function to connect a part to award a badge
-- partName: string (Name of the part in the stage)
-- badgeId: number (Roblox badge ID)
function AwardBadgeOnTouch:AwardBadgeOnTouch(partName, badgeId)
	if not partName or not badgeId then
		warn("[AwardBadgeOnTouch] Missing partName or badgeId")
		return
	end

	-- Avoid connecting the same part multiple times
	if ConnectedParts[partName] then
		warn("[AwardBadgeOnTouch] Part already connected:", partName)
		return
	end

	local part = workspace:FindFirstChild(partName, true) -- search recursively
	if not part or not part:IsA("BasePart") then
		warn("[AwardBadgeOnTouch] Part not found or not a valid BasePart:", partName)
		return
	end

	-- Connect touch event
	local connection
	connection = part.Touched:Connect(function(hit)
		local player = Players:GetPlayerFromCharacter(hit.Parent)
		if player then
			local success, err = pcall(function()
				if not BadgeService:UserHasBadgeAsync(player.UserId, badgeId) then
					BadgeService:AwardBadge(player.UserId, badgeId)
					print("Awarded badge", badgeId, "to", player.Name, "via part", partName)
				end
			end)
			if not success then
				warn("[AwardBadgeOnTouch] Failed to award badge:", err)
			end
		end
	end)

	ConnectedParts[partName] = connection
end

-- Optional: Disconnect all connections (if needed)
function AwardBadgeOnTouch:DisconnectAll()
	for partName, conn in pairs(ConnectedParts) do
		if conn.Connected then
			conn:Disconnect()
		end
	end
	table.clear(ConnectedParts)
end

return AwardBadgeOnTouch
