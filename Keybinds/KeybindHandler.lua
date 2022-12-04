local Player = game:GetService("Players").LocalPlayer

local Input = game:GetService("UserInputService")

local Keybind = Enum.KeyCode.F

local GameManager = require(game:GetService("ReplicatedStorage").Module.GameManager)

-- GameManager.ToggleCore(Enum.CoreGuiType.Backpack)

Input.InputBegan:Connect(function(Input,GPE)
	
	if (Input.KeyCode == Keybind) then
		
		local Char = Player.Character
		
		GameManager.EquipTool("Flash Light",Char.Humanoid)
		
	end
	
end)