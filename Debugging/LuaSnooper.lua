local LuaSnooper = {}

local LuaFunctions = {}

function LuaSnooper.TrackChanges(tbl)
	local changes = {}
	local proxy = {}
	for k, v in pairs(tbl) do
		if type(v) == "table" then
			proxy[k] = LuaSnooper.TrackChanges(v)
		else
			proxy[k] = v
		end
	end
	setmetatable(proxy, {
		__index = tbl,
		__newindex = function(t, k, v)
			changes[k] = v
			tbl[k] = v
		end
	})
	return proxy, changes
end

local function Trace(func, Debug)
	local info = debug.info(func, "n")
	local funcName = info.name or table.insert({}, func)
	local tracedFunc = function(...)
		local args = {...}
		local numArgs = select("#", ...)
		local argStrings = {}
		for i = 1, numArgs do
			table.insert(argStrings, tostring(args[i]))
		end
		local result = {func(...)}
		local trackedTable = LuaSnooper.TrackChanges(result)
		print(trackedTable)

		print("Function:", funcName, "Arguments:", table.concat(argStrings, ", "))
		local resultStrings = {}
		for i = 1, #result do
			table.insert(resultStrings, tostring(result[i]))
		end
		for k, v in pairs(trackedTable) do
				print("Variable '" .. k .. "' changed to '" .. tostring(trackedTable[k]) .. "'")
		end

		print("Exiting:", funcName, "Returned:", table.concat(resultStrings, ", "))
		return table.unpack(result)
	end
	return tracedFunc
end

function LuaSnooper.Start(func,Debug)
	return Trace(func,Debug)
end

return LuaSnooper
