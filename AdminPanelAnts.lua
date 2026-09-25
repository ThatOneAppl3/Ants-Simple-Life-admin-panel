-------- https://docs.sirius.menu/rayfield --------

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

--// Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

local AnnounceRemote = ReplicatedStorage:WaitForChild("Annouce", 10)

if not AnnounceRemote then
    warn("================================")
    warn("ANNOUCE WAS NOT FOUND")
    warn("Objects currently in ReplicatedStorage:")

    for _, Object in ipairs(ReplicatedStorage:GetDescendants()) do
        print(Object:GetFullName(), Object.ClassName)
    end

    warn("================================")
else
    print("FOUND ANNOUCE!")
    print("Path:", AnnounceRemote:GetFullName())
    print("Class:", AnnounceRemote.ClassName)
end

--// Player
local LocalPlayer = Players.LocalPlayer

--// Variables
local SelectedBrickColor = BrickColor.new("Bright Red")
local MessageText = ""
local TargetMode = "All"

--// Remote used by the announcement system.
--// CHANGE "AnnounceRemote" if your game's RemoteEvent has a different name.
local AnnounceRemote = ReplicatedStorage:WaitForChild("Annouce")

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

Main:CreateButton({
	Name = "Instant Larva Food",
	Callback = function()

		local Event = LocalPlayer.PlayerGui:WaitForChild("MainLarvaeui")
			.Frame.Frame.Play.ForcePlay

		for i = 1, 80 do
			Event:FireServer("FOODNOW!")
		end

		Rayfield:Notify({
			Title = "Larva",
			Content = "You have grown!",
			Duration = 3
		})

	end
})

Main:CreateDivider()
--------------------------------------------------------
-- BrickColor List
--------------------------------------------------------
local BrickColorNames = {
    "Alder",
    "Artichoke",
    "Baby blue",
    "Beige",
    "Black",
    "Black metallic",
    "Br. reddish orange",
    "Br. yellowish green",
    "Br. yellowish orange",
    "Brick yellow",
    "Bright blue",
    "Bright bluish green",
    "Bright bluish violet",
    "Bright green",
    "Bright orange",
    "Bright purple",
    "Bright red",
    "Bright reddish lilac",
    "Bright reddish violet",
    "Bright violet",
    "Bright yellow",
    "Bronze",
    "Brown",
    "Burgundy",
    "Burlap",
    "Burnt Sienna",
    "Buttermilk",
    "Cadet blue",
    "Camo",
    "Carnation pink",
    "Cashmere",
    "CGA brown",
    "Cloudy grey",
    "Cocoa",
    "Cool yellow",
    "Copper",
    "Cork",
    "Crimson",
    "Curry",
    "Cyan",
    "Daisy orange",
    "Dark blue",
    "Dark Curry",
    "Dark green",
    "Dark grey",
    "Dark grey metallic",
    "Dark indigo",
    "Dark nougat",
    "Dark orange",
    "Dark red",
    "Dark Royal blue",
    "Dark stone grey",
    "Dark taupe",
    "Deep blue",
    "Deep orange",
    "Deep orange",
    "Dirt brown",
    "Dove blue",
    "Dusty Rose",
    "Earth blue",
    "Earth green",
    "Earth orange",
    "Earth yellow",
    "Eggplant",
    "Electric blue",
    "Faded green",
    "Fawn brown",
    "Fire Yellow",
    "Flame reddish orange",
    "Flame yellowish orange",
    "Flint",
    "Fog",
    "Forest green",
    "Fossil",
    "Ghost grey",
    "Gold",
    "Gold",
    "Grey",
    "Grime",
    "Gun metallic",
    "Hot pink",
    "Hurricane grey",
    "Institutional white",
    "Khaki",
    "Lapis",
    "Laurel green",
    "Lavender",
    "Lemon metalic",
    "Lig. Yellowich orange",
    "Lig. yellowish green",
    "Light blue",
    "Light bluish green",
    "Light bluish violet",
    "Light brick yellow",
    "Light green (Mint)",
    "Light grey",
    "Light grey metallic",
    "Light lilac",
    "Light orange",
    "Light orange brown",
    "Light pink",
    "Light purple",
    "Light red",
    "Light reddish violet",
    "Light Royal blue",
    "Light stone grey",
    "Light yellow",
    "Lilac",
    "Lilac",
    "Lily white",
    "Lime green",
    "Linen",
    "Magenta",
    "Maroon",
    "Mauve",
    "Med. bluish green",
    "Med. reddish violet",
    "Med. yellowish green",
    "Med. yellowish orange",
    "Medium blue",
    "Medium bluish violet",
    "Medium green",
    "Medium lilac",
    "Medium orange",
    "Medium red",
    "Medium Royal blue",
    "Medium stone grey",
    "Mid gray",
    "Mint",
    "Moss",
    "Mulberry",
    "Navy blue",
    "Neon green",
    "Neon orange",
    "New Yeller",
    "Nougat",
    "Olive",
    "Olivine",
    "Oyster",
    "Parsley green",
    "Pastel Blue",
    "Pastel blue-green",
    "Pastel brown",
    "Pastel green",
    "Pastel light blue",
    "Pastel orange",
    "Pastel violet",
    "Pastel yellow",
    "Pearl",
    "Persimmon",
    "Phosph. White",
    "Pine Cone",
    "Pink",
    "Plum",
    "Quill grey",
    "Really black",
    "Really blue",
    "Really red",
    "Red flip/flop",
    "Reddish brown",
    "Reddish lilac",
    "Royal blue",
    "Royal purple",
    "Rust",
    "Rust",
    "Sage green",
    "Salmon",
    "Sand blue",
    "Sand blue metallic",
    "Sand green",
    "Sand red",
    "Sand violet",
    "Sand violet metallic",
    "Sand yellow",
    "Sand yellow metallic",
    "Sea green",
    "Seashell",
    "Shamrock",
    "Silver",
    "Silver flip/flop",
    "Slime green",
    "Smoky grey",
    "Steel blue",
    "Storm blue",
    "Sunrise",
    "Tawny",
    "Teal",
    "Terra Cotta",
    "Toothpaste",
    "Tr. Blue",
    "Tr. Bright bluish violet",
    "Tr. Brown",
    "Tr. Flu. Blue",
    "Tr. Flu. Green",
    "Tr. Flu. Red",
    "Tr. Flu. Reddish orange",
    "Tr. Flu. Yellow",
    "Tr. Green",
    "Tr. Lg blue",
    "Tr. Medi. reddish violet",
    "Tr. Red",
    "Tr. Yellow",
    "Transparent",
    "Turquoise",
    "Warm yellowish orange",
    "Wheat",
    "White",
    "Yellow flip/flop",
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

Main:CreateDivider()

local InfFood = false

Main:CreateToggle({
    Name = "Inf Food/Energy",
    CurrentValue = false,
    Flag = "InfFoodEnergy",
    Callback = function(Value)
        InfFood = Value

        if Value then
            task.spawn(function()
                while InfFood do
                    local Event = game:GetService("ReplicatedStorage").GivePlayerFood
                    local Callback = getcallbackvalue(Event, "OnClientInvoke")

                    if Callback then
                        pcall(function()
                            Callback(0, 80)
                            Callback(1, 80)
                        end)
                    end

                    task.wait(1)
                end
            end)
        end
    end,
})

Main:CreateButton({
    Name = "Growl",
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").SHOWIT
        local Player = game:GetService("Players").LocalPlayer
        local Character = Player.Character

        if Character and Character:FindFirstChild("Torso") then
            firesignal(
                Event.OnClientEvent,
                {
                    Character.Torso
                },
                Color3.new(0, 0, 0),
                2992299292929929292929922929292929292992929292929929292929292929299999292992929299292992
            )
        end
    end,
})

-- Scripts tab

local Scripts = Window:CreateTab("Scripts", "save")

local Button = Scripts:CreateButton({
   Name = "Waypoints v1",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatOneAppl3/Ants-Simple-Life-admin-panel/refs/heads/main/Waypoints%20v1"))()
   end,
})

local Button = Scripts:CreateButton({
   Name = "Flying script",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-The-best-fly-gui-246203"))()
   end,
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

local EventsTab = Window:CreateTab("Events")

-- 🟤 Copper INFECTION!
local CopperSection = EventsTab:CreateSection("🟤 Copper INFECTION!")

EventsTab:CreateParagraph({
    Title = "Color: Copper",
    Content = "You are Patient Zero. Travel from the Copper tutorial map to the mainland and spread Copper throughout the server."
})

-- 🌎 Sandbox
local SandboxSection = EventsTab:CreateSection("🌎 Sandbox")

EventsTab:CreateParagraph({
    Title = "Color: Any",
    Content = "Bring a mainland colony to the Copper tutorial map. The tutorial area becomes a huge sandbox with infinite food, building space, and lots of things to do."
})

-- 🌌 Void Civ
local VoidCivSection = EventsTab:CreateSection("🌌 Void Civ")

EventsTab:CreateParagraph({
    Title = "Color: Any",
    Content = "Build a civilization on an island floating above the void. Players develop their own society and colony. The game's weird digging other ants for soil mechanic can become part of the civilization's economy."
})

-- 🐝 Not the Bees!
local BeesSection = EventsTab:CreateSection("🐝 Not the Bees!")

EventsTab:CreateParagraph({
    Title = "Color: 🟡 Gold",
    Content = "You become a Gold Queen and, with another Alate, establish an Alate colony/hive around the big tree. Expand the hive with new rooms and defend it from invaders. Gold is used because it fits the bee theme."
})

-- 🛰️ Space Colony
local SpaceSection = EventsTab:CreateSection("🛰️ Space Colony")

EventsTab:CreateParagraph({
    Title = "Color: Any",
    Content = "Build a colony upward into the sky, eventually creating a floating/space-like settlement."
})

-- 🌎 True Mainland
local TrueMainlandSection = EventsTab:CreateSection("🌎 True Mainland")

EventsTab:CreateParagraph({
    Title = "Color: 🟤 Copper",
    Content = "All five colonies exist on the full mainland: Purple, Green, Gold, Ghost, and Copper."
})

-- 🏴‍☠️ Pirates
local PiratesSection = EventsTab:CreateSection("🏴‍☠️ Pirates")

EventsTab:CreateParagraph({
    Title = "Color: Any",
    Content = "Create a pirate-themed colony/settlement. The event is primarily roleplay and construction rather than requiring a particular ant color."
})
-- 🌍 New World
local NewWorldSection = EventsTab:CreateSection("🌍 New World")

EventsTab:CreateParagraph({
    Title = "Color: Any",
    Content = "Everyone goes out looking for somewhere that hasn't been colonized yet. Once they find a suitable location, they establish a completely new colony there. The players decide what the new settlement becomes."
})
