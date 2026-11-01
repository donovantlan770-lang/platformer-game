

--normal kbrick collection service
task.wait(3)
local cs = game:GetService("CollectionService")
local kbrickvar = cs:GetTagged("kbrick")
local function touched(part)
	local debounce = true
	--normal kbrick
	part.Touched:Connect(function(hit)
		local humanoid = hit:FindFirstChild("Humanoid") or hit.Parent:FindFirstChild("Humanoid")

		if humanoid then
			print("humanoid foound")
		else
			print("no humanoid found")
		end		

		if humanoid and debounce then
			part.BrickColor = BrickColor.new("Bright yellow")
			debounce = false
			humanoid.Health = 0
			wait(1)
			debounce = true
			part.BrickColor = BrickColor.new("Teal")
		end
	end)
end
for i,part in ipairs(kbrickvar) do
	touched(part)
end
cs:GetInstanceAddedSignal("kbrick"):Connect(touched)
