while task.wait(30) do
    if game.Workspace.Boxes:GetChildren() < 10 then
        local random = math.random(1, 10)
        local box = Instance.new("Part")
        box.Position = Vector3.new(math.random(-200, 200), 100, math.random(-200, 200))
        box.Size = Vector3.new(3, 3, 3)
        box.Color = Color3.new(0.15, 0.15, 0.15)
        box.Material = "DiamondPlate"
        
        local prox = Instance.new("ProximityPrompt", box)
        prox.ActionText = "Interact"
        prox.HoldDuration = 2
        
        if random == 10 then
            box.Color = Color3.fromRGB(219, 165, 255)
            box.Material = "Basalt"
            box.Anchored = true
            box.Parent = game.Workspace.Boxes
            
            local tween = game:GetService("TweenService"):Create(box, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
               Position = box.Position - Vector3.new(0, 99, 0)
            })
            tween:Play()
            tween.Completed:Connect(function()
               prox.Triggered:Connect(function(player)
                  box:Destroy()
                  local randomTool = game.ServerStorage.SuperTools[math.random(1, #game.ServerStorage.SuperTools:GetChildren())]:Clone()
                  randomTool.Parent = player:FindFirstChild("Backpack")
               end)
            end)
        else
            prox.Triggered:Connect(function(player)
               box:Destroy()
               local randomTool = game.ServerStorage.Tools[math.random(1, #game.ServerStorage.Tools:GetChildren())]:Clone()
               randomTool.Parent = player:FindFirstChild("Backpack")
            end)
            box.Parent = game.Workspace.Boxes
        end
    end
end
