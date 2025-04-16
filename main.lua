-- Dũng Hub - Hoho Style (No Key | Xeno Executor Support)
-- Made with love by ChatGPT and Dũng

repeat wait() until game:IsLoaded()
local plr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- UI Library (Simple and lightweight)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Dũng Hub | Blox Fruits", "Ocean")

-- Main Tab
local Tab = Window:NewTab("Main")
local MainSection = Tab:NewSection("Auto Farm")

MainSection:NewToggle("Auto Farm Level", "Tự động farm theo level", function(state)
    _G.AutoFarm = state
    while _G.AutoFarm and task.wait() do
        -- Code auto farm đơn giản
        local args = {
            [1] = "StartMagnet" -- giả lập hút quái
        }
        game:GetService("ReplicatedStorage").Remotes:InvokeServer(unpack(args))
    end
end)

MainSection:NewToggle("Auto Haki", "Tự động bật haki", function(state)
    _G.AutoHaki = state
    while _G.AutoHaki and task.wait() do
        local args = {
            [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes:InvokeServer(unpack(args))
    end
end)

-- Teleport Tab
local TeleTab = Window:NewTab("Teleport")
local TeleSection = TeleTab:NewSection("Đảo")

TeleSection:NewButton("Đến Đảo Chính", "Teleport tới đảo khởi đầu", function()
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(1047, 16, 1325)
end)

-- Fruit Tab
local FruitTab = Window:NewTab("Trái Ác Quỷ")
local FruitSection = FruitTab:NewSection("Tính năng")

FruitSection:NewButton("Hiện vị trí trái cây", "Tìm vị trí trái cây gần nhất", function()
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Handle") then
            plr.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
            break
        end
    end
end)

-- Credits
local TabCredit = Window:NewTab("Credits")
local SectionCredit = TabCredit:NewSection("Người tạo: Dũng x ChatGPT")
