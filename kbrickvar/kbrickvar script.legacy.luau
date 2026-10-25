--kbrickvar script
--makes them die after like 10 secoonds after they touch it 

local part = script.Parent
local debounce = true

part.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChild("Humanoid")

	if humanoid then
		print("humanoid foound")
	elseif not humanoid then
		humanoid = hit.Parent.Parent:FindFirstChild("Humanoid")
	else
		print("no humanoid found")
	end		
	
	
	if humanoid and debounce then
		debounce = false
		for i = 1,10 do
			humanoid.Health -= 5
			task.wait(1)
		end
		humanoid.Health = 0
		humanoid.Health = 0
		wait(1)
		debounce = true
		part.BrickColor = BrickColor.new("Lime green")
	end


end)