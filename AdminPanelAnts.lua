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

local Main = Window:CreateTab("Main", "tool-case")

-- Main tab

local Label = Main:CreateLabel("Game", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, Ignoretheme?

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
   Image = 4483362458,
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
   Image = 4483362458,
})
   end,
})
