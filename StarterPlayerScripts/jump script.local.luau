-- local side jump
-- send command to server
local jumpe = script:FindFirstChild("jumpevent")
local uis = game:GetService("UserInputService")
local cd = 5
local oncd = false

uis.InputBegan:Connect(function(input,gameprocessed)
	if gameprocessed then return end
	if oncd == true then return end	

	if input.KeyCode == Enum.KeyCode.Space and oncd == false then
		if uis:IsKeyDown(Enum.KeyCode.E) then
			print("superjump")
		end
	end
	
end)

uis.InputEnded:Connect(function(input,gameprocessed)
	if gameprocessed then return end
	if input.KeyCode == Enum.KeyCode.Space then
		if uis:IsKeyDown(Enum.KeyCode.E) then
			print("superjump ended")
		end
	end
	
end)