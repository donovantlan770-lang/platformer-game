

--kilbrick var collection service
task.wait(3)
local cs = game:GetService("CollectionService")
local kbrickvar = cs:GetTagged("kbrickvar")
local function touched(part)
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
			part.BrickColor = BrickColor.new("Bright yellow")
			debounce = false
			humanoid.Health -= 20				
			task.wait(1)
			debounce = true
			part.BrickColor = BrickColor.new(Color3.fromRGB(40,127,71))
		end
	end)
end
for i,part in ipairs(kbrickvar) do
	touched(part)
end
cs:GetInstanceAddedSignal("killbrickvar"):Connect(touched)
