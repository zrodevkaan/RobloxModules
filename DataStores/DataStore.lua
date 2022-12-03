local Players = game:GetService("Players")
local StatsHandler = require(script:FindFirstChild("StatsHandler"))
local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("StatsDataStore")

local StatsTable = 
	{
		["Stat1"] = 
		{
			Type = "IntValue",
			StartValue = 250;
			Parent = "Data"
		},
		["Stat2"] = 
		{
			Type = "IntValue",
			StartValue = 0;
			Parent = "Data"
		},
		["Stat3"] = 
		{
			Type = "StringValue",
			StartValue = "None";
			Parent = "Data"
		},

	}

Players.PlayerAdded:Connect(function(Player)
	
	local Stats = StatsHandler.AddInstance(Player,"Folder",0,"Data") -- [[ NIL OR 0 FOR FOLDER VALUES. ]]
	
	local AllTables = StatsHandler.AddFromTable(StatsTable,Player)

	local Data
	
	local Success,Error = pcall(function()

		Data = DataStore:GetAsync(Player.UserId)

	end)

	if Data then
		
		local TableLength
		
		warn("Now loading... " .. Player.Name .. " Data")
		
		for i,v in pairs(Stats:GetChildren()) do

			warn("Loading " .. v.Name .. " ( " .. i .. " ) With Value " .. v.Value)
			
			v.Value = Data[i]
			
		end

	end
	
end)

Players.PlayerRemoving:Connect(function(Player)

	local StatsFolder = Player:FindFirstChild("Data")
	
	local toSave = {}

	for i,v in pairs(StatsFolder:GetChildren()) do

		toSave[i] = v.Value
		
		warn("Saving " .. v.Name .. " ( " .. i .. " ) With Value " .. v.Value)
		
	end

	local Success, Error = pcall(function()

		DataStore:SetAsync(Player.UserId,toSave)

	end)

	if not Success then

		warn(Error)

	end

end)