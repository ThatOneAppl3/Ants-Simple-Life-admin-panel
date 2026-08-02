-------- https://docs.sirius.menu/rayfield --------

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

--// Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Player
local LocalPlayer = Players.LocalPlayer

--// Variables
local SelectedBrickColor = BrickColor.new("White")
local MessageText = ""
local TargetMode = "All"

--// Remote used by the announcement system.
--// CHANGE "AnnounceRemote" if your game's RemoteEvent has a different name.
local AnnounceRemote = ReplicatedStorage:FindFirstChild("AnnounceRemote")

--// Hook states
local AntiCheatHooked = false
local WeatherHooked = false

--------------------------------------------------------
-- Window
--------------------------------------------------------

local Window = Rayfield:CreateWindow({
    Name = "Ant Panel Premium",
    Icon = "shield-check",

    LoadingTitle = "Ant Admin Panel",
    LoadingSubtitle = "Shitting hard or hardly shitting?",

    ShowText = "Admin Panel",
    Theme = "AmberGlow",

    ToggleUIKeybind = "K",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "we wont use this"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = false
    },

    KeySystem = true,

    KeySettings = {
        Title = "Admin Panel",
        Subtitle = "Admin abuse???",
        Note = "Hint: What's my favorite fruit?",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {
            "Apple"
        }
    }
})

--------------------------------------------------------
-- Main Tab
--------------------------------------------------------

local Main = Window:CreateTab("Main", "message-circle")

Main:CreateLabel(
    "Bypass stuff inside the game",
    "info",
    Color3.fromRGB(255, 255, 255),
    false
)

Main:CreateDivider()

--------------------------------------------------------
-- Anti-Cheat Bypass
--------------------------------------------------------

Main:CreateButton({
    Name = "Bypass anticheat",

    Callback = function()

        if AntiCheatHooked then
            Rayfield:Notify({
                Title = "Anticheat",
                Content = "Anticheat bypass is already enabled.",
                Duration = 3,
                Image = "circle-check"
            })
            return
        end

        local Event = ReplicatedStorage:FindFirstChild("Kickthem")

        if not Event then
            Rayfield:Notify({
                Title = "Anticheat",
                Content = "Kickthem RemoteEvent was not found.",
                Duration = 4,
                Image = "circle-x"
            })
            return
        end

        if not hookmetamethod or not newcclosure or not getnamecallmethod then
            Rayfield:Notify({
                Title = "Anticheat",
                Content = "Your executor does not support the required hook functions.",
                Duration = 4,
                Image = "circle-x"
            })
            return
        end

        local oldNamecall

        oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local Method = getnamecallmethod()

            if self == Event and Method == "FireServer" then
                print("[Ant Panel] Detected anticheat call - blocked")
                return nil
            end

            return oldNamecall(self, ...)
        end))

        AntiCheatHooked = true

        Rayfield:Notify({
            Title = "Anticheat",
            Content = "Walkspeed + Flying enabled permanently",
            Duration = 3,
            Image = "circle-check"
        })
    end
})

--------------------------------------------------------
-- Weather Bypass
--------------------------------------------------------

Main:CreateButton({
    Name = "Bypass Weather",

    Callback = function()

        if WeatherHooked then
            Rayfield:Notify({
                Title = "Weather",
                Content = "Weather damage bypass is already enabled.",
                Duration = 3,
                Image = "circle-check"
            })
            return
        end

        local Event = ReplicatedStorage:FindFirstChild("DamageHumanoid")

        if not Event then
            Rayfield:Notify({
                Title = "Weather",
                Content = "DamageHumanoid RemoteEvent was not found.",
                Duration = 4,
                Image = "circle-x"
            })
            return
        end

        if not hookmetamethod or not newcclosure or not getnamecallmethod then
            Rayfield:Notify({
                Title = "Weather",
                Content = "Your executor does not support the required hook functions.",
                Duration = 4,
                Image = "circle-x"
            })
            return
        end

        local oldNamecall

        oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local Method = getnamecallmethod()

            if self == Event and Method == "FireServer" then
                print("[Ant Panel] Weather damage detected - blocked")
                return nil
            end

            return oldNamecall(self, ...)
        end))

        WeatherHooked = true

        Rayfield:Notify({
            Title = "Weather",
            Content = "Won't take blizzard or rain damage.",
            Duration = 3,
            Image = "circle-check"
        })
    end
})

Main:CreateDivider()

--------------------------------------------------------
-- BrickColor List
--------------------------------------------------------

local BrickColorNames = {
    "White",
    "Light stone grey",
    "Medium stone grey",
    "Dark stone grey",
    "Black",
    "Bright red",
    "Bright blue",
    "Bright yellow",
    "Bright green",
    "Bright orange",
    "Bright violet",
    "Really red",
    "Really blue",
    "Really black",
    "Lime green",
    "Pastel Blue",
    "Pastel yellow",
    "Pastel brown",
    "Sand red",
    "Sand blue",
    "Sand green",
    "Brown",
    "Reddish brown",
    "Dark green",
    "Dark blue",
    "Navy blue",
    "Royal purple",
    "Hot pink",
    "Magenta",
    "Institutional white",
    "Toothpaste",
    "Cyan",
    "Teal",
    "Gold",
    "New Yeller",
    "Earth green",
    "Earth blue",
    "Olive",
    "Crimson",
    "Lavender"
}

table.sort(BrickColorNames)

--------------------------------------------------------
-- Color Dropdown
--------------------------------------------------------

Main:CreateDropdown({
    Name = "Color",

    Options = BrickColorNames,

    CurrentOption = {
        SelectedBrickColor.Name
    },

    MultipleOptions = false,

    Callback = function(Options)

        local Choice

        if typeof(Options) == "table" then
            Choice = Options[1]
        else
            Choice = Options
        end

        if Choice then
            local Success, Result = pcall(function()
                return BrickColor.new(Choice)
            end)

            if Success then
                SelectedBrickColor = Result
            end
        end
    end
})

--------------------------------------------------------
-- Message Input
--------------------------------------------------------

Main:CreateInput({
    Name = "Message",

    CurrentValue = "",

    PlaceholderText = "Enter announcement...",

    RemoveTextAfterFocusLost = false,

    Callback = function(Text)
        MessageText = Text or ""
    end
})

--------------------------------------------------------
-- Target Dropdown
--------------------------------------------------------

Main:CreateDropdown({
    Name = "Target",

    Options = {
        "All",
        "Me",
        "Nearest",
        "Team"
    },

    CurrentOption = {
        "All"
    },

    MultipleOptions = false,

    Callback = function(Options)

        local Choice

        if typeof(Options) == "table" then
            Choice = Options[1]
        else
            Choice = Options
        end

        if Choice then
            TargetMode = Choice
        end
    end
})

--------------------------------------------------------
-- Helper: Send Message
--------------------------------------------------------

local function SendToPlayer(Player)

    if not Player then
        return
    end

    if not AnnounceRemote then
        return
    end

    AnnounceRemote:FireServer(
        SelectedBrickColor,
        Player,
        MessageText
    )
end

--------------------------------------------------------
-- Helper: Find Nearest Player
--------------------------------------------------------

local function GetNearestPlayer()

    local Character = LocalPlayer.Character

    if not Character then
        return nil
    end

    local Root = Character:FindFirstChild("HumanoidRootPart")

    if not Root then
        return nil
    end

    local NearestPlayer = nil
    local ClosestDistance = math.huge

    for _, Player in ipairs(Players:GetPlayers()) do

        if Player ~= LocalPlayer then

            local Character = Player.Character

            local HumanoidRootPart =
                Character and Character:FindFirstChild("HumanoidRootPart")

            if HumanoidRootPart then

                local Distance =
                    (Root.Position - HumanoidRootPart.Position).Magnitude

                if Distance < ClosestDistance then
                    ClosestDistance = Distance
                    NearestPlayer = Player
                end
            end
        end
    end

    return NearestPlayer
end

--------------------------------------------------------
-- Send Message Button
--------------------------------------------------------

Main:CreateButton({
    Name = "Send Message",

    Callback = function()

        if MessageText == "" then

            Rayfield:Notify({
                Title = "Announce GUI",
                Content = "Please enter a message first.",
                Duration = 3,
                Image = "circle-x"
            })

            return
        end

        if not AnnounceRemote then

            Rayfield:Notify({
                Title = "Announce GUI",
                Content = "AnnounceRemote was not found in ReplicatedStorage.",
                Duration = 4,
                Image = "circle-x"
            })

            return
        end

        ------------------------------------------------
        -- Me
        ------------------------------------------------

        if TargetMode == "Me" then

            SendToPlayer(LocalPlayer)

        ------------------------------------------------
        -- Nearest
        ------------------------------------------------

        elseif TargetMode == "Nearest" then

            -- Send to yourself
            SendToPlayer(LocalPlayer)

            -- Send to nearest player
            local Nearest = GetNearestPlayer()

            if Nearest then
                SendToPlayer(Nearest)
            end

        ------------------------------------------------
        -- Team
        ------------------------------------------------

        elseif TargetMode == "Team" then

            for _, Player in ipairs(Players:GetPlayers()) do

                if Player.Team == LocalPlayer.Team then
                    SendToPlayer(Player)
                end

            end

        ------------------------------------------------
        -- All
        ------------------------------------------------

        elseif TargetMode == "All" then

            for _, Player in ipairs(Players:GetPlayers()) do
                SendToPlayer(Player)
            end
        end

        ------------------------------------------------
        -- Notification
        ------------------------------------------------

        Rayfield:Notify({
            Title = "Announcement",
            Content = "Announcement sent!",
            Duration = 3,
            Image = "circle-check"
        })
    end
})

--------------------------------------------------------
-- Finished
--------------------------------------------------------

Rayfield:Notify({
    Title = "Ant Panel Premium",
    Content = "Loaded successfully!",
    Duration = 3,
    Image = "circle-check"
})
