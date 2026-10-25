--kbrick script
--normal kbrick

local part = script.Parent
local debounce = true

part.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChild("Humnaoid")

	if humanoid then
		print("humanoid foound")
	elseif not humanoid then
		humanoid = hit.Parent.Parent:FindFirstChild("Humanoid")
	else
		print("no humanoid found")
	end		

	if humanoid and debounce then
		part.BrickColor = BrickColor.new("Bright yellow")
		debounce = false
		humanoid.Health = 0
		wait(1)
		debounce = true
		part.BrickColor = BrickColor.new(Color3.fromRGB(36,240,112))
	end


end)