local rs = game:GetService("ReplicatedStorage")
local dashe = rs:WaitForChild("remotes"):WaitForChild("dashevent")
local textlabel = script.Parent
local cd = 1.5
local oncd = false
textlabel.Text = "dash"
dashe.OnClientEvent:Connect(function()
	if oncd then return end
	if not oncd then
		oncd = true
		for i = cd,0.1, -0.1 do
			local numm = string.format("%.1f",i)
			textlabel.Text = numm
			task.wait(0.1)
		end
		textlabel.Text = "dash"
		oncd = false
	end
	
end)