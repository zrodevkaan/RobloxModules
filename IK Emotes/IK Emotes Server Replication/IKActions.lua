local IK = {}

local RightTarget
local LeftTarget
local IKRight
local IKLeft

local Toggle = false

function IK.HandsUp(Character)
	
	Toggle = not Toggle
	
	if RightTarget then	RightTarget:Destroy() end
	if LeftTarget then	LeftTarget:Destroy() end
	if IKLeft then IKLeft:Destroy() end
	if IKRight then	IKRight:Destroy() end
	
	if Toggle then
		
		RightTarget = Instance.new("Attachment")

		RightTarget.Parent = Character.Head
		RightTarget.Position += Vector3.new(0,20,0)

		LeftTarget = Instance.new("Attachment")

		LeftTarget.Parent = Character.Head
		LeftTarget.Position += Vector3.new(0,20,0)

		IKRight = Instance.new("IKControl")

		IKRight.Name = "Right"
		IKRight.Parent = Character.Humanoid
		IKRight.Type = Enum.IKControlType.Position
		IKRight.EndEffector = Character:WaitForChild("RightHand")
		IKRight.ChainRoot = Character:WaitForChild("RightUpperArm")
		IKRight.Target = RightTarget

		IKLeft = Instance.new("IKControl")

		IKRight.Name = "Left"
		IKLeft.Parent = Character.Humanoid
		IKLeft.Type = Enum.IKControlType.Position
		IKLeft.EndEffector =  Character:WaitForChild("LeftHand")
		IKLeft.ChainRoot = Character:WaitForChild("LeftUpperArm")
		IKLeft.Target = LeftTarget
		
	end
	
end

return IK
