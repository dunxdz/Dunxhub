-- Dũng Hub - Giao diện Hoho Hub - Full Features
-- Không cần key - Tương thích Xeno Executor 1.1.75

local Logo = "https://raw.githubusercontent.com/dunghubteam/assets/main/logo.png"

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HohoHub-V2/UI-Library/main/Library.lua"))()
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
        -- logic auto farm
    end
end)

MainTab:AddToggle("Auto Farm Boss", false, function(v)
    _G.AutoBoss = v
    while _G.AutoBoss do
        task.wait()
        -- logic auto boss
    end
end)

-- Teleport
TeleportTab:AddButton("Đảo Chính", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(1157, 16, 1650)
end)

TeleportTab:AddButton("Đảo Băng", function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(1200, 50, -1450)
end)

-- Fruit Notifier
FruitTab:AddToggle("Thông báo trái cây xuất hiện", false, function(v)
    _G.NotifyFruit = v
    while _G.NotifyFruit do
        task.wait(5)
        for _, obj in pairs(Workspace:GetChildren()) do
            if string.find(obj.Name:lower(), "fruit") then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Dũng Hub",
                    Text = "Trái cây: " .. obj.Name .. " tại vị trí: " .. tostring(math.floor(obj.Position.X)) .. ", " .. math.floor(obj.Position.Z),
                    Duration = 5
                })
            end
        end
    end
end)

-- ESP
EspTab:AddToggle("Bật ESP Player", false, function(v)
    _G.ESPPlayer = v
    while _G.ESPPlayer do
        task.wait(1)
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character and not plr.Character:FindFirstChild("ESP") then
                local Billboard = Instance.new("BillboardGui", plr.Character)
                Billboard.Name = "ESP"
                Billboard.Size = UDim2.new(0,100,0,40)
                Billboard.Adornee = plr.Character:WaitForChild("Head")
                Billboard.AlwaysOnTop = true

                local TextLabel = Instance.new("TextLabel", Billboard)
                TextLabel.Size = UDim2.new(1,0,1,0)
                TextLabel.Text = plr.Name
                TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                TextLabel.BackgroundTransparency = 1
            end
        end
    end
end)

-- Giao diện hoàn chỉnh - Dũng Hub
Library:Init()

