local IK = game:GetService("ReplicatedStorage").IK

local IKModule = require(game:GetService("ReplicatedStorage").IKActions)

IK.OnServerEvent:Connect(function(Player)

	IKModule.HandsUp(Player.Character)

end)