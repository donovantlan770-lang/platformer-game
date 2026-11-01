-- dash script  (input section) --


local uis = game:GetService("UserInputService")
local rs = game:GetService("ReplicatedStorage")
local dashe = rs:WaitForChild("remotes"):WaitForChild("dashevent")
local anim = rs:WaitForChild("animation folder"):WaitForChild("dash animation")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local animator = hum:WaitForChild("Animator")
local track = animator:LoadAnimation(anim)
local anim2 = rs:WaitForChild("animation folder"):WaitForChild("backswing1")
local track2 = animator:LoadAnimation(anim2)
track.Looped = false

local cd = 1.5
local oncd = false
local dir = "front"

player.CharacterAdded:Connect(function(him)
	char = him
	hum = char:WaitForChild("Humanoid")
	animator = hum:WaitForChild("Animator")
	track = animator:LoadAnimation(anim)
	track.Looped = false
	track2 = animator:LoadAnimation(anim2)
	
end)

uis.InputBegan:Connect(function(input,gameprocessed)
	if gameprocessed then return end
	if oncd == true then 
		print("on cd")
		return
			
	end
	
	if input.KeyCode == Enum.KeyCode.Q and oncd == false then
		oncd = true
		if uis:IsKeyDown(Enum.KeyCode.A) then
			dir = "left"
		elseif uis:IsKeyDown(Enum.KeyCode.D) then
			dir = "right"
		elseif uis:IsKeyDown(Enum.KeyCode.S) then
			dir = "back"
		else
			dir = "front"
		end
		
		dashe:FireServer(dir,cd)
		track:Play()
		print("dashe firing")
		task.wait(cd)
		oncd = false
		print("cd over")
	end
	
	
end)
