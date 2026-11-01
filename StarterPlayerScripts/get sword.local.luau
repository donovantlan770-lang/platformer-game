local uis = game:GetService("UserInputService")
local rs = game:GetService("ReplicatedStorage")
local plr = game.Players.LocalPlayer
local backpack = plr:FindFirstChild("Backpack")
local HaveSword = false
local sword
local secondfloor = workspace:FindFirstChild("walls and stuff"):FindFirstChild("2nd floor")
local function givemintsword()
	sword = rs:WaitForChild("swords"):WaitForChild("mint sword"):Clone()
	sword.Parent = plr.Backpack
end
uis.InputBegan:Connect(function(i,gp)
	if gp then return end
	--check if they have it alrd or not
	if backpack:FindFirstChild("mint sword") or plr.Character:FindFirstChild("mint sword")then
		HaveSword = true
	elseif backpack:FindFirstChild("mint sword") == nil and plr.Character:FindFirstChild("mint sword") == nil then
		HaveSword = false
	end
	
	if i.KeyCode == Enum.KeyCode.U and HaveSword == false then
		HaveSword = true
		givemintsword()
		print("gave sword")
	elseif i.KeyCode == Enum.KeyCode.U and HaveSword == true then
		HaveSword = false
		sword:Destroy()
		print("removed sword")
	end
end)
local debounce = true

secondfloor:WaitForChild("floor").touched:Connect(function(hit)
		-- put the same checker as above to see if they have sword or not
	if (hit == plr.Character or hit.Parent == plr.Character or hit.Parent.Parent == plr.Character) and debounce == true then
		debounce = false
	
		if HaveSword == true then 
			return
		end
		if HaveSword == false then
		
			givemintsword()
			print("gave sword")
		end
	end
end)
