local UIController = {}

local TweenService = game:GetService("TweenService")


local MainFrame
local Config


function UIController.Init(gui, config)

	MainFrame = gui
	Config = config

	MainFrame.Visible = Config.UI.Enabled
end


function UIController.Show()

	if not MainFrame then
		return
	end

	MainFrame.Visible = true

	MainFrame.Size = UDim2.new(0, 0, 0, 0)

	local tween = TweenService:Create(
		MainFrame,
		TweenInfo.new(
			Config.UI.AnimationSpeed,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			Size = UDim2.new(0, 400, 0, 300)
		}
	)

	tween:Play()
end


function UIController.Hide()

	if not MainFrame then
		return
	end

	local tween = TweenService:Create(
		MainFrame,
		TweenInfo.new(
			Config.UI.AnimationSpeed,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.In
		),
		{
			Size = UDim2.new(0, 0, 0, 0)
		}
	)

	tween:Play()

	tween.Completed:Connect(function()
		MainFrame.Visible = false
	end)
end


function UIController.Toggle()

	if not MainFrame then
		return
	end

	if MainFrame.Visible then
		UIController.Hide()
	else
		UIController.Show()
	end
end


function UIController.SetVisible(state)

	if MainFrame then
		MainFrame.Visible = state
	end

end


return UIController