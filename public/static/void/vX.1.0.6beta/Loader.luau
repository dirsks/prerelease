if not game then
	print("chill bro im not patching this script, so you don't need to deobfuscate it and says the script is your")
	return
end
if game.PlaceId ~= 893973440 then
	warn("Please play FLEE THE FACILITY to the script hub work.")
	return
end
if game.PlaceId == 893973440 then
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "DIRSBLOX FTF hub",
   Icon = 136729063013827, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading, Press V to open",
   LoadingSubtitle = "made with love by luna ❤️",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "V", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = ""
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/4YkCfGQm", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
-- booting
loadstring(game:HttpGet("https://pastebin.com/raw/JJh2xXEk"))()
local t1 = Window:CreateTab("⚙️ | Basic Hacks", 4483362458) -- Title, Image
local t3 = Window:CreateTab("🥽 | ESP", 4483362458) -- Title, Image
local t4 = Window:CreateTab("👨‍💻 | Exploit", 4483362458) -- Title, Image

local Section = t1:CreateSection("Walk speed")
local Section = t1:CreateSection("Jump power")
local Section = t1:CreateSection("World gravity")
local Section = t1:CreateSection("Inf jump")
--[[ t2
local Section = t2:CreateSection("STUFF IN BETA!")
]]
-- t3
local Section = t4:CreateSection("BETA - FTF Exploit")

local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character.Humanoid

-- ESP Toggles
local Toggle = t3:CreateToggle({
   Name = "Toggle Example",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
			function getBeast()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr and plr.TempPlayerStatsModule:FindFirstChild("IsBeast") then
            if plr.TempPlayerStatsModule:FindFirstChild("IsBeast").Value then
                return plr
            end
        end
    end
    return nil
			end
   local player = game.Players:GetChildren()
	for i=1, #player do
		if player[i] ~= game.Players.LocalPlayer and player[i].Character ~= nil then
		local character = player[i].Character
		if character:findFirstChild("Highlight") and not playertoggle then
			character.Highlight:remove()
		end
		if Value and not character:findFirstChild("Highlight") then
			local a = Instance.new("Highlight", character)
			a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			a.FillColor = Color3.fromRGB(0,255,0) -- avoid display bugs as soon as loads :)
			a.OutlineColor = Color3.fromRGB(127,255,127) -- avoid display bugs as soon as loads :)
			spawn(function()
				repeat
					wait(0.1)
					if player[i] == getBeast() then
						a.FillColor = Color3.fromRGB(255,0,0)
						a.OutlineColor = Color3.fromRGB(255,127,127)
					else
						a.FillColor = Color3.fromRGB(0,255,0)
						a.OutlineColor = Color3.fromRGB(127,255,127)
					end
				until character == nil or a == nil
			end)
			end
			end
	end
      end
   end,
})
local Toggle = t3:CreateToggle({
    Name = "ESP Pod",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Value)
        local pods = workspace:GetDescendants()

        for i = 1, #pods do
            if pods[i].Name == "FreezePod" then
                local pod = pods[i]

                if pod:FindFirstChild("Highlight") and not Value then
                    pod.Highlight:Remove()
                end

                if Value and not pod:FindFirstChild("Highlight") then
                    local a = Instance.new("Highlight", pod)
                    a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    a.FillColor = Color3.fromRGB(0, 255, 255)
                    a.OutlineColor = Color3.fromRGB(127, 255, 255)
                end
            end
        end
    end,
})
local Toggle = t3:CreateToggle({
    Name = "ESP Exit Doors",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        local doors = workspace:GetDescendants()

        for i = 1, #portas do
            if doors[i].Name == "ExitDoor" then
                local door = doors[i]

                if door:FindFirstChild("Highlight") and not Value then
                    door.Highlight:Remove()
                end

                if Value and not soor:FindFirstChild("Highlight") then
                    local a = Instance.new("Highlight", door)
                    a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    a.FillColor = Color3.fromRGB(255, 255, 0)
                    a.OutlineColor = Color3.fromRGB(255, 255, 127)
                end
            end
        end
    end,
})
local Toggle = t3:CreateToggle({
    Name = "ESP PCs",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        local pcs = workspace:GetDescendants()

        for i = 1, #pcs do
            if pcs[i].Name == "ComputerTable" then
                local pc = pcs[i]

                if pc:FindFirstChild("Highlight") and not Value then
                    pc.Highlight:Remove()
                end

                if Value and not pc:FindFirstChild("Highlight") then
                    local a = Instance.new("Highlight", pc)
                    a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    a.FillColor = Color3.fromRGB(0, 0, 255)
                    a.OutlineColor = Color3.fromRGB(127, 127, 255)
                end
            end
        end
    end,
})
-- Basic Hacks buttons
local noclip = false
local char = character

local Toggle = Tab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "ToggleNoclip",
    Callback = function(Value)
        noclip = Value
    end,
})

game:GetService("RunService").Stepped:Connect(function()
    if noclip and char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end
end)
local Slider = t1:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 50},
   Increment = 10,
   Suffix = "WalkSpeed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		humanoid.WalkSpeed = Value
   end,
})
local Slider = t1:CreateSlider({
   Name = "JumpPower",
   Range = {0, 100},
   Increment = 10,
   Suffix = "WalkSpeed",
   CurrentValue = 10,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		humanoid.JumpPower = Value
   end,
})
local Slider = t1:CreateSlider({
   Name = "Gravity",
   Range = {0, 50},
   Increment = 10,
   Suffix = "WalkSpeed",
   CurrentValue = 198.6,
   Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		workspace.Gravity = Value
   end,
})
local Button = t1:CreateButton({
   Name = "Reset Gravity",
   Callback = function()
			workspace.Gravity = 198.6
   end,
})
local Button = t1:CreateButton({
   Name = "Reset Speed",
   Callback = function()
			humanoid.WalkSpeed = 16
   end,
})
local Button = t1:CreateButton({
   Name = "Reset JP",
   Callback = function()
			humanoid.JumpPower = 50
   end,
})
-- FTF
local Button = t1:CreateButton({
   Name = "Confuse Beast - USE BEFORE GET ROPED",
   Callback = function()
	local targetCFrame = CFrame.new(111.20410919189453, 8.207777976989746, -413.4593811035156)
			if character and character.PrimaryPart then
				for i = 1, 240 do
				character:SetPrimaryPartCFrame(targetCFrame)
				task.wait(0.05)
				end
			end
   end,
})
local Button = t4:CreateButton({
   Name = "Unfreeze - LAST RESORT, USE IN FREEZER",
   Callback = function()
			Rayfield:Notify({
					Title = "Alert",
					Content = "You can no longer hack computers! You can escape",
					Duration = 6.5,
					Image = "rewind",
			})
			if character then
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					humanoid.Health = 0
				end
			end
   end,
})
local Section = t4:CreateSection("Teleports")
local Button = t4:CreateButton({
   Name = "TP To Map",
   Callback = function()
			local function findOBSpawnPadInParent()
				for _, model in pairs(game.Workspace:GetChildren()) do
				if model:IsA("Model") then
						local computerTable = model:FindFirstChild("ComputerTable")
						if computerTable and computerTable:IsA("Model") then
							local spawnPad = model:FindFirstChild("OBSpawnPad")
								if spawnPad and spawnPad:IsA("BasePart") then
								return spawnPad
							end
						end
					end
				end
			return nil
   end,
})
local Button = t4:CreateButton({
   Name = "TP to random PC",
   Callback = function()
				local parts = {}
				for _, obj in pairs(parent:GetChildren()) do
				if obj.Name == name and obj:IsA("Model") then
						table.insert(parts, obj)
				end
				if #obj:GetChildren() > 0 then
					local foundParts = findAllPartsByName(obj, name)
					for _, found in pairs(foundParts) do
					table.insert(parts, found)
				end
			end
		end
    return parts
end

local recentComputers = {}

local function getRandomComputer()
    local computerTableModels = findAllPartsByName(game.Workspace, "ComputerTable")

    if #computerTableModels > 0 then
        local validComputers = {}

        for _, computer in pairs(computerTableModels) do
            if not table.find(recentComputers, computer) then
                table.insert(validComputers, computer)
            end
        end

        if #validComputers == 0 then
            recentComputers = {}
            validComputers = computerTableModels
        end

        local randomIndex = math.random(1, #validComputers)
        return validComputers[randomIndex]
    end
    return nil
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local chosenComputer = getRandomComputer()

if chosenComputer and chosenComputer.PrimaryPart then
    local targetPosition = chosenComputer.PrimaryPart.Position + Vector3.new(0, 5, 0)
    rootPart.CFrame = CFrame.new(targetPosition)

    table.insert(recentComputers, chosenComputer)
    if #recentComputers > 3 then
        table.remove(recentComputers, 1)
    end
	end
   end,
})
local Button = Tab:CreateButton({
   Name = "Anti PC Error",
   Callback = function()
			Name = "Anti PC Error - Click to disable"
			_G.AutomaticHackingEnabled = not _G.AutomaticHackingEnabled

			Rayfield:Notify({
					Title = "Anti-PC-Error",
					Content = _G.AutomaticHackingEnabled and "Enabled." or "Disabled.",
					Duration = 6.5,
					Image = 4483362458,
			})

			while _G.AutomaticHackingEnabled do
			wait(0.25)
				local args = {
					"SetPlayerMinigameResult",
					true
				}
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
			end
   end,
})
local Button = Tab:CreateButton({
   Name = "TP to random Exit",
   Callback = function()
			local function findAllModelsByName(parent, name)
				local models = {}
				for _, obj in pairs(parent:GetChildren()) do
				if obj.Name == name and obj:IsA("Model") then
						table.insert(models, obj)
				end
				if #obj:GetChildren() > 0 then
						local foundModels = findAllModelsByName(obj, name)
						for _, found in pairs(foundModels) do
						table.insert(models, found)
				end
				end
				end
					return models
			end

			local exitDoorModels = findAllModelsByName(game.Workspace, "ExitDoor")

			if #exitDoorModels > 0 then
				local randomIndex = math.random(1, #exitDoorModels)
				local exitDoor = exitDoorModels[randomIndex]

				local player = game.Players.LocalPlayer
				local character = player.Character or player.CharacterAdded:Wait()
				local rootPart = character:WaitForChild("HumanoidRootPart")

				local pivotCFrame = exitDoor:GetPivot()
				local behindDoorCFrame = pivotCFrame * CFrame.new(0, 0, -5)
				rootPart.CFrame = behindDoorCFrame
			end
   end,
})
local Section = t4:CreateSection("Others")
local Button = Tab:CreateButton({
   Name = "Remote audio control",
   Callback = function()
			loadstring(game:HttpGet("https://pastebin.com/raw/3dWP6BW4"))()
   end,
})
end
