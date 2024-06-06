local function createNotification(title, description)
    local g = Instance.new("ScreenGui")
    g.Name = "NotificationGui"
    g.Parent = game.Players.LocalPlayer.PlayerGui
    
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0.3, 0, 0.2, 0)
    f.Position = UDim2.new(0.5, 0, 0.5, 0)
    f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    f.Parent = g
    
    local tt = Instance.new("TextLabel")
    tt.Size = UDim2.new(1, 0, 0.2, 0)
    tt.Position = UDim2.new(0, 0, 0, 0)
    tt.Text = title
    tt.TextSize = 24
    tt.Parent = f
    
    local dt = Instance.new("TextLabel")
    dt.Size = UDim2.new(1, 0, 0.6, 0)
    dt.Position = UDim2.new(0, 0, 0.2, 0)
    dt.Text = description
    dt.TextWrapped = true
    dt.Parent = f
    
    local ob = Instance.new("TextButton")
    ob.Size = UDim2.new(0.5, 0, 0.2, 0)
    ob.Position = UDim2.new(0.25, 0, 0.8, 0)
    ob.Text = "OK"
    ob.Parent = f
    
    ob.MouseButton1Click:Connect(function()
        g:Destroy()
    end)
end

local function antiKick()
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" and getgenv().antikick then
            createNotification("Notification", "You were about to get kicked but it was prevented by Anti Kick script.")
            return nil
        end
        return oldNamecall(self, ...)
    end)

    setreadonly(mt, true)
end

antiKick()