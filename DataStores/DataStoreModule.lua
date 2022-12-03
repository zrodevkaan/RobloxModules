local StatsHandler = {}

function StatsHandler.AddInstance(Path,InstanceType,Value,Name)
	
	local SunkistOrange = Instance.new(InstanceType,Path)

	SunkistOrange.Name = Name
	
	if (InstanceType == "Folder") then
		
		return SunkistOrange
			
	end
	
	SunkistOrange.Value = Value
	
	return SunkistOrange
	
end


function StatsHandler.AddFromTable(Table,Player)
	local Sun = {}
	for Name,EachStat in Table do

		local a = Instance.new(EachStat["Type"],Player:FindFirstChild(EachStat["Parent"]))

		a.Name = Name

		a.Value = EachStat["StartValue"]

		table.insert(Sun, a)

	end
	return Sun
end

return StatsHandler
