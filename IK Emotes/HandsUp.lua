local UserInputService = game:GetService("UserInputService")

local IK = require(game:GetService('ReplicatedStorage').IKActions)
local Players = game:GetService("Players")

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F then

        local Player = Players.LocalPlayer

		IK.HandsUp(Player.Character)
		
	end
end)
