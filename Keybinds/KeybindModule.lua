local GameManager = {}

function GameManager.EquipTool(ToolName,Humanoid)
	
	local Equipped = false
	
	local Tool = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(ToolName)
	
	if Tool then
		
		return Humanoid:EquipTool(Tool)
		
	else
		
		return Humanoid:UnequipTools()
		
	end
	
end

local Toggle = true

function GameManager.ToggleCore(Core)
	
	Toggle = not Toggle
	
	local StarterGui = game:GetService("StarterGui")

	StarterGui:SetCoreGuiEnabled(Core, Toggle)
	
end

return GameManager
