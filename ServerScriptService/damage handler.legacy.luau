local rs = game:GetService("ReplicatedStorage")
local attack = rs:WaitForChild("remotes"):WaitForChild("attack")

local debris = game:GetService("Debris")



attack.OnServerEvent:Connect(function(plr)
	
	local character = plr.Character
	if not character then return end
	local hrp = character:WaitForChild("HumanoidRootPart")
	if not hrp then return end

	-- Setup filter to ignore the attacking player
	local overlapParams = OverlapParams.new()
	overlapParams.FilterType = Enum.RaycastFilterType.Exclude
	overlapParams.FilterDescendantsInstances = {character}

	local size = Vector3.new(10, 10, 10)	
	local hitbox = hrp.CFrame * CFrame.new(0,0,-5)
	-- Get parts in box, ignoring attacker
	local partsInBox = workspace:GetPartBoundsInBox(hitbox, size, overlapParams)
	local hit = false
	
	for _, v in ipairs(partsInBox) do
		local char = v.Parent
		local hum = char:FindFirstChild("Humanoid")

		-- Check if it's a valid humanoid and not the player themselves
		if hum and char and char.Name ~= plr.Name then
			if hit then return end
			hit = true
			hum:TakeDamage(10)
			local cutvfx = rs:WaitForChild("vfx"):WaitForChild("cut vfx"):Clone()
			cutvfx.Parent = v
			cutvfx.CFrame = v.CFrame
			cutvfx.Anchored = true
			cutvfx.CanCollide = false
			cutvfx.Transparency = 1
			debris:AddItem(cutvfx,0.6)
			print(plr.Name.."Hit " .. char.Name)
		end
	end
end)