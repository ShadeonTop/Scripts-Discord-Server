local gui = Instance.new("ScreenGui")
  gui.ResetOnSpawn = false
  gui.Parent = game.CoreGui
  
  local frame = Instance.new("Frame")
  frame.Position = UDim2.new(0, 100, 0, 100)
  frame.Size = UDim2.new(0, 100, 0, 50)
  frame.BackgroundColor3 = Color3.new(200, 295, 251)
  frame.BorderSizePixel = 1
  frame.Parent = gui
  
  local button = Instance.new("TextButton")
  button.Text = "Deactivate"
  button.Size = UDim2.new(1, -10, 1, -10)
  button.Position = UDim2.new(0, 20, 0, 20)
  button.BackgroundColor3 = Color3.new(1, 1, 1)
  button.BorderColor3 = Color3.new(0, 0, 0)
  button.BorderSizePixel = 1
  button.Font = Enum.Font.SourceSans
  button.TextColor3 = Color3.new(0, 0, 0)
  button.TextSize = 16
  button.Parent = frame
  
  local activated = false
  
  local function toggle()
    activated = not activated
    button.Text = activated and "Activate" or "Deactivate"
    while activated do
      local args = {
        [1] = 1.5,
        [2] = CFrame.new(-254.2939910888672, 112.13581848144531, -119.27256774902344) * CFrame.Angles(-2.029526710510254, 0.5662040710449219, 2.314905881881714),
        [3] = {
          ["2617721424"] = Vector3.new(-273.400146484375, -724.8031005859375, -20.92414093017578),
        },
        [4] = {
          [1] = 910,
          [2] = 154
        }
      }
      game:GetService("ReplicatedStorage").Remotes.ParryAttempt:FireServer(unpack(args))
      game:GetService("RunService").Heartbeat:Wait(0.001)
    end
  end
  
  button.MouseButton1Click:Connect(toggle)
  
  -- Adicionar keybind "E" para ativar o botão
  local UserInputService = game:GetService("UserInputService")
  local eKeyPressed = false
  
  UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.E and not gameProcessedEvent then
      eKeyPressed = true
      toggle()
    end
  end)
  
  UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.E then
      eKeyPressed = false
    end
  end)
  
  local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
  local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
  
  Notification:Notify(
    {Title = "BETA VERSION 0.2V", Description = "The best of all, simple and direct   /   By: redpoint"},
    {OutlineColor = Color3.fromRGB(80, 80, 80), Time = 5, Type = "option"},
    {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) print(tostring(State)) end}
  )
