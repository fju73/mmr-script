
local Config = {}

Config.GameName = "Practice Game"

Config.UI = {
	Enabled = true,
	Theme = "Dark",
	AnimationSpeed = 0.25,
}

Config.Update = {
	
	RenderEnabled = true,


	CacheUpdateRate = 0.5,
}

Config.Colors = {
	Background = Color3.fromRGB(20, 20, 25),
	Primary = Color3.fromRGB(0, 170, 255),
	Success = Color3.fromRGB(0, 255, 120),
	Error = Color3.fromRGB(255, 70, 70),
}

Config.Debug = {
	Enabled = true,
	PrintLoadedModules = true,
}

return Config