--------https://docs.sirius.menu/rayfield--------
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
--▄▀█ █▀▄ █▀▄▀█ █ █▄░█ 
--█▀█ █▄▀ █░▀░█ █ █░▀█
--█▀█ ▄▀█ █▄░█ █▀▀ █░
--█▀▀ █▀█ █░▀█ ██▄ █▄

local Window = Rayfield:CreateWindow({
   Name = "Ant Panel Premium",
   Icon = "shield-check",
   LoadingTitle = "Ant Admin Panel",
   LoadingSubtitle = "Shitting hard or hardly shitting?",
   ShowText = "Admin Panel",
   Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes for more

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "we wont use this"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join my Discord server if their executor supports it
      Invite = "noinvitelink",
      RememberJoins = false
   },

   KeySystem = true,
   KeySettings = {
      Title = "Admin Panel",
      Subtitle = "Admin abuse???",
      Note = "Hint: What's my favorite fruit?",
      FileName = "Key", -- we won't need this
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Apple"}
   }
})

-- TABS TO USE

local Main = Window:CreateTab("Main", "message-circle")

-- Main tab

local Label = Main:CreateLabel("Bypass stuff inside the game", "info", Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, Ignoretheme?

local Divider = Main:CreateDivider()

local ButtonCheat = Main:CreateButton({
   Name = "Bypass anticheat",
   Callback = function()
   local Event = game:GetService("ReplicatedStorage"):WaitForChild("Kickthem")

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if self == Event and method == "FireServer" then
        print("detected anticheat call, blocked")
        return nil
    end

    return oldNamecall(self, ...)
end))
Rayfield:Notify({
   Title = "Anticheat",
   Content = "Walkspeed + Flying enabled permanently",
   Duration = 3,
   Image = "circle-check",
})
   end,
})

local ButtonWeather = Main:CreateButton({
   Name = "Bypass Weather",
   Callback = function()
   local Event = game:GetService("ReplicatedStorage").DamageHumanoid

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if self == Event and method == "FireServer" then
        print("weather tried to kill you, blocked it.")
        return nil
    end

    return oldNamecall(self, ...)
end))
Rayfield:Notify({
   Title = "Weather",
   Content = "Won't take blizzard or rain damage.",
   Duration = 3,
   Image = "circle-check",
})
   end,
})

local Divider = Main:CreateDivider()

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

Main:CreateDropdown({
	Name = "Color",
	Options = BrickColorNames,
	CurrentOption = {
		SelectedBrickColor.Name
	},
	MultipleOptions = false,

	Callback = function(Options)
		local Choice = typeof(Options) == "table" and Options[1] or Options

		if Choice then
			SelectedBrickColor = BrickColor.new(Choice)
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
		MessageText = Text
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
		local Choice = typeof(Options) == "table" and Options[1] or Options

		if Choice then
			TargetMode = Choice
		end
	end
})
--------------------------------------------------------
-- Part 2
-- Helper Functions + Message Button
--------------------------------------------------------

local function SendToPlayer(player)
	if not player then
		return
	end

   AnnounceRemote:FireServer(
		SelectedBrickColor,
		player,
		MessageText
	)
end

local function GetNearestPlayer()
	local Character = LocalPlayer.Character
	if not Character then
		return nil
	end

	local Root = Character:FindFirstChild("HumanoidRootPart")
	if not Root then
		return nil
	end

	local NearestPlayer
	local ClosestDistance = math.huge

	for _, Player in ipairs(Players:GetPlayers()) do
		if Player ~= LocalPlayer then
			local Char = Player.Character
			local HumanoidRootPart = Char and Char:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				local Distance = (Root.Position - HumanoidRootPart.Position).Magnitude

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
-- Message Button
--------------------------------------------------------

Main:CreateButton({
	Name = "Send Message",

	Callback = function()

		if MessageText == "" then
			Rayfield:Notify({
				Title = "Announce GUI",
				Content = "Please enter a message first.",
				Duration = 3,
				Image = 4483362458
			})
			return
		end

		if TargetMode == "Me" then

			SendToPlayer(LocalPlayer)

		elseif TargetMode == "Nearest" then

			-- Send to yourself
			SendToPlayer(LocalPlayer)

			-- Send to nearest player
			local Nearest = GetNearestPlayer()

			if Nearest then
				SendToPlayer(Nearest)
			end

		elseif TargetMode == "Team" then

			for _, Player in ipairs(Players:GetPlayers()) do
				if Player.Team == LocalPlayer.Team then
					SendToPlayer(Player)
				end
			end

		elseif TargetMode == "All" then

			for _, Player in ipairs(Players:GetPlayers()) do
				SendToPlayer(Player)
			end

		end

		Rayfield:Notify({
			Title = "Announcement",
			Content = "Announcement sent!",
			Duration = 3,
			Image = 4483362458
		})

	end
})
