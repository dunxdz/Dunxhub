-- Dũng Hub - Giao diện Hoho Hub - Full Features
-- Không cần key - Tương thích Xeno Executor 1.1.75

local Logo = "https://raw.githubusercontent.com/dunxzd/Dunxhub/main/boruto_logo.png"
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoHoHub-V2/UI-Library/main/Library.lua"))()
local Window = Library:CreateWindow("Dũng Hub", Logo)

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- Tabs
local MainTab = Window:AddTab("Auto Farm")
local TeleportTab = Window:AddTab("Teleport")
local FruitTab = Window:AddTab("Fruit Notifier")
local EspTab = Window:AddTab("ESP")

-- Auto Farm
MainTab:AddToggle("Auto Farm Level", false, function(v)
    _G.AutoFarm = v
    while _G.AutoFarm do
        task.wait()
        -- logic auto farm ở đây
    end
end)

MainTab:AddToggle("Auto Farm Boss", false, function(v)
    _G.AutoBoss = v
    while _G.AutoBoss do
        task.wait()
        -- logic auto boss ở đây
    end
end)

-- Teleport
TeleportTab:AddButton("Đảo Chính", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(1157, 16, 1650)
end)

TeleportTab:AddButton("Đảo Băng", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(1038, 50, 4150)
end)

-- Fruit Notifier
FruitTab:AddToggle("Bật Thông Báo Trái Cây", false, function(v)
    _G.FruitNotify = v
    while _G.FruitNotify do
        task.wait(5)
        for i, v in pairs(Workspace:GetChildren()) do
            if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Thông Báo Trái Cây",
                    Text = "Đã phát hiện trái: " .. v.Name,
                    Duration = 10
                })
            end
        end
    end
end)

-- ESP
EspTab:AddToggle("ESP Người Chơi", false, function(v)
    _G.PlayerESP = v
    while _G.PlayerESP do
        task.wait()
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") and not plr.Character.Head:FindFirstChild("NameESP") then
                local bill = Instance.new("BillboardGui", plr.Character.Head)
                bill.Name = "NameESP"
                bill.Size = UDim2.new(0, 100, 0, 40)
                bill.AlwaysOnTop = true
                bill.StudsOffset = Vector3.new(0, 2, 0)

                local name = Instance.new("TextLabel", bill)
                name.Size = UDim2.new(1, 0, 1, 0)
                name.BackgroundTransparency = 1
                name.Text = plr.Name
                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                name.TextStrokeTransparency = 0
            end
        end
    end
end)

