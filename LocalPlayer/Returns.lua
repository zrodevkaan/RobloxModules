local Returns = {}

function ReturnName(Player : Player)
	
	return Player.Name
	
end

function ReturnDisplayName(Player : Player)

	return Player.DisplayName

end


function ReturnBackpack(Player : Player)

	local Items = {}

	for _,Item in pairs(Player.Backpack:GetChildren()) do

		table.insert(Items,Item)

	end

	return table.unpack(Items)
	
end
	
function ReturnID(Player : Player)

	return Player.UserId

end

function ReturnAccountAge(Player : Player)

	return Player.AccountAge

end

function Chatted(Player : Player)

	return Player.Chatted:Connect(function(Message,OnPlayer)

		warn(Player.Name .. " said " .. Message)

	end)

end

function ReturnOnMobile(Player : Player)
	
	return Player.DevTouchCameraMode
	
end

function ReturnMembership(Player : Player)

	return Player.MembershipType

end

function PlayerJoined(Player : Player)

	return Player.CharacterAdded:Connect(function(Character)
		
		warn(Player.Name .. " has respawned")
		
		return Character
		
	end)

end

function SetSpeed(Player : Player,Speed : number)
	
	Player:WaitForChildOfClass("Humanoid").WalkSpeed = Speed
	
end

function SetName(Player : Player,Context : string)
	
	Player:WaitForChildOfClass("Humanoid").Name = Context

end

return Returns
