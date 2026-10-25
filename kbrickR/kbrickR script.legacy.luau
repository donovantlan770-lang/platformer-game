local part = script.Parent
local debounce = true
local humanoid = 0
part.BrickColor = BrickColor.new("Artichoke")
part.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		print("Humanoid found")
		humanoid = hit.Parent:FindFirstChild("Humaniod")
	elseif hit.Parent.Parent:FindFirstChild("Humanoid") then
		print("Humanoid found 2nd try")
		humanoid = hit.Parent.Parent:FindFirstChild("Humanoid")
	end
	
	if hit.Parent:FindFirstChild("Humanoid") and debounce then
		debounce = false
		print("omae wa mou shindeiru")
		hit.Parent:FindFirstChild("Humanoid").Health = 0
		task.wait(1)
		debounce = true
	elseif not hit.Parent:FindFirstChild("Humanoid") and debounce then
		debounce = false
		print("nani?????")
		part.CanCollide = false
		for i = 1,3 do
			part.BrickColor = BrickColor.new("Bright yellow")
			part.Transparency = 0.5
			task.wait(0.4)
			part.BrickColor = BrickColor.new("Artichoke")
			part.Transparency = 0
			task.wait(0.6)
		end
		debounce = true
		part.CanCollide = true
	end
	
	
end)
