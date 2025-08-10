if game.GameId ~= 372226183 then
	warn("Please play FLEE THE FACILITY to the script hub work.")
	return
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
local Window = Rayfield:CreateWindow({
   Name = "DIRSBLOX FTF hub",
   Icon = 136729063013827,
   LoadingTitle = "Loading, Press V to open",
   LoadingSubtitle = "made with love by luna ❤️",
   ShowText = "Rayfield",
   Theme = "Amethyst",

   ToggleUIKeybind = "V",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = ""
   },

   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/4YkCfGQm",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})
-- booting
--loadstring(game:HttpGet("https://pastebin.com/raw/JJh2xXEk"))()
local t1 = Window:CreateTab("⚙️ | Basic Hacks", 4483362458)
local t3 = Window:CreateTab("🥽 | ESP", 4483362458)
local t4 = Window:CreateTab("👨‍💻 | Exploit", 4483362458)

local sectionWalkSpeed = t1:CreateSection("Walk speed")
local sectionJumpPower = t1:CreateSection("Jump power")
local sectionGravity = t1:CreateSection("World gravity")
local sectionInfJump = t1:CreateSection("Inf jump")

local sectionExp = t4:CreateSection("BETA - FTF Exploit")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- ESP Toggles
local function getBeast()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr and plr:FindFirstChild("TempPlayerStatsModule") then
            local stat = plr.TempPlayerStatsModule:FindFirstChild("IsBeast")
            if stat and stat.Value == true then
                return plr
            end
        end
    end
    return nil
end

t3:CreateToggle({
    Name = "Esp PLAYERS",
    CurrentValue = false,
    Flag = "TogglePlayersESP",
    Callback = function(Value)
        local playersList = game.Players:GetPlayers()
        for _, plr in pairs(playersList) do
            if plr ~= player and plr.Character then
                local char = plr.Character
                local highlight = char:FindFirstChild("Highlight")
                if highlight and not Value then
                    highlight:Destroy()
                end
                if Value and not highlight then
                    local a = Instance.new("Highlight", char)
                    a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    a.FillColor = Color3.fromRGB(0, 255, 0)
                    a.OutlineColor = Color3.fromRGB(127, 255, 127)
                    spawn(function()
                        repeat
                            wait(0.1)
                            if plr == getBeast() then
                                a.FillColor = Color3.fromRGB(255, 0, 0)
                                a.OutlineColor = Color3.fromRGB(255, 127, 127)
                            else
                                a.FillColor = Color3.fromRGB(0, 255, 0)
                                a.OutlineColor = Color3.fromRGB(127, 255, 127)
                            end
                        until not char or not a or not a.Parent
                    end)
                end
            end
        end
    end
})

-- ESP FreezePods
t3:CreateToggle({
    Name = "ESP Pod",
    CurrentValue = false,
    Flag = "TogglePodsESP",
    Callback = function(Value)
        local pods = workspace:GetDescendants()
        for _, pod in pairs(pods) do
            if pod.Name == "FreezePod" then
                local highlight = pod:FindFirstChild("Highlight")
                if highlight and not Value then
                    highlight:Destroy()
                end
                if Value and not highlight then
                    local a = Instance.new("Highlight", pod)
                    a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    a.FillColor = Color3.fromRGB(0, 255, 255)
                    a.OutlineColor = Color3.fromRGB(127, 255, 255)
                end
            end
        end
    end,
})

-- ESP ExitDoors
t3:CreateToggle({
    Name = "ESP Exit Doors",
    CurrentValue = false,
    Flag = "ToggleExitDoorsESP",
    Callback = function(Value)
        local doors = workspace:GetDescendants()
        for _, door in pairs(doors) do
            if door.Name == "ExitDoor" then
                local highlight = door:FindFirstChild("Highlight")
                if highlight and not Value then
                    highlight:Destroy()
                end
                if Value and not highlight then
                    local a = Instance.new("Highlight", door)
                    a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    a.FillColor = Color3.fromRGB(255, 255, 0)
                    a.OutlineColor = Color3.fromRGB(255, 127, 127)
                end
            end
        end
    end,
})

-- ESP PCs
t3:CreateToggle({
    Name = "ESP PCs",
    CurrentValue = false,
    Flag = "TogglePCsESP",
    Callback = function(Value)
        local pcs = workspace:GetDescendants()
        for _, pc in pairs(pcs) do
            if pc.Name == "ComputerTable" then
                local highlight = pc:FindFirstChild("Highlight")
                if highlight and not Value then
                    highlight:Destroy()
                end
                if Value and not highlight then
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

t1:CreateToggle({
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
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

t1:CreateSlider({
    Name = "WalkSpeed",
    Range = {0, 50},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = 16,
    Flag = "SliderWalkSpeed",
    Callback = function(Value)
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end,
})

t1:CreateSlider({
    Name = "JumpPower",
    Range = {0, 100},
    Increment = 1,
    Suffix = "JumpPower",
    CurrentValue = 50,
    Flag = "SliderJumpPower",
    Callback = function(Value)
        if humanoid then
            humanoid.JumpPower = Value
        end
    end,
})

t1:CreateSlider({
    Name = "Gravity",
    Range = {0, 500},
    Increment = 10,
    Suffix = "Gravity",
    CurrentValue = workspace.Gravity,
    Flag = "SliderGravity",
    Callback = function(Value)
        workspace.Gravity = Value
    end,
})
t1:CreateButton({
    Name = "Reset Gravity",
    Callback = function()
        workspace.Gravity = 196.2
    end,
})

t1:CreateButton({
    Name = "Reset Speed",
    Callback = function()
        if humanoid then
            humanoid.WalkSpeed = 16
        end
    end,
})

t1:CreateButton({
    Name = "Reset JP",
    Callback = function()
        if humanoid then
            humanoid.JumpPower = 50
        end
    end,
})

-- FTF
t1:CreateButton({
    Name = "Confuse Beast - USE BEFORE GET ROPED",
    Callback = function()
        local targetCFrame = CFrame.new(111.204, 8.207, -413.459)
        if character and character.PrimaryPart then
            for i = 1, 240 do
                character:SetPrimaryPartCFrame(targetCFrame)
                task.wait(0.05)
            end
        end
    end,
})

t4:CreateButton({
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

t4:CreateSection("Teleports")
t4:CreateButton({
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
        end

        local spawnPad = findOBSpawnPadInParent()
        if spawnPad then
            local plr = game.Players.LocalPlayer
            local charLocal = plr.Character or plr.CharacterAdded:Wait()
            if charLocal and charLocal.PrimaryPart then
                charLocal:MoveTo(spawnPad.Position)
            else
                -- se não tiver PrimaryPart, tenta MoveTo mesmo assim
                charLocal:MoveTo(spawnPad.Position)
            end
        else
            Rayfield:Notify({
                Title = "TP To Map",
                Content = "OBSpawnPad não encontrado.",
                Duration = 4,
                Image = "error",
            })
        end
   end,
})

-- Função recursiva para encontrar todos os modelos com um dado nome
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

-- Lista para evitar repetir computadores recentes
local recentComputers = {}

-- Função que retorna um computador aleatório diferente dos recentes
local function getRandomComputer()
    local computerModels = findAllModelsByName(workspace, "ComputerTable")
    if #computerModels == 0 then
        return nil
    end

    local validComputers = {}
    for _, computer in pairs(computerModels) do
        if not table.find(recentComputers, computer) then
            table.insert(validComputers, computer)
        end
    end

    if #validComputers == 0 then
        -- Se todos foram usados recentemente, reseta a lista para permitir repetir
        recentComputers = {}
        validComputers = computerModels
    end

    local randomIndex = math.random(1, #validComputers)
    return validComputers[randomIndex]
end

-- Botão na aba Exploit (t4) para teleportar para PC aleatório
t4:CreateButton({
    Name = "TP to random PC",
    Callback = function()
        local playerLocal = game.Players.LocalPlayer
        local characterLocal = playerLocal.Character or playerLocal.CharacterAdded:Wait()
        local rootPart = characterLocal:WaitForChild("HumanoidRootPart")

        local chosenComputer = getRandomComputer()

        if chosenComputer and chosenComputer.PrimaryPart then
            local targetPos = chosenComputer.PrimaryPart.Position + Vector3.new(0, 5, 0)
            rootPart.CFrame = CFrame.new(targetPos)

            table.insert(recentComputers, chosenComputer)
            if #recentComputers > 3 then
                table.remove(recentComputers, 1)
            end
        else
            Rayfield:Notify({
                Title = "TP to PC",
                Content = "No computers found to teleport!",
                Duration = 4,
                Image = "error",
            })
        end
    end,
})

t4:CreateButton({
    Name = "Anti PC Error",
    Callback = function()
        _G.AutomaticHackingEnabled = not _G.AutomaticHackingEnabled

        Rayfield:Notify({
            Title = "Anti-PC-Error",
            Content = _G.AutomaticHackingEnabled and "Enabled." or "Disabled.",
            Duration = 6.5,
            Image = 4483362458,
        })

        if _G.AutomaticHackingEnabled then
            spawn(function()
                while _G.AutomaticHackingEnabled do
                    wait(0.25)
                    local args = {
                        "SetPlayerMinigameResult",
                        true
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
            end)
        end
    end,
})

t4:CreateButton({
   Name = "TP to random Exit",
   Callback = function()
        local exitDoorModels = findAllModelsByName(game.Workspace, "ExitDoor")

        if #exitDoorModels > 0 then
            local randomIndex = math.random(1, #exitDoorModels)
            local exitDoor = exitDoorModels[randomIndex]

            local playerLocal = game.Players.LocalPlayer
            local characterLocal = playerLocal.Character or playerLocal.CharacterAdded:Wait()
            local rootPart = characterLocal:WaitForChild("HumanoidRootPart")

            local pivotCFrame = exitDoor:GetPivot()
            local behindDoorCFrame = pivotCFrame * CFrame.new(0, 0, -5)
            rootPart.CFrame = behindDoorCFrame
        end
   end,
})
t4:CreateSection("Others")
t4:CreateButton({
   Name = "Remote audio control",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/3dWP6BW4"))()
   end,
})              Image = "error",
            })
        end
   end,
})

-- Função recursiva para encontrar todos os modelos com um dado nome
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

-- Lista para evitar repetir computadores recentes
local recentComputers = {}

-- Função que retorna um computador aleatório diferente dos recentes
local function getRandomComputer()
    local computerModels = findAllModelsByName(workspace, "ComputerTable")
    if #computerModels == 0 then
        return nil
    end

    local validComputers = {}
    for _, computer in pairs(computerModels) do
        if not table.find(recentComputers, computer) then
            table.insert(validComputers, computer)
        end
    end

    if #validComputers == 0 then
        -- Se todos foram usados recentemente, reseta a lista para permitir repetir
        recentComputers = {}
        validComputers = computerModels
    end

    local randomIndex = math.random(1, #validComputers)
    return validComputers[randomIndex]
end

-- Botão na aba Exploit (t4) para teleportar para PC aleatório
t4:CreateButton({
    Name = "TP to random PC",
    Callback = function()
        local playerLocal = game.Players.LocalPlayer
        local characterLocal = playerLocal.Character or playerLocal.CharacterAdded:Wait()
        local rootPart = characterLocal:WaitForChild("HumanoidRootPart")

        local chosenComputer = getRandomComputer()

        if chosenComputer and chosenComputer.PrimaryPart then
            local targetPos = chosenComputer.PrimaryPart.Position + Vector3.new(0, 5, 0)
            rootPart.CFrame = CFrame.new(targetPos)

            table.insert(recentComputers, chosenComputer)
            if #recentComputers > 3 then
                table.remove(recentComputers, 1)
            end
        else
            Rayfield:Notify({
                Title = "TP to PC",
                Content = "No computers found to teleport!",
                Duration = 4,
                Image = "error",
            })
        end
    end,
})

t4:CreateButton({
    Name = "Anti PC Error",
    Callback = function()
        _G.AutomaticHackingEnabled = not _G.AutomaticHackingEnabled

        Rayfield:Notify({
            Title = "Anti-PC-Error",
            Content = _G.AutomaticHackingEnabled and "Enabled." or "Disabled.",
            Duration = 6.5,
            Image = 4483362458,
        })

        if _G.AutomaticHackingEnabled then
            spawn(function()
                while _G.AutomaticHackingEnabled do
                    wait(0.25)
                    local args = {
                        "SetPlayerMinigameResult",
                        true
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
            end)
        end
    end,
})

t4:CreateButton({
   Name = "TP to random Exit",
   Callback = function()
        local exitDoorModels = findAllModelsByName(game.Workspace, "ExitDoor")

        if #exitDoorModels > 0 then
            local randomIndex = math.random(1, #exitDoorModels)
            local exitDoor = exitDoorModels[randomIndex]

            local playerLocal = game.Players.LocalPlayer
            local characterLocal = playerLocal.Character or playerLocal.CharacterAdded:Wait()
            local rootPart = characterLocal:WaitForChild("HumanoidRootPart")

            local pivotCFrame = exitDoor:GetPivot()
            local behindDoorCFrame = pivotCFrame * CFrame.new(0, 0, -5)
            rootPart.CFrame = behindDoorCFrame
        end
   end,
})
t4:CreateSection("Others")
t4:CreateButton({
   Name = "Remote audio control",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/3dWP6BW4"))()
   end,
})                Image = "error",
            })
        end
   end,
})

-- Função recursiva para encontrar todos os modelos com um dado nome
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

-- Lista para evitar repetir computadores recentes
local recentComputers = {}

-- Função que retorna um computador aleatório diferente dos recentes
local function getRandomComputer()
    local computerModels = findAllModelsByName(workspace, "ComputerTable")
    if #computerModels == 0 then
        return nil
    end

    local validComputers = {}
    for _, computer in pairs(computerModels) do
        if not table.find(recentComputers, computer) then
            table.insert(validComputers, computer)
        end
    end

    if #validComputers == 0 then
        -- Se todos foram usados recentemente, reseta a lista para permitir repetir
        recentComputers = {}
        validComputers = computerModels
    end

    local randomIndex = math.random(1, #validComputers)
    return validComputers[randomIndex]
end

-- Botão na aba Exploit (t4) para teleportar para PC aleatório
t4:CreateButton({
    Name = "TP to random PC",
    Callback = function()
        local playerLocal = game.Players.LocalPlayer
        local characterLocal = playerLocal.Character or playerLocal.CharacterAdded:Wait()
        local rootPart = characterLocal:WaitForChild("HumanoidRootPart")

        local chosenComputer = getRandomComputer()

        if chosenComputer and chosenComputer.PrimaryPart then
            local targetPos = chosenComputer.PrimaryPart.Position + Vector3.new(0, 5, 0)
            rootPart.CFrame = CFrame.new(targetPos)

            table.insert(recentComputers, chosenComputer)
            if #recentComputers > 3 then
                table.remove(recentComputers, 1)
            end
        else
            Rayfield:Notify({
                Title = "TP to PC",
                Content = "No computers found to teleport!",
                Duration = 4,
                Image = "error",
            })
        end
    end,
})

t4:CreateButton({
    Name = "Anti PC Error",
    Callback = function()
        _G.AutomaticHackingEnabled = not _G.AutomaticHackingEnabled

        Rayfield:Notify({
            Title = "Anti-PC-Error",
            Content = _G.AutomaticHackingEnabled and "Enabled." or "Disabled.",
            Duration = 6.5,
            Image = 4483362458,
        })

        if _G.AutomaticHackingEnabled then
            spawn(function()
                while _G.AutomaticHackingEnabled do
                    wait(0.25)
                    local args = {
                        "SetPlayerMinigameResult",
                        true
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
            end)
        end
    end,
})

t4:CreateButton({
   Name = "TP to random Exit",
   Callback = function()
        local exitDoorModels = findAllModelsByName(game.Workspace, "ExitDoor")

        if #exitDoorModels > 0 then
            local randomIndex = math.random(1, #exitDoorModels)
            local exitDoor = exitDoorModels[randomIndex]

            local playerLocal = game.Players.LocalPlayer
            local characterLocal = playerLocal.Character or playerLocal.CharacterAdded:Wait()
            local rootPart = characterLocal:WaitForChild("HumanoidRootPart")

            local pivotCFrame = exitDoor:GetPivot()
            local behindDoorCFrame = pivotCFrame * CFrame.new(0, 0, -5)
            rootPart.CFrame = behindDoorCFrame
        end
   end,
})
t4:CreateSection("Others")
t4:CreateButton({
   Name = "Remote audio control",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/3dWP6BW4"))()
   end,
})              -- se não tiver PrimaryPart, tenta MoveTo mesmo assim
                charLocal:MoveTo(spawnPad.Position)
            end
        else
            Rayfield:Notify({
                Title = "TP To Map",
                Content = "OBSpawnPad não encontrado.",
                Duration = 4,
                Image = "error",
            })
        end
   end,
})

-- Função recursiva para encontrar todos os modelos com um dado nome
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

-- Lista para evitar repetir computadores recentes
local recentComputers = {}

-- Função que retorna um computador aleatório diferente dos recentes
local function getRandomComputer()
    local computerModels = findAllModelsByName(workspace, "ComputerTable")
    if #computerModels == 0 then
        return nil
    end

    local validComputers = {}
    for _, computer in pairs(computerModels) do
        if not table.find(recentComputers, computer) then
            table.insert(validComputers, computer)
        end
    end

    if #validComputers == 0 then
        -- Se todos foram usados recentemente, reseta a lista para permitir repetir
        recentComputers = {}
        validComputers = computerModels
    end

    local randomIndex = math.random(1, #validComputers)
    return validComputers[randomIndex]
end

-- Botão na aba Exploit (t4) para teleportar para PC aleatório
t4:CreateButton({
    Name = "TP to random PC",
    Callback = function()
        local playerLocal = game.Players.LocalPlayer
        local characterLocal = playerLocal.Character or playerLocal.CharacterAdded:Wait()
        local rootPart = characterLocal:WaitForChild("HumanoidRootPart")

        local chosenComputer = getRandomComputer()

        if chosenComputer and chosenComputer.PrimaryPart then
            local targetPos = chosenComputer.PrimaryPart.Position + Vector3.new(0, 5, 0)
            rootPart.CFrame = CFrame.new(targetPos)

            table.insert(recentComputers, chosenComputer)
            if #recentComputers > 3 then
                table.remove(recentComputers, 1)
            end
        else
            Rayfield:Notify({
                Title = "TP to PC",
                Content = "No computers found to teleport!",
                Duration = 4,
                Image = "error",
            })
        end
    end,
})

t4:CreateButton({
    Name = "Anti PC Error",
    Callback = function()
        _G.AutomaticHackingEnabled = not _G.AutomaticHackingEnabled

        Rayfield:Notify({
            Title = "Anti-PC-Error",
            Content = _G.AutomaticHackingEnabled and "Enabled." or "Disabled.",
            Duration = 6.5,
            Image = 4483362458,
        })

        if _G.AutomaticHackingEnabled then
            spawn(function()
                while _G.AutomaticHackingEnabled do
                    wait(0.25)
                    local args = {
                        "SetPlayerMinigameResult",
                        true
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
            end)
        end
    end,
})

t4:CreateButton({
   Name = "TP to random Exit",
   Callback = function()
        local exitDoorModels = findAllModelsByName(game.Workspace, "ExitDoor")

        if #exitDoorModels > 0 then
            local randomIndex = math.random(1, #exitDoorModels)
            local exitDoor = exitDoorModels[randomIndex]

            local playerLocal = game.Players.LocalPlayer
            local characterLocal = playerLocal.Character or playerLocal.CharacterAdded:Wait()
            local rootPart = characterLocal:WaitForChild("HumanoidRootPart")

            local pivotCFrame = exitDoor:GetPivot()
            local behindDoorCFrame = pivotCFrame * CFrame.new(0, 0, -5)
            rootPart.CFrame = behindDoorCFrame
        end
   end,
})
t4:CreateSection("Others")
t4:CreateButton({
   Name = "Remote audio control",
   Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/3dWP6BW4"))()
   end,
})eateSection("Teleports")
t4:CreateButton({
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
-- Função recursiva para encontrar todos os modelos com um dado nome
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

-- Lista para evitar repetir computadores recentes
local recentComputers = {}

-- Função que retorna um computador aleatório diferente dos recentes
local function getRandomComputer()
    local computerModels = findAllModelsByName(workspace, "ComputerTable")
    if #computerModels == 0 then
        return nil
    end

    local validComputers = {}
    for _, computer in pairs(computerModels) do
        if not table.find(recentComputers, computer) then
            table.insert(validComputers, computer)
        end
    end

    if #validComputers == 0 then
        -- Se todos foram usados recentemente, reseta a lista para permitir repetir
        recentComputers = {}
        validComputers = computerModels
    end

    local randomIndex = math.random(1, #validComputers)
    return validComputers[randomIndex]
end

-- Botão na aba Exploit (t4) para teleportar para PC aleatório
t4:CreateButton({
    Name = "TP to random PC",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")

        local chosenComputer = getRandomComputer()

        if chosenComputer and chosenComputer.PrimaryPart then
            local targetPos = chosenComputer.PrimaryPart.Position + Vector3.new(0, 5, 0)
            rootPart.CFrame = CFrame.new(targetPos)

            table.insert(recentComputers, chosenComputer)
            if #recentComputers > 3 then
                table.remove(recentComputers, 1)
            end
        else
            Rayfield:Notify({
                Title = "TP to PC",
                Content = "No computers found to teleport!",
                Duration = 4,
                Image = "error",
            })
        end
    end,
})

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
t4:CreateButton({
    Name = "Anti PC Error",
    Callback = function()
        _G.AutomaticHackingEnabled = not _G.AutomaticHackingEnabled

        Rayfield:Notify({
            Title = "Anti-PC-Error",
            Content = _G.AutomaticHackingEnabled and "Enabled." or "Disabled.",
            Duration = 6.5,
            Image = 4483362458,
        })

        if _G.AutomaticHackingEnabled then
            spawn(function()
                while _G.AutomaticHackingEnabled do
                    wait(0.25)
                    local args = {
                        "SetPlayerMinigameResult",
                        true
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
            end)
        end
    end,
})

t4:CreateButton({
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
t4:CreateSection("Others")
t4:CreateButton({
   Name = "Remote audio control",
   Callback = function()
			loadstring(game:HttpGet("https://pastebin.com/raw/3dWP6BW4"))()
   end,
})
