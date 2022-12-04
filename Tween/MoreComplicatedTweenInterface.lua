local Tween = {}

local Default =
	{
		["Direction"] = Enum.EasingDirection.InOut;
		["Style"] = Enum.EasingStyle.Sine;
		["Time"] = 0.1;
	}

function Tween.TweenInterfaceSize(Object, X, Y, Z, EasingDirection : Enum.EasingDirection, EasingStyle : Enum.EasingStyle , Time : number)
	
	Object:TweenSize(UDim2.new(X, Y, Z), EasingDirection or Default["Direction"], EasingStyle or Default["Style"], Time or Default["Time"])
	
end

function Tween.TweenInterfacePosition(Object, X, Y, Z,EasingDirection : Enum.EasingDirection, EasingStyle : Enum.EasingStyle , Time : number ,Sizing : Vector3)

	Object:TweenPosition(UDim2.new(X, Y, Z), EasingDirection or Default["Direction"], EasingStyle or Default["Style"], Time or Default["Time"])

end

return Tween
