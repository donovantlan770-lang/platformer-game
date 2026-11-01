--server side jump
-- recieve command and execute

local rs = game:GetService("ReplicatedStorage")
local jumpe = rs:WaitForChild("remotes"):WaitForChild("jumpevent")
local camera = workspace.CurrentCamera
local debris = game:GetService("Debris")

jumpe.OnServerEvent:Connect(function(player,cd)
	local char = player.Character
	local humanoid = char:WaitForChild("Humanoid")
	local hrp = char:WaitForChild("HumanoidRootPart")
	
	local jumppower = 100
	local jumpduration = 1
	local rate = 0.1
	local steps = jumpduration / rate
	local removebytime = jumppower/steps
	
	local bv = Instance.new("BodyVelocity")
	bv.Parent = hrp
	bv.MaxForce = Vector3.new(0,10000,0)
	
	bv.Velocity = Vector3.new(0,jumppower,0)
	task.wait(jumpduration)
	print("jump over")
	bv:Destroy()
	
end)

