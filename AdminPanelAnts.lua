--------https://docs.sirius.menu/rayfield--------
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
--▄▀█ █▀▄ █▀▄▀█ █ █▄░█ 
--█▀█ █▄▀ █░▀░█ █ █░▀█
--█▀█ ▄▀█ █▄░█ █▀▀ █░
--█▀▀ █▀█ █░▀█ ██▄ █▄
local Window = Rayfield:CreateWindow({
   Name = "Ant Panel Premium",
   Icon = 0,
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
