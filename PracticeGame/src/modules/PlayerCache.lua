local PlayerCache = {}

local Players = game:GetService("Players")

local Cache = {}


local function UpdatePlayer(player)
	local character = player.Character

	if not character then
		Cache[player] = nil
		return
	end

	Cache[player] = {
		Character = character,
		Humanoid = character:FindFirstChildOfClass("Humanoid"),
		Root = character:FindFirstChild("HumanoidRootPart")
	}
end


local function SetupPlayer(player)

	if player == Players.LocalPlayer then
		return
	end

	UpdatePlayer(player)

	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("HumanoidRootPart", 5)
		UpdatePlayer(player)
	end)

	player.CharacterRemoving:Connect(function()
		Cache[player] = nil
	end)
end


for _, player in ipairs(Players:GetPlayers()) do
	SetupPlayer(player)
end


Players.PlayerAdded:Connect(SetupPlayer)


Players.PlayerRemoving:Connect(function(player)
	Cache[player] = nil
end)


function PlayerCache.GetPlayers()
	return Cache
end


function PlayerCache.GetPlayerData(player)
	return Cache[player]
end


return PlayerCache