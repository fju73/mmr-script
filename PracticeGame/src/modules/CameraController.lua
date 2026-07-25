local CameraController = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")


local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer


function CameraController.Init()

	Camera = workspace.CurrentCamera

end


function CameraController.SetMode(mode)

	if mode == "Default" then
		
		Camera.CameraType = Enum.CameraType.Custom
		
		if LocalPlayer.Character then
			
			local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			
			if humanoid then
				Camera.CameraSubject = humanoid
			end
			
		end

	elseif mode == "Scriptable" then
		
		Camera.CameraType = Enum.CameraType.Scriptable
		
	end

end


function CameraController.MoveTo(position, duration)

	Camera.CameraType = Enum.CameraType.Scriptable

	local target = CFrame.new(position)

	local tween = TweenService:Create(
		Camera,
		TweenInfo.new(
			duration or 1,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			CFrame = target
		}
	)

	tween:Play()

end


function CameraController.GetCamera()

	return Camera

end


return CameraController