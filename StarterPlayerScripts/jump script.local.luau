-- local side jump
-- send command to server
local rs = game:GetService("ReplicatedStorage")
local jumpe = rs:WaitForChild("remotes"):FindFirstChild("jumpevent")
local uis = game:GetService("UserInputService")
local cd = 5
local oncd = false

uis.InputBegan:Connect(function(input,gameprocessed)
	if gameprocessed then return end
	if oncd == true then 
		print(" jump on cd")
		return 
	end	

	if input.KeyCode == Enum.KeyCode.Space and oncd == false then
		if uis:IsKeyDown(Enum.KeyCode.E) then
			oncd = true
			print("superjump")
		end
	end
	
end)

uis.InputEnded:Connect(function(input,gameprocessed)
	if gameprocessed then return end
	if input.KeyCode == Enum.KeyCode.Space then
		if uis:IsKeyDown(Enum.KeyCode.E) then
			print("superjump ended")
			jumpe:FireServer(cd)
			task.wait(cd)
			oncd = false
		end
	end
	
end)