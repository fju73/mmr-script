local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")


local LocalPlayer = Players.LocalPlayer


local Modules = ReplicatedStorage:WaitForChild("Modules")


local Config = require(Modules.Config)
local PlayerCache = require(Modules.PlayerCache)
local UIController = require(Modules.UIController)
local DragController = require(Modules.DragController)
local CameraController = require(Modules.CameraController)
local MathUtils = require(Modules.MathUtils)


local function LoadProject()

	if Config.Debug.Enabled then
		print("Loading:", Config.GameName)
	end


	CameraController.Init()


	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

	local MainGui = PlayerGui:WaitForChild("MainGui")

	local MainFrame = MainGui:WaitForChild("MainFrame")


	UIController.Init(
		MainFrame,
		Config
	)


	local TopBar = MainFrame:FindFirstChild("TopBar")

	if TopBar then
		DragController.Enable(
			MainFrame,
			TopBar
		)
	end


	if Config.Debug.PrintLoadedModules then
		
		print("Config Loaded")
		print("MathUtils Loaded")
		print("PlayerCache Loaded")
		print("UIController Loaded")
		print("DragController Loaded")
		print("CameraController Loaded")
		
	end


	print("Project Ready")

end


LoadProject()