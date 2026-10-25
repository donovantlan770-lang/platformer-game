     --<<Sprint Script>>--
--<<By: Donovantlan770>>--
-- this is my first script, i might get lazy on writing notes later on --

--#define variables
local sprint = script.Parent
local playera = game.Players.LocalPlayer
local char = playera.Character or playera.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local uis = game:GetService("UserInputService")
local camera = game.Workspace.CurrentCamera
print(camera.FieldOfView)

--#make sure the character is loaded properly and also work after respawn
playera.CharacterAdded:Connect(function(him)
	char = him
	humanoid = char:WaitForChild("Humanoid")
	print("character loaded")
	
end)

--# detect his input
uis.InputBegan:Connect(function(input,gameprocessed)
	-- to check if he is typing or not
	if gameprocessed then return end
	-- if left ctrl is pressed
	if uis:IsKeyDown(Enum.KeyCode.LeftShift) then
		humanoid.WalkSpeed = 32
		for i = 1,10 do 
			camera.FieldOfView += 1
			wait()
		end
	end	
	
end)

--#detect after his input ended
uis.InputEnded:Connect(function(input,gameprocessed)
	if gameprocessed then return end
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = 16
		for i = 1,10 do
			camera.FieldOfView -= 1
			wait()
		end
	
	end	
	
end)
