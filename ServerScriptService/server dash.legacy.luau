-- server dash script (recall section) --
local rs = game:GetService("ReplicatedStorage")
local dashe = rs:WaitForChild("dashevent")
local camera = workspace.CurrentCamera
local debris = game:GetService("Debris")



dashe.OnServerEvent:Connect(function(player,dir,cd)
	local char = player.Character
	local humanoid = char:WaitForChild("Humanoid")
	local hrp = char:WaitForChild("HumanoidRootPart")
	
	
	local bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(10000,0,10000)
	bv.Parent = hrp
	
	local dashduration = 0.5
	local dashpower = 150
	local rate = 0.1
	local steps = dashduration / rate
	local mindash = dashpower * 0.15
	local removebytime = dashpower/steps
	
	local attach1 = Instance.new("Attachment")
	attach1.Parent = hrp
	attach1.Position = Vector3.new(1,0,0)
	local attach2 = Instance.new("Attachment")
	attach2.Parent = hrp
	attach2.Position = Vector3.new(-1,0,0)
	
	local trail = Instance.new("Trail")
	trail.Parent = hrp
	trail.Attachment0 = attach1
	trail.Attachment1 = attach2
	trail.Lifetime = dashduration 
	trail.WidthScale = NumberSequence.new(0.5,0.2)
	trail.Color  = ColorSequence.new(Color3.fromHSV(math.random(), 1, 1))
	trail.Brightness = 1
	trail.LightEmission = 1

	dashe:FireClient(player,dir,cd)
	for i = 0, dashduration, rate do
		if dir == "front" then
			bv.Velocity = hrp.CFrame.LookVector * dashpower
			task.wait(rate)
			
		elseif dir == "back" then
			bv.Velocity = hrp.CFrame.LookVector * -dashpower
			task.wait(rate)
			
		elseif dir == "left" then
			bv.Velocity = hrp.CFrame.RightVector * -dashpower
			task.wait(rate)
			
		elseif dir == "right" then
			bv.Velocity = hrp.CFrame.RightVector * dashpower
			task.wait(rate)
			
		end
		
		if dashpower > mindash then
			dashpower -= removebytime
		end
		if dashpower <= mindash then
			dashpower = mindash
		end
	end
	task.wait(rate)
	bv:Destroy()
	debris:AddItem(trail,dashduration + 1)
end)

