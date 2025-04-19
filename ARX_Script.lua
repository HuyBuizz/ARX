local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Rayfield Example Window",
    Icon = 0,
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    Theme = "Default",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = false,
})

local vim = game:GetService("VirtualInputManager")

local function pressKey(keyCode)
    vim:SendKeyEvent(true, keyCode, false, game)
    task.wait(0.1)
    vim:SendKeyEvent(false, keyCode, false, game)
end

local Main = Window:CreateTab("MAIN", 4483362458)

--///////////////////////////////////////////////////////////////
-- Auto Vote Section
--///////////////////////////////////////////////////////////////

local SectionAutoVote = Main:CreateSection("Auto Vote Start")
local isMonitoringEnabled = false

local toggVoteStart = Main:CreateToggle({
    Name = "Auto Vote Start",
    CurrentValue = false,
    Flag = "AutoVoteToggle",
    Callback = function(value)
        isMonitoringEnabled = value
    end,
})

local function autoStart()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local success, votePlaying = pcall(function()
        return player:WaitForChild("PlayerGui")
            :WaitForChild("HUD")
            :WaitForChild("InGame")
            :WaitForChild("VotePlaying")
    end)

    if success and votePlaying and votePlaying:IsA("Frame") then
        if votePlaying.Visible then
            local voteButton = votePlaying:FindFirstChild("Frame") and votePlaying.Frame:FindFirstChild("Vote")
            if voteButton and voteButton:IsA("TextButton") then
                task.wait(1)
                game:GetService("GuiService").SelectedObject = voteButton
                task.wait(1)
                pressKey(Enum.KeyCode.Return)
                task.wait(0.2)
                pressKey(Enum.KeyCode.BackSlash)
            end
        end
    end
end

task.spawn(function()
    while task.wait(5) do
        if isMonitoringEnabled then
            autoStart()
        end
    end
end)

--///////////////////////////////////////////////////////////////
-- Auto Retry Section
--///////////////////////////////////////////////////////////////

local SectionAutoRetry = Main:CreateSection("Auto Retry")
local isAutoRetry = false

local toggAutoRetry = Main:CreateToggle({
    Name = "Auto Retry",
    CurrentValue = false,
    Flag = "AutoRetryToggle",
    Callback = function(value)
        isAutoRetry = value
    end,
})

local function autoRetry()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local success, rewardsUI = pcall(function()
        return player:WaitForChild("PlayerGui")
            :WaitForChild("RewardsUI")
    end)

    if success and rewardsUI and rewardsUI:IsA("ScreenGui") then
        if rewardsUI.Enabled then
            local retryButton = rewardsUI:FindFirstChild("Main")
                and rewardsUI.Main:FindFirstChild("LeftSide")
                and rewardsUI.Main.LeftSide:FindFirstChild("Button")
                and rewardsUI.Main.LeftSide.Button:FindFirstChild("Retry")

            if retryButton and retryButton:IsA("TextButton") then
                if retryButton.Visible then
                    task.wait(1)
                    game:GetService("GuiService").SelectedObject = retryButton
                    task.wait(1)
                    pressKey(Enum.KeyCode.Return)
                    task.wait(0.2)
                    pressKey(Enum.KeyCode.BackSlash)
                end
            end
        end
    end
end

task.spawn(function()
    while task.wait(5) do
        if isAutoRetry then
            autoRetry()
        end
    end
end)

--///////////////////////////////////////////////////////////////
-- Auto Next Section
--///////////////////////////////////////////////////////////////

local SectionAutoNext = Main:CreateSection("Auto Next")
local isAutoNext = false

local toggAutoNext = Main:CreateToggle({
    Name = "Auto Next",
    CurrentValue = false,
    Flag = "AutoNextToggle",
    Callback = function(value)
        isAutoNext = value
    end,
})

local function autoNext()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local success, rewardsUI = pcall(function()
        return player:WaitForChild("PlayerGui")
            :WaitForChild("RewardsUI")
    end)

    if success and rewardsUI and rewardsUI:IsA("ScreenGui") then
        if rewardsUI.Enabled then
            local nextButton = rewardsUI:FindFirstChild("Main")
                and rewardsUI.Main:FindFirstChild("LeftSide")
                and rewardsUI.Main.LeftSide:FindFirstChild("Button")
                and rewardsUI.Main.LeftSide.Button:FindFirstChild("Next")

            if nextButton and nextButton:IsA("TextButton") then
                if nextButton.Visible then
                    task.wait(1)
                    game:GetService("GuiService").SelectedObject = nextButton
                    task.wait(1)
                    pressKey(Enum.KeyCode.Return)
                    task.wait(0.2)
                    pressKey(Enum.KeyCode.BackSlash)
                end
            end
        end
    end
end

task.spawn(function()
    while task.wait(5) do
        if isAutoNext then
            autoNext()
        end
    end
end)
