-- dash script  (input section) --


local uis = game:GetService("UserInputService")
local rs = game:GetService("ReplicatedStorage")
local dashe = rs:WaitForChild("dashevent")
local cd = 3
local oncd = false
local dir = "front"
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
		
		print("dashe firing")
		task.wait(cd)
		oncd = false
		print("cd over")
	end
	
	
end)
