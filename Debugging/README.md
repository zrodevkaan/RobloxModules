
Usage

-----


1. Download the `LuaSnooper.lua` file from the GitHub repository and copy it to your project directory.

2. In your code, import the `LuaSnooper` module by including the following line at the beginning of your file:

  

```lua
local LuaSnooper = require(game:GetService("ReplicatedStorage"):FindFirstChild("LuaSnooper"))
```

3. To use the `Trace` function to trace a specific function in your code, call `Trace` with the function as its argument. For example:

```lua
function myFunction(arg1, arg2) --[[ Code! ]] end local tracedFunction = LuaSnooper.Trace(myFunction)
```

4. The `tracedFunction` variable now holds a new function that you can call instead of `myFunction`. When `tracedFunction` is called, it will print out information about the function call, including the values of any arguments and changes to local variables.

  

Example

-------

  

Here's an example of how to use LuaSnooper to track changes to a LuaU function:

  

```lua
local LuaSnooper = require(game:GetService("ReplicatedStorage"):FindFirstChild("LuaSnooper"))

function myFunction(arg1, arg2)

local myVar = arg1 + arg2 myVar = myVar + 1

return myVar

end

  

local tracedFunction = LuaSnooper.Trace(myFunction) tracedFunction(5, 10)

```

  

When you run this code, you should see output similar to the following:

  

javascriptCopy code

  

```Function: myFunction Arguments: 5, 10 Exiting: myFunction Returned: 16 Variable 'myVar' changed to '16'```
