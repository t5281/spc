local exec = identifyexecutor()
local version = "v0.3"

local detectedAdmins = {}

local Decimals = 4
local Clock = os.clock()

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/3ws4ed5f/spec/refs/heads/main/lib-main"))({
    cheatname = "Specter.vip",
    gamename = "Project Delta",
})

_G.Loading = true
library:init()

local allowed_keys = { "lDZutGiZoGCyrUPYnmXYLJlFDsZuxyDq", "WVAnPrhZKZfDhrLzSqhMswGodsOiDHOY", "jgQEnMvXXuKyRCqyIxarUkFzucMwSJpS" }

local function is_key_allowed(script_key)
    for _, key in ipairs(allowed_keys) do
        if key == script_key then
            return true
        end
    end
    return false
end

local privatevar = is_key_allowed(script_key)

local windowTitle = "Specter.vip - " .. (privatevar and "Private " or "") .. version

local Window1 = library.NewWindow({
    title = windowTitle,
    size = UDim2.new(0, 710, 0.73, 5.2)
})

local combat = Window1:AddTab('Combat')
local playerstab = Window1:AddTab("Player")
local visualstab = Window1:AddTab("Visuals")
local other = Window1:AddTab("Misc")
local settings = library:CreateSettingsTab(Window1)

if game.Players.LocalPlayer.Character == nil or not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
    library:SendNotification(("Character is missing, script will load when spawned in"), 10)
    
    while game.Players.LocalPlayer.Character == nil or not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") do
        wait(0.2)
    end
end

wait(0.5)

local libraryxxt = pcall(function()
    local drawing199 = Drawing.new("Square")
    drawing199.Visible = false
    drawing199:Destroy()
end)

if libraryxxt == false then
    library:SendNotification(("DL-F"), 0.6)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/3ws4ed5f/spec/refs/heads/main/lib-drawing"))()
    library:SendNotification(("DL-T"), 0.3)
end

if string.match(exec, "Wave") == nil and string.match(exec, "Synapse") == nil and string.match(exec, "Seliware") == nil  and string.match(exec, "Nihon") == nil and string.match(exec, "AWP") == nil and string.match(exec, "Swift") == nil and string.match(exec, "Velocity") == nil and string.match(exec, "SirHurt") == nil and string.match(exec, "Atlantis") == nil then
    library:SendNotification((exec .. "is not supported"), 10)
    return
else
    library:SendNotification(("Loading Assets " .. version .. " - " .. exec), 4)
    print("[[ Specter.vip || " .. exec .." || " .. version .. " ]]")
end
--[[
if exec == "Seliware" or exec == "Nihon" then
    library:SendNotification((exec .. " is semi-supported, script might cause errors."), 3.5)
end
]]
if _G.exothiumxyz then
    library:SendNotification(("Script is already loaded, therefore you cant execute it again"), 3.5)
    return
end

_G.exothiumxyz = true

local wcamera = workspace.CurrentCamera
local Players = game:GetService("Players")
local localplayer = game.Players.LocalPlayer
local character = localplayer.Character or localplayer.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
local runs = game:GetService("RunService")
local rp = game:GetService("ReplicatedStorage")
local aiZones = workspace:FindFirstChild("AiZones")
local stg = localplayer:WaitForChild("PlayerGui")
local sg = stg:FindFirstChild("Specter.vip") or Instance.new("ScreenGui", stg); sg.Name = "Specter.vip"; sg.IgnoreGuiInset = true ;sg.ResetOnSpawn = false
local uis = game:GetService("UserInputService")
local lighting = game:GetService("Lighting")
local realAmmoTypes = lighting:FindFirstChild("AmmoTypes") or rp:FindFirstChild("AmmoTypes") and rp:FindFirstChild("AmmoTypes"):Clone()
if realAmmoTypes then realAmmoTypes.Name = "AmmoTypes" end

local tcs = game:GetService("TextChatService")
local chat = nil

if tcs then
    local chatInputBarConfig = tcs:FindFirstChild("ChatInputBarConfiguration")
    if chatInputBarConfig then
        chat = chatInputBarConfig:FindFirstChild("TargetTextChannel")
    end
end

local mouse = localplayer:GetMouse()
local TempArmor = Instance.new("Folder"); TempArmor.Name = "TempArmor"; TempArmor.Parent = game.Lighting

local aimbool = false
local aimdebug1 = false
local aimdebug2 = false
local aimdebug3 = false
local aimbots = false
local aimvischeck = false
local aimdistcheck = false
local aimbang = true
local aimtrigger = false
local hillwallbang = false
local aiminfrange = false
local aimtarget = nil
local aimtargetpart = nil
local aimdynamicfov = false
local aimpart = "Head"
local aimtype = "Silent Aim"
local aimfov = 150
local aimdistance = 1100
local aimchance = 100
local aimfakewait = 0
local aimsnapline = Drawing.new("Line")
local snaplinebool = false
local aimfovcircle = Drawing.new("Circle")
local aimtargetname = Drawing.new("Text")
local aimogfunc = require(game.ReplicatedStorage.Modules.FPS.Bullet).CreateBullet
local aimmodfunc
local aimignoreparts = {}
for i,v in ipairs(workspace:GetDescendants()) do
    if v:GetAttribute("PassThrough") then
        table.insert(aimignoreparts, v)
    end
end

peekkillheight = 30
timeout = 0.3

local aimFRIENDLIST = {}
local friendlistmode = "Blacklist"
local friendlistbots = false

local esptextcolor = Color3.fromRGB(159, 99, 254)
local esptable = {}

healthtargetname = false
admintargetname = false

espbool = false
esptogglebind = Enum.KeyCode.Home

espname = false
espnamecolor = Color3.fromRGB(159, 99, 254)

esphp = false
esphpcolor = Color3.fromRGB(159, 99, 254)

espdistance = false
espdistcolor = Color3.fromRGB(159, 99, 254)

esphotbar = false
esphotbarcolor = Color3.fromRGB(159, 99, 254)

espbots = false
esphigh = false
espskelet = false
espdead = false

esploot = false
espexit = false
esptextline = false
esprenderdist = 1800
espchamsfill = 1
espchamsline = 0
occludedchams = false
thermalchams = false
thermspeed = 0.008
esptextsize = 17
espfillcolor = Color3.fromRGB(159, 99, 254)
esplinecolor = Color3.fromRGB(159, 99, 254)

local a1table

inventoryCheckerToggle = false
inventorygradient1 = Color3.fromRGB(159, 99, 254)
accentcolor = Color3.fromRGB(159, 99, 254)
inventorygradient2 = Color3.fromRGB(159, 99, 254)
inventorymaintextcolor = Color3.fromRGB(159, 99, 254)
ammotextcolor = Color3.fromRGB(159, 99, 254)

moddetectorvolume = 4
stafflabelcolor = Color3.fromRGB(159, 99, 254)
stafflinecolor = Color3.fromRGB(159, 99, 254)
stafftitlecolor = Color3.fromRGB(159, 99, 254)

tracbool = false
tracwait = 1
traccolor = Color3.fromRGB(159, 99, 254)
tracertexture = nil
local tracertextures = {
    ["None"] = nil,
    ["Neon"] = "http://www.roblox.com/asset/?id=71799812889976",
    ["Lightning"] = "http://www.roblox.com/asset/?id=118249217749149",
    ["Wide"] = "http://www.roblox.com/asset/?id=75056325012653"
}

local crosshair = Drawing.new("Circle")

local defaultfirerate = {}

local createdThings = {}

local viewmod_materials = {
    ["Forcefield"] = Enum.Material.ForceField,
    ["Neon"] = Enum.Material.Neon,
    ["Plastic"] = Enum.Material.SmoothPlastic
}
viewmodbool = false
viewmodhandmat = Enum.Material.ForceField
viewmodgunmat = Enum.Material.ForceField
viewmodhandcolor = Color3.fromRGB(159, 99, 254)
viewmodguncolor = Color3.fromRGB(159, 99, 254)
viewmodX = 0.2
viewmodY = -2
viewmodZ = -0.32

viewmodhighlightchams = false

viewmodhighlightfillcolor = Color3.fromRGB(159, 99, 254)
viewmodhighlightoutlinecolor = Color3.fromRGB(159, 99, 254)

viewmodhighlightfilltransparency = 1
viewmodhighlightoutlinetransparency = 0

modifycharchams = false
charchamsmaterial = Enum.Material.ForceField
charchamscolor = Color3.fromRGB(159, 99, 254)
removeClothes = false
storedProperties = {}
storedSurfaceAppearances = {}

animpos = 0.82
underground = -2.6
undergroundcharrotX = 45
undergroundcharrotZ = 0

local FullUnderToggle = false
local keybindgf = Enum.KeyCode.K

local animatioffn = Instance.new("Animation")
animatioffn.AnimationId = "rbxassetid://17360699557" -- new17360699557 | old10714003221

local speedbool = false
local speedboost = 1.2

local changerbool = false
local changergrav = 95
local changerspeed = 18
local changerheight = 2
local changerjump = 4

local charsemiflybind = Enum.KeyCode.X
local charsemifly = false
local charsemiflydist = 6
local charsemiflydistunlock = false
local charsemiflyspeed = 18
local semifly_bodyvel = nil

bunnyhop = false

worldleaves = false

worldclockmodifier = false
worldclock = 0; worldclock = game:GetService("Lighting").TimeOfDay

local waterplatforms = Instance.new("Folder", workspace)
waterplatforms.Name = "WaterPlatforms"
local worldjesus

atmosphere = game.Lighting:FindFirstChild("Atmosphere")
originalDensity = atmosphere and atmosphere.Density
originalOffset = atmosphere and atmosphere.Offset

worldvisualstoggle = false
worldambient = Color3.fromRGB(255,255,255)
worldoutdoor = Color3.fromRGB(255,255,255)

charantiaim_underground = false
fallanim = false

flipback = false

upangletoggle = false
upangleY = 0 -- 0.03070496954023838

xspeedspin = 0
xspinning = false -- xrot spin

yspeedspin = 0
yspinning = false -- yrot spin

zspeedspin = 0
zspinning = false -- zrot spin

xrot = 0
yrot = 0
zrot = 0

--animresolver = false
upangleresolver = false
resolverangle = 0

local hitmarkbool = false
local hitmarkcolor = Color3.fromRGB(159, 99, 254)
local hitmarkfade = 2
local hitmarktexture = "Cross"

local hitsoundbool = false
local hitsoundhead = "Neverlose"
local hitsoundbody = "Gamesense"
local hitsoundlib = {
    ["Neverlose"] = "rbxassetid://8726881116",
    ["Gamesense"] = "rbxassetid://4817809188",
    ["Rust"]      = "rbxassetid://1255040462",
    ["Bubble"]    = "rbxassetid://198598793",
    ["Minecraft"] = "rbxassetid://6361963422",
    ["Among-Us"]  = "rbxassetid://7227567562",
}
local hitsoundlibUI = {}
for i,v in hitsoundlib do
    hitsoundlibUI[v] = i
end

NoRecoil = false
BulletTracer = false
InstaReload = true
GunDrag = false
NoProjectileDrop = false
RapidFire = false
NoSway = false
InstaEquip = false
UnlockFiremodes = false
InstantBullet = false
multitaps = 1
local instrelOGfunc = require(game.ReplicatedStorage.Modules.FPS).reload
local instrelMODfunc

camthirdp = false

camthirdpX = 0
camthirdpY = 1.5
camthirdpZ = -3

AntiDrown = false
AntiProjectile = true

NoFallDamage = false
transparencyToggle = false
falldmgcolor = Color3.fromRGB(159, 99, 254)

trailenabled = false
traillifetime = 0.2
trailmaterial = "ForceField"
trailcolor = Color3.fromRGB(159, 99, 254)

local valcache = {
    ["7.62x54AP"] = 1,
}

--drawing setup--

aimfovcircle.Visible = false
aimfovcircle.Radius = aimfov
aimfovcircle.Thickness = 1
aimfovcircle.Filled = false
aimfovcircle.Transparency = 1
aimfovcircle.Color = Color3.fromRGB(159, 99, 254)
aimfovcircle.Position = Vector2.new(wcamera.ViewportSize.X / 2, wcamera.ViewportSize.Y / 2)
crosshair.Visible = false
crosshair.Radius = 2
crosshair.Thickness = 1
crosshair.Filled = true
crosshair.Transparency = 1
crosshair.Color = Color3.fromRGB(159, 99, 254)
crosshair.Position = Vector2.new(wcamera.ViewportSize.X / 2, wcamera.ViewportSize.Y / 2)
aimtargetname.Text = " "
aimtargetname.Position = Vector2.new(wcamera.ViewportSize.X / 2, wcamera.ViewportSize.Y / 2 + aimfov + 20) 
aimtargetname.Size = 20
aimtargetname.Color = Color3.fromRGB(159, 99, 254)
aimtargetname.Visible = false
aimtargetname.Center = true
aimtargetname.Outline = true
aimsnapline.From = Vector2.new(20, 20)
aimsnapline.To = Vector2.new(50, 50)
aimsnapline.Color = Color3.fromRGB(159, 99, 254)
aimsnapline.Thickness = 1
aimsnapline.Visible = false

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    local Args = {...}

    if Method == "FireServer" and self.Name == "Drowning" and AntiDrown then
        return
    end

    if Method == "FireServer" and self.Name == "ProjectileInflict" and AntiProjectile then
        if Args[1] == game.Players.LocalPlayer.Character.HumanoidRootPart then
            return coroutine.yield()
        end
    end

    return oldNamecall(self, ...)
end)

setreadonly(mt, true)

local function TPF()
    local mt = getrawmetatable(game)
    local oldIndex = mt.__newindex
    setreadonly(mt, false)
    mt.__newindex = newcclosure(function(self, index, value)
        if tostring(self) == "Humanoid" and index == "CameraOffset" and camthirdp == true then
            return oldIndex(self, index, Vector3.new(camthirdpX, camthirdpY, camthirdpZ))
        end
        return oldIndex(self, index, value)
    end)
    setreadonly(mt, true)
end
TPF()

--combat:SetText("Text")

local aim = combat:AddSection("Aimbot", 1)
local snapline = combat:AddSection("Snapline", 1)
local killpeek = combat:AddSection("Peek Kill", 1)
local gunmods = combat:AddSection("Gun Manipulation", 2)
local tarinfo = combat:AddSection("Target Info", 2)
local resolver = combat:AddSection("Resolver", 2)

local semifly = playerstab:AddSection("Character Mods", 1)
local privatefeatures = playerstab:AddSection("Player Exploits", 2)

local wh = visualstab:AddSection("Extra-Sensory Perception", 1)
local viewmod = visualstab:AddSection("Viewmodel", 1)

local effects = visualstab:AddSection("Effects", 2)
local cross = visualstab:AddSection("Crosshair", 2)
local worldh = visualstab:AddSection("World", 2)
local characterchams = visualstab:AddSection("Character Chams", 2)

local inventorychecker = other:AddSection("Hotbar Checker", 1)
local modchecker = other:AddSection("Staff Related", 1)

local camzoom = other:AddSection("Zoom", 2)
local camer = other:AddSection("Effects", 2)
local hitsounds = other:AddSection("Hitsounds", 2)
local extrafeatures = other:AddSection("Extra Features", 2)

--aim:SetText("Text")

local function RemoveClothes()
    for _, v in pairs(character:GetDescendants()) do
        if v:GetAttribute("ItemType") == "Shirt" or v:GetAttribute("ItemType") == "Backpack" or v:GetAttribute("ItemType") == "Pants" or v:GetAttribute("ItemType") == "ChestRig" or v:GetAttribute("ItemType") == "Headware" then
            v.Parent = TempArmor
        end
    end
end

local function RestoreClothes()
    for _, v in pairs(TempArmor:GetChildren()) do
        v.Parent = character
    end
end

local function MonitorClothes()
    character.DescendantAdded:Connect(function(child)
        if child:GetAttribute("ItemType") == "Shirt" or child:GetAttribute("ItemType") == "Backpack" or child:GetAttribute("ItemType") == "Pants" or child:GetAttribute("ItemType") == "ChestRig" or child:GetAttribute("ItemType") == "Headware" then
            if removeClothes then
                child.Parent = TempArmor
            end
        end
    end)
end

local function EnsureNoItemsOnPlayer()
    for _, v in pairs(character:GetDescendants()) do
        if v:GetAttribute("ItemType") == "Shirt" or v:GetAttribute("ItemType") == "Backpack" or v:GetAttribute("ItemType") == "Pants" or v:GetAttribute("ItemType") == "ChestRig" or v:GetAttribute("ItemType") == "Headware" then
            if v.Parent ~= TempArmor then
                v.Parent = TempArmor
            end
        end
    end
end

MonitorClothes()

characterchams:AddToggle({
    text = "Remove Clothes",
    state = false,
    tooltip = "Removes player clothing",
    flag = "RemoveClothes",
    callback = function(v)
    removeClothes = v
    if removeClothes then
        RemoveClothes()
        EnsureNoItemsOnPlayer()
    else
        RestoreClothes()
    end
    end
})

local function applyChams()
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            if not storedProperties[part] then
                storedProperties[part] = {
                    Material = part.Material,
                    Color = part.Color
                }
            end
            part.Material = charchamsmaterial
            part.Color = charchamscolor
        elseif part:IsA("SurfaceAppearance") then
            storedSurfaceAppearances[part] = part.Parent
            part.Parent = nil
        end
    end
end

local function removeChams()
    for part, properties in pairs(storedProperties) do
        if part and part.Parent then
            part.Material = properties.Material
            part.Color = properties.Color
        end
    end
    storedProperties = {}
    for surface, parent in pairs(storedSurfaceAppearances) do
        if surface and parent then
            surface.Parent = parent
        end
    end
    storedSurfaceAppearances = {}
end

local function updateChams()
    if modifycharchams then
        applyChams()
    else
        removeChams()
    end
end

characterchams:AddToggle({
    text = "Character Chams",
    state = false,
    tooltip = "Enables/Disables Character Chams",
    flag = "VisualizeCharacter",
    callback = function(v)
        modifycharchams = v
        updateChams()

        if _G.LoadingConfig and modifycharchams then
            task.spawn(function()
                task.wait(0.3)
                updateChams()
            end)
        end
    end
}):AddColor({
    enabled = true,
    text = "Character Chams Color",
    tooltip = "Character Chams Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "VisualizeCharacterColor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        charchamscolor = v
    end
})

characterchams:AddList({
    enabled = true,
    text = "Character Chams Material", 
    tooltip = "Character Chams Material",
    selected = "ForceField",
    flag = "VisualizeCharacterMaterial",
    multi = false,
    open = false,
    max = 4,
    values = {"ForceField", "SmoothPlastic"},
    risky = false,
    callback = function(v)
        charchamsmaterial = Enum.Material[v]
    end
})

extrafeatures:AddButton({
    enabled = true,
    text = "Unlock Boss",
    tooltip = "Unlocks the Boss NPC",
    confirm = false,
    risky = false,
    callback = function()
            local npc = game.Workspace.Boss
    npc:SetAttribute("Hidden", false)

    for _, part in pairs(npc:GetChildren()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.Transparency = 0
        end
    end
    end
})

extrafeatures:AddButton({
    enabled = true,
    text = "Spawn UAZ",
    tooltip = "Spawns a vehicle next to you",
    confirm = false,
    risky = false,
    callback = function()
        local player = game.Players.LocalPlayer
local plr = player

if not plr.Character or not plr.Character:FindFirstChildOfClass("Humanoid") then 
    return library:SendNotification(("Error: No character detected."), 3)
end

local uaz, dist = nil, math.huge
for i, v in pairs(workspace:WaitForChild("Vehicles"):GetChildren()) do
    if v:FindFirstChild("Body") and v.Body:FindFirstChildOfClass("MeshPart") then
        local vehiclePos = v.Body:FindFirstChildOfClass("MeshPart").Position
        local camPos = workspace.CurrentCamera.CFrame.p
        local distance = (vehiclePos - camPos).Magnitude
        if dist > distance then
            dist = distance
            uaz = v
        end
    end
end

if not uaz then 
    return library:SendNotification(("Error: No car found."), 8)
end

local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
if humanoid then
    for i, v in ipairs(uaz:GetDescendants()) do
        if v:IsA('Seat') and v.Name == 'SeatFR' then
            v:Sit(humanoid)
        end
    end
end

wait(0.2)

for i = 1, 2 do
    game:GetService("ReplicatedStorage").Remotes.VehicleInteractions:FireServer({
        ["Vehicle"] = uaz,
        ["Action"] = "Enter",
        ["Door"] = uaz.Body.FRdoor.FR_Door
    })
    wait(0.2)
end

uaz.Remotes.ExitSeat:FireServer()
wait(0.1)

game:GetService("ReplicatedStorage").Remotes.VehicleInteractions:FireServer({
    ["Vehicle"] = uaz,
    ["Action"] = "Exit",
    ["Door"] = uaz.Body.FRdoor.FR_Door
})

uaz.Remotes.ExitSeat:FireServer()
wait(1)

player.Character:FindFirstChildOfClass('Humanoid'):Move(Vector3.new(0, 10, 0))
library:SendNotification(("Spawned UAZ."), 5)

    end
})

extrafeatures:AddButton({
    enabled = true,
    text = "Quick Use",
    tooltip = "Fires a remote event that uses your currently held item without the animation or noise.",
    confirm = false,
    risky = false,
    callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Consume"):FireServer()
    end
})

extrafeatures:AddButton({
    enabled = true,
    text = "Reset",
    tooltip = "Resets your character",
    confirm = true,
    risky = false,
    callback = function()
        game.Players.LocalPlayer.Character.Health.Drowning:FireServer(101)
    end
})

aim:AddToggle({
    text = "Silent Aim",
    state = false,
    risky = true,
    tooltip = "Enables Silent Aim",
    flag = "SilentAim",
    callback = function(v)
        aimbool = v
        if v == true then
            require(game.ReplicatedStorage.Modules.FPS.Bullet).CreateBullet = aimmodfunc
        else
            require(game.ReplicatedStorage.Modules.FPS.Bullet).CreateBullet = aimogfunc
        end
    end
}):AddBind({
    enabled = true,
    text = "Silent Aim",
    tooltip = "Silent Aim Keybind",
    mode = "toggle",
    bind = "None",
    flag = "SilentAimBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        aimbool = v
        if v == true then
            require(game.ReplicatedStorage.Modules.FPS.Bullet).CreateBullet = aimmodfunc
        else
            require(game.ReplicatedStorage.Modules.FPS.Bullet).CreateBullet = aimogfunc
        end
    end,
    keycallback = function(v)
        aimbool = v
        if v == true then
            require(game.ReplicatedStorage.Modules.FPS.Bullet).CreateBullet = aimmodfunc
        else
            require(game.ReplicatedStorage.Modules.FPS.Bullet).CreateBullet = aimogfunc
        end
    end
})
aim:AddToggle({
    text = "Include NPCs",
    flag = "TargetAI",
    callback = function(v)
        aimbots = v
    end
})
aim:AddToggle({
    text = "Wall Check",
    flag = "WallCheck",
    callback = function(v)
        aimvischeck = v
    end
}):AddBind({
    enabled = true,
    text = "Wall Check",
    mode = "toggle",
    bind = "None",
    flag = "WallCheckBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        aimvischeck = v
    end,
    keycallback = function(v)

    end
})

aim:AddToggle({
    text = "Auto Shoot",
    flag = "AutoShoot",
    risky = true,
    callback = function(v)
        aimtrigger = v
    end
}):AddBind({
    enabled = true,
    text = "Auto Shoot",
    mode = "toggle",
    bind = "None",
    flag = "AutoShootBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        aimtrigger = v
    end,
    keycallback = function(v)

    end
})

if privatevar then
resolver:AddToggle({
    text = "Underground Resolver",
    flag = "UndergroundResolver",
    tooltip = "Forces your character lower than the ground level and automatically fires, use with wall check and do not use Auto Shoot.",
    risky = true,
    callback = function(v)
        hillwallbang = v
    end
}):AddBind({
    enabled = true,
    text = "Underground Resolver",
    mode = "toggle",
    bind = "None",
    flag = "UndergroundResolverBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        hillwallbang = v
    end,
    keycallback = function(v)

    end
})

resolver:AddSeparator({
    enabled = true,
    text = ""
})
end
--[[
aim:AddToggle({
    text = "Animation Resolver",
    flag = "AnimResolver",
    risky = true,
    callback = function(v)
        animresolver = v
    end
})
]]

aim:AddList({
    enabled = true,
    text = "Hitbox", 
    tooltip = "Aimbot Hitbox",
    selected = "Head",
    flag = "Hitbox",
    multi = false,
    open = false,
    max = 4,
    values = {"Head", "HeadTop", "Face", "Upper Body", "Upper Torso", "Lower Torso", "Legs", "Random"},
    risky = false,
    callback = function(v)
        aimpart = v
    end
})

aim:AddList({
    enabled = true,
    text = "Method", 
    tooltip = "Aim Method",
    selected = "Silent Aim",
    flag = "AimbotMethod",
    multi = false,
    open = false,
    max = 4,
    values = {"Silent Aim", "Prediction"},
    risky = false,
    callback = function(v)
        aimtype = v
    end
})

--[[aim:AddBox({
    enabled = true,
    name = "TextBox1",
    flag = "TextBox_1",
    input = "PlaceHolder1",
    focused = false,
    risky = false,
    callback = function(v)
        print(v)
    end
})--]]

--[[aim:AddToggle({
    text = "Toggle1",
    flag = "Toggle_1",
    callback = function(v)
        print(ValueText, v)
    end
}):AddColor({
    text = "Color1",
    color = Color3.fromRGB(255, 255, 255),
    flag = "Color_1",
    callback = function(v)
        print(ValueText, v)
    end
})--]]

--[[aim:AddBind({
    enabled = true,
    text = "Keybind1",
    tooltip = "tooltip1",
    mode = "toggle",
    bind = "None",
    flag = "ToggleKey_1",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        print(ValueText, v)
    end,
    keycallback = function(v)
        print(ValueText, v)
    end
})--]]

aim:AddSeparator({
    enabled = true,
    text = "Visual"
})

--[[aim:AddButton({
    enabled = true,
    text = "Button1",
    tooltip = "tooltip1",
    confirm = true,
    risky = false,
    callback = function()
        print("Pressed!")
    end
})--]]

-- Button1:SetText("Text")
aim:AddToggle({
    text = "FOV Visible",
    flag = "VisualizeFOV",
    callback = function(v)
        aimfovcircle.Visible = v
    end
})
aim:AddToggle({
    text = "Dynamic FOV",
    flag = "DynamicFOV",
    callback = function(v)
        aimdynamicfov = v
    end
}):AddColor({
    enabled = true,
    text = "FOV Color",
    tooltip = "FOV Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "FOVColor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        aimfovcircle.Color = v
    end
})
aim:AddSlider({
    enabled = true,
    text = "FOV Radius",
    tooltip = "FOV Radius",
    flag = "FOVRadius",
    suffix = "",
    dragging = true,
    focused = false,
    min = 10,
    max = 350,
    increment = 1,
    risky = false,
    callback = function(v)
        aimfov = v
    end
}):SetValue(150)

killpeek:AddToggle({
    text = "Peek Kill",
    flag = "PeekKill",
    risky = true,
    callback = function(v)
        
    end
}):AddBind({
    enabled = true,
    text = "Peek Kill",
    mode = "toggle",
    bind = "None",
    flag = "PeekKillBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        if _G.LoadingConfig == true then return end; if _G.Loading == true then return end
        local originalCFrame = humanoidRootPart.CFrame
        task.wait(0.02)
        humanoidRootPart.CFrame = originalCFrame + Vector3.new(0, peekkillheight, 0)
        task.wait(timeout)
        humanoidRootPart.CFrame = originalCFrame
    end,
    keycallback = function(v)

    end
})

killpeek:AddSlider({ 
    enabled = true,
    text = "Peek Kill Height", 
    tooltip = "Peek Kill Height", 
    flag = "PeekKillStuds", 
    suffix = " studs",
    dragging = true,
    focused = false,
    min = 1, 
    max = 100, 
    increment = 1,
    risky = false,
    callback = function(v)
        peekkillheight = v 
    end
}):SetValue(30)

resolver:AddToggle({
    text = "UpAngle Resolver",
    tooltip = "Forces other players UpAngle",
    flag = "UpAngleResolver",
    callback = function(v)
        upangleresolver = v
    end
}):AddBind({
    enabled = true,
    text = "UpAngle Resolver",
    mode = "toggle",
    bind = "None",
    flag = "UpAngleResolverBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        upangleresolver = v
    end,
    keycallback = function(v)

    end
})

resolver:AddSlider({
    enabled = true,
    text = "Angle",
    tooltip = "Angle",
    flag = "ResolverUpAngleValue",
    dragging = true,
    suffix = "°",
    focused = false,
    min = -2,
    max = 2,
    increment = 0.01,
    callback = function(v)
        resolverangle = v
    end
})

gunmods:AddToggle({
    text = "Rapid Fire",
    flag = "RapidFire",
    risky = true,
    callback = function(v)
            RapidFire = v
    if v == true then
        local inv = game.ReplicatedStorage.Players:FindFirstChild(localplayer.Name).Inventory
        for i,v in ipairs(inv:GetChildren()) do
            local sett = require(v.SettingsModule)
            sett.FireRate = 0.002
        end
    else
        local inv = game.ReplicatedStorage.Players:FindFirstChild(localplayer.Name).Inventory
        for i,v in ipairs(inv:GetChildren()) do
            local sett = require(v.SettingsModule)
            local toset = 0.05
            toset = 60 / v.ItemProperties.Tool:GetAttribute("FireRate")
            sett.FireRate = toset
        end
    end
    end
})

gunmods:AddToggle({
    text = "Instant Bullet",
    flag = "InstantBullet",
    risky = true,
    callback = function(v)
        	InstantBullet = v
	if InstantBullet and rp:FindFirstChild("AmmoTypes") then
		for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
			if v then
				v:SetAttribute("MuzzleVelocity", 300000)
			end
		end
	elseif not InstantBullet and rp:FindFirstChild("AmmoTypes") then
		for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
			if v then
				local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
				if realAmmo then
					v:SetAttribute("MuzzleVelocity", realAmmo:GetAttribute("MuzzleVelocity"))
				end
			end
		end
	end
    end
})

gunmods:AddToggle({
    text = "Unlock Firemodes",
    flag = "UnlockFiremodes",
    callback = function(v)
        UnlockFiremodes = v
    end
})

gunmods:AddToggle({
    text = "Instant Equip",
    flag = "InstantEquip",
    callback = function(v)
        InstaEquip = v
    end
})

gunmods:AddToggle({
    text = "Wallbang",
    flag = "Wallbang",
    callback = function(v)
        aimbang = v
    end
})

gunmods:AddToggle({
    text = "No Recoil",
    flag = "NoRecoil",
    callback = function(v)
        			NoRecoil = v
			if NoRecoil and rp:FindFirstChild("AmmoTypes") then
				for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
					if v then
						v:SetAttribute("RecoilStrength", 0)
					end
				end
			elseif not NoRecoil and rp:FindFirstChild("AmmoTypes") then
				for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
					if v then
						local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
						if realAmmo then
							v:SetAttribute("RecoilStrength", realAmmo:GetAttribute("RecoilStrength"))
						end
					end
				end
			end
    end
})

gunmods:AddToggle({
    text = "Instant Reload",
    flag = "InstantReload",
    callback = function(v)
    if v then 
        require(game.ReplicatedStorage.Modules.FPS).reload = instrelMODfunc
    else
        require(game.ReplicatedStorage.Modules.FPS).reload = instrelOGfunc
    end
    end
})

local originalValues = {}

gunmods:AddToggle({
    text = "No Obstructions",
    flag = "WeaponObstructions",
    risky = false,
    callback = function(v)
        local inv = game.ReplicatedStorage.Players:FindFirstChild(localplayer.Name).Inventory
        
        for i, weapon in ipairs(inv:GetChildren()) do
            local sett = require(weapon.SettingsModule)

            if v == true then
                if not originalValues[weapon.Name] then
                    originalValues[weapon.Name] = {
                        TouchWallPosY = sett.TouchWallPosY,
                        TouchWallPosZ = sett.TouchWallPosZ,
                        TouchWallRotX = sett.TouchWallRotX,
                        TouchWallRotY = sett.TouchWallRotY
                    }
                end

                sett.TouchWallPosY = 0
                sett.TouchWallPosZ = 0
                sett.TouchWallRotX = 0
                sett.TouchWallRotY = 0
            else
                if originalValues[weapon.Name] then
                    sett.TouchWallPosY = originalValues[weapon.Name].TouchWallPosY
                    sett.TouchWallPosZ = originalValues[weapon.Name].TouchWallPosZ
                    sett.TouchWallRotX = originalValues[weapon.Name].TouchWallRotX
                    sett.TouchWallRotY = originalValues[weapon.Name].TouchWallRotY
                end
            end
        end
    end
})

gunmods:AddToggle({
    text = "No Drag",
    flag = "NoDrag",
    callback = function(v)
        	GunDrag = v
	if GunDrag and rp:FindFirstChild("AmmoTypes") then
		for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
			if v then
				v:SetAttribute("Drag", 0)
			end
		end
	elseif not GunDrag and rp:FindFirstChild("AmmoTypes") then
		for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
			if v then
				local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
				if realAmmo then
					v:SetAttribute("Drag", realAmmo:GetAttribute("Drag"))
				end
	    	end
		end
	end
    end
})

gunmods:AddToggle({
    text = "No Sway",
    flag = "NoSway",
    callback = function(v)
        NoSway = v
    end
})

gunmods:AddToggle({
    text = "No Projectile Drop",
    flag = "NoProjectileDrop",
    risky = true,
    callback = function(v)
        	NoProjectileDrop = v
	if NoProjectileDrop and rp:FindFirstChild("AmmoTypes") then
		for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
			if v then
				v:SetAttribute("ProjectileDrop", 0)
			end
		end
	elseif not NoProjectileDrop and rp:FindFirstChild("AmmoTypes") then
		for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
			if v then
				local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
				if realAmmo then
					v:SetAttribute("ProjectileDrop", realAmmo:GetAttribute("ProjectileDrop"))
				end
			end
		end
	end
    end
})

gunmods:AddToggle({
    text = "Bullet Tracer",
    flag = "BulletTracer",
    callback = function(v)
        	BulletTracer = v
	if BulletTracer and rp:FindFirstChild("AmmoTypes") then
		for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
			if v then
				v:SetAttribute("Tracer", true)
			end
		end
	elseif not BulletTracer and rp:FindFirstChild("AmmoTypes") then
		for i,v in ipairs(rp.AmmoTypes:GetChildren()) do
			if v then
				local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
				if realAmmo then
					v:SetAttribute("Tracer", realAmmo:GetAttribute("Tracer"))
				end
			end
		end
	end
    end
})

gunmods:AddSlider({
    enabled = true,
    text = "Multitaps",
    tooltip = "Shoots multiple bullets at once.",
    flag = "Multitaps",
    suffix = "",
    dragging = true,
    focused = false,
    min = 1,
    max = 100,
    increment = 1,
    risky = true,
    callback = function(v)
        multitaps = v
    end
})

tarinfo:AddToggle({
    text = "Target Name",
    flag = "TargetNameToggle",
    callback = function(v)
        aimtargetname.Visible = v
    end
})

tarinfo:AddToggle({
    text = "Health",
    flag = "TargetNameHealth",
    callback = function(v)
        healthtargetname = v
    end
})

tarinfo:AddToggle({
    text = "Admin",
    flag = "TargetNameAdmin",
    callback = function(v)
        admintargetname = v
    end
})

tarinfo:AddColor({
    enabled = true,
    text = "Target Info Theme",
    tooltip = "Target Info Theme",
    color = Color3.fromRGB(159, 99, 254),
    flag = "TargetNameThemeColor",
    trans = 0,
    open = false,
    callback = function(v)
        aimtargetname.Color = v
    end
})

snapline:AddToggle({
    text = "Snapline Enabled",
    flag = "SnaplineToggle",
    callback = function(v)
        snaplinebool = v
    end
}):AddColor({
    enabled = true,
    text = "Snapline Color",
    tooltip = "Snapline Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "SnaplineColor",
    trans = 0,
    open = false,
    callback = function(v)
        aimsnapline.Color = v
    end
})

local function movementtoggle(v)
    if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") and localplayer.Character:FindFirstChild("Humanoid") then
        if v then
            if not semifly_bodyvel then
                semifly_bodyvel = Instance.new("BodyVelocity", localplayer.Character.HumanoidRootPart)
                semifly_bodyvel.Velocity = Vector3.new(0, 0, 0)
                semifly_bodyvel.MaxForce = Vector3.new(1e4, 1e4, 1e4)
            end
        else
            if semifly_bodyvel then
                semifly_bodyvel:Destroy()
                semifly_bodyvel = nil
            end
        end

        local humanoid = localplayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = v
        end

        charsemifly = v
    else
        if semifly_bodyvel then
            semifly_bodyvel:Destroy()
            semifly_bodyvel = nil
        end
        charsemifly = false
    end
end

semifly:AddToggle({
    text = "Semi Fly",
    state = false,
    risky = true,
    flag = "SemiFly",
    callback = function(v)
        if _G.LoadingConfig == true then return end; if _G.Loading == true then return end
        movementtoggle(v)
    end
}):AddBind({
    enabled = true,
    text = "Movement Toggle",
    tooltip = "Movement Toggle Keybind",
    mode = "toggle",
    bind = "None",
    flag = "MovementToggleBind",
    state = false,
    nomouse = false,
    noindicator = false,
    callback = function(v)
        if _G.LoadingConfig == true then return end; if _G.Loading == true then return end
        movementtoggle(v)
    end,
    keycallback = function(v)
        
    end
})

semifly:AddSlider({
    enabled = true,
    text = "Max Height Distance",
    tooltip = "Movement Max Height Distance",
    flag = "MaxHeightDistance",
    suffix = "",
    dragging = true,
    focused = false,
    min = 1,
    max = 8,
    increment = 1,
    callback = function(v)
        charsemiflydist = v
    end
}):SetValue(6)

semifly:AddToggle({
    text = "Unlock Height Distance",
    flag = "UnlockHeightDistance",
    risky = true,
    callback = function(v)
    charsemiflydistunlock = v
    local oldsemiflydist = charsemiflydist

    if charsemiflydistunlock then
        charsemiflydist = 15000
    else
        charsemiflydist = oldsemiflydist
    end
    end
})

semifly:AddSlider({
    enabled = true,
    text = "Speed",
    tooltip = "Movement Speed",
    flag = "vMovementSpeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 1,
    max = 90,
    increment = 1,
    callback = function(v)
        charsemiflyspeed = v
    end
}):SetValue(18)

semifly:AddSeparator({
    enabled = true,
    text = "Anti Aim Toggles"
})

semifly:AddToggle({
    text = "Custom Rotation",
    flag = "CustomRotation",
    risky = true,
    callback = function(v)
        charantiaim_underground = v
    end
}):AddBind({
    enabled = true,
    text = "Custom Rotation",
    mode = "toggle",
    bind = "None",
    flag = "CustomRotationBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        charantiaim_underground = v
    end,
    keycallback = function(v)

    end
})

local character = localplayer.Character or localplayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animationxx = Instance.new("Animation")
animationxx.AnimationId = "rbxassetid://12839509307"
local animTrackHH = humanoid:LoadAnimation(animationxx)

semifly:AddToggle({
    text = "Play Falling Animation",
    flag = "PlayFallAnim",
    risky = true,
    callback = function(v)
        fallanim = v

        if fallanim then
            animTrackHH:Play()
            wait(0.1)
            animTrackHH:AdjustSpeed(0)
        else
            animTrackHH:Stop()
            wait(0.1)
            animTrackHH:AdjustSpeed(0)
        end
    end
})



semifly:AddToggle({
    text = "UpAngle Toggle",
    flag = "UpAngleToggle",
    risky = true,
    callback = function(v)
        upangletoggle = v
    end
}):AddBind({
    enabled = true,
    text = "Up Angle",
    mode = "toggle",
    bind = "None",
    flag = "UpAngleCharacterBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        upangletoggle = v
    end,
    keycallback = function(v)

    end
})

semifly:AddSlider({
    enabled = true,
    text = "UpAngle Value",
    tooltip = "UpAngle Value",
    flag = "UpAngleValue",
    suffix = "",
    dragging = true,
    focused = false,
    min = -5,
    max = 5,
    increment = 1,
    callback = function(v)
        upangleY = v
    end
})

semifly:AddSeparator({
    enabled = true,
    text = "Anti Aim Parameters"
})

semifly:AddSlider({
    enabled = true,
    text = "X Rotation",
    tooltip = "X Axis Rotation",
    flag = "XRotation",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 180,
    increment = 1,
    callback = function(v)
        xrot = v
    end
})

semifly:AddSlider({
    enabled = true,
    text = "Y Rotation",
    tooltip = "Y Axis Rotation",
    flag = "YRotation",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 180,
    increment = 1,
    callback = function(v)
        yrot = v
    end
})

semifly:AddSlider({
    enabled = true,
    text = "Z Rotation",
    tooltip = "Z Axis Rotation",
    flag = "ZRotation",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 180,
    increment = 1,
    callback = function(v)
        zrot = v
    end
})

semifly:AddSeparator({
    enabled = true,
    text = "Anti Aim Spin"
})

semifly:AddToggle({
    text = "Spin X",
    flag = "SpinX",
    callback = function(v)
            xspinning = v
    if not xspinning then
        xrot = 0
    else
        coroutine.wrap(function()
            while xspinning do
                xrot = (xrot + xspeedspin * 2) % 360
                runs.RenderStepped:Wait()
            end
        end)()
    end
    end
})

semifly:AddSlider({
    enabled = true,
    text = "X Rotation Speed",
    tooltip = "X Axis Rotation Speed",
    flag = "SpinXSpeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 20,
    increment = 0.1,
    callback = function(v)
        xspeedspin = v
    end
})

semifly:AddToggle({
    text = "Spin Y",
    flag = "SpinY",
    callback = function(v)
            yspinning = v
    if not yspinning then
        yrot = 0
    else
        coroutine.wrap(function()
            while yspinning do
                yrot = (yrot + yspeedspin * 2) % 360
                runs.RenderStepped:Wait()
            end
        end)()
    end
    end
})

semifly:AddSlider({
    enabled = true,
    text = "Y Rotation Speed",
    tooltip = "Y Axis Rotation Speed",
    flag = "SpinYSpeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 20,
    increment = 0.1,
    callback = function(v)
        yspeedspin = v
    end
})

semifly:AddToggle({
    text = "Spin Z",
    flag = "SpinZ",
    callback = function(v)
            zspinning = v
    if not zspinning then
        zrot = 0
    else
        coroutine.wrap(function()
            while zspinning do
                zrot = (zrot + zspeedspin * 2) % 360
                runs.RenderStepped:Wait()
            end
        end)()
    end
    end
})

semifly:AddSlider({
    enabled = true,
    text = "Z Rotation Speed",
    tooltip = "Z Axis Rotation Speed",
    flag = "SpinZSpeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 20,
    increment = 0.1,
    callback = function(v)
        zspeedspin = v
    end
})

semifly:AddSeparator({
    enabled = true,
    text = "Anti Aim Full Underground"
})

semifly:AddToggle({
    text = "Full Underground",
    flag = "FullUnderground",
    tooltip = "Full Underground Anti Aim",
    risky = true,
    callback = function(v)

    end
}):AddBind({
    enabled = true,
    text = "Full Underground",
    tooltip = "Full Underground Keybind",
    mode = "toggle",
    bind = "None",
    flag = "FullUndergroundBind",
    state = false,
    nomouse = false,
    noindicator = false,
    callback = function(v)

    task.spawn(function()
        if v then
            local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
            local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid")
            
            if humanoid then
                local animator = humanoid:FindFirstChild("Animator") or humanoid:WaitForChild("Animator")
                if animator then
                    FullUnderToggle = true
                    danceTrack = animator:LoadAnimation(animatioffn)
                    danceTrack.Looped = false
                    danceTrack:Play(.1, 1, 0)
                end
            end
        else
            FullUnderToggle = false
            if danceTrack then
                danceTrack:Stop()
                danceTrack:Destroy()
            end
        end
    end)

    camthirdp = v
    if v and localplayer.Character then
        localplayer.Character.Humanoid.CameraOffset = Vector3.new(camthirdpX, camthirdpY, camthirdpZ)
        localplayer.CameraMaxZoomDistance = 0.5
        localplayer.CameraMinZoomDistance = 0.5
    else
        localplayer.Character.Humanoid.CameraOffset = Vector3.new(0,0,0)
        localplayer.CameraMaxZoomDistance = 0.5
        localplayer.CameraMinZoomDistance = 0.5
    end

    end,
    keycallback = function(v)
        keybindgf = v
    end
})

function startspeedhack()
    local speaker = game:GetService("Players").LocalPlayer
    local chr = speaker.Character
    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
    local hb = game:GetService("RunService").Heartbeat
    while speedbool and chr and hum and hum.Parent do
        local delta = hb:Wait()
        if hum.MoveDirection.Magnitude > 0 then
            chr:TranslateBy(hum.MoveDirection * tonumber(speedboost) * delta * 10)
        else
            chr:TranslateBy(hum.MoveDirection * delta * 10)
        end
    end
end

privatefeatures:AddSeparator({
    enabled = true,
    text = "CFrame Speed"
})

privatefeatures:AddToggle({
    text = "CFrame Speed Enabled",
    flag = "CFrameSpeedToggle",
    callback = function(v)
        speedbool = v
        startspeedhack()
    end
}):AddBind({
    enabled = true,
    text = "CFrame Speed",
    mode = "toggle",
    bind = "None",
    flag = "CFrameSpeedBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        speedbool = v
        startspeedhack()
    end,
    keycallback = function(v)

    end
})

privatefeatures:AddSlider({
    enabled = true,
    text = "CFrame Speed",
    tooltip = "CFrame Speed Value",
    flag = "vCFrameSpeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 1.5,
    increment = 0.1,
    callback = function(v)
        speedboost = v
    end
}):SetValue(1)

privatefeatures:AddSeparator({
    enabled = true,
    text = "Player Exploits"
})

privatefeatures:AddToggle({
    text = "Player Exploit Toggle",
    flag = "PlayerExploitToggle",
    callback = function(v)
        changerbool = v
    end
}):AddBind({
    enabled = true,
    text = "Player Exploits",
    mode = "toggle",
    bind = "None",
    flag = "PlayerExploitBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        changerbool = v
    end,
    keycallback = function(v)

    end
})

privatefeatures:AddSlider({
    enabled = true,
    text = "Player Walkspeed",
    tooltip = "Walkspeed Value",
    flag = "vWalkspeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 70,
    increment = 0.1,
    callback = function(v)
        changerspeed = v
    end
}):SetValue(18)

privatefeatures:AddSlider({
    enabled = true,
    text = "Player Jumppower",
    tooltip = "Jumppower Value",
    flag = "vJumppower",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 25,
    increment = 0.1,
    callback = function(v)
        changerjump = v
    end
}):SetValue(4)

privatefeatures:AddSlider({
    enabled = true,
    text = "Player Hipheight",
    tooltip = "Hipheight Value",
    flag = "vHipheight",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 25,
    increment = 0.1,
    callback = function(v)
        changerheight = v
    end
}):SetValue(2)

privatefeatures:AddSlider({
    enabled = true,
    text = "Player Gravity",
    tooltip = "Gravity Value",
    flag = "vGravity",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 300,
    increment = 1,
    callback = function(v)
        changergrav = v
    end
}):SetValue(95)

privatefeatures:AddSeparator({
    enabled = true,
    text = "Other Exploits"
})

privatefeatures:AddToggle({
    text = "Jesus",
    flag = "Jesus",
    callback = function(v)
        worldjesus = v
        if v then
            while worldjesus do
                wait()
                local hitPart = workspace:Raycast(localplayer.Character:FindFirstChild("HumanoidRootPart").Position, Vector3.new(0, -5, 0) + localplayer.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 5, RaycastParams.new())
                if hitPart and hitPart.Material == Enum.Material.Water then
                    local clone = Instance.new("Part")
                    clone.Parent = waterplatforms
                    clone.Position = hitPart.Position
                    clone.Anchored = true
                    clone.CanCollide = true
                    clone.Size = Vector3.new(10,0.2,10)
                    clone.Transparency = 1
                end
            end
        else
            for i,v in ipairs(waterplatforms:GetChildren()) do
                v:Destroy()
            end
        end
    end
})

privatefeatures:AddToggle({
    text = "Bunnyhop",
    flag = "Bunnyhop",
    callback = function(v)
        bunnyhop = v
        if bunnyhop then
            task.spawn(function()
                while bunnyhop do
                    local humanoid = localplayer.Character and localplayer.Character:FindFirstChildWhichIsA("Humanoid")
                    if humanoid then
                        humanoid:SetAttribute("JumpCooldown", 0)
                    end
                    task.wait()
                end
            end)
        end
    end
})

privatefeatures:AddToggle({
    text = "Gnome Mode",
    flag = "GnomeMode",
    risky = true,
    tooltip = "Moves your limbs and head into your torso",
    callback = function(v)
        game.ReplicatedStorage.Remotes.UpdateTilt:FireServer(v and 0/0 or 0)
    end
}):AddBind({
    enabled = true,
    text = "Gnome Mode",
    mode = "toggle",
    bind = "None",
    flag = "GnomeBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        game.ReplicatedStorage.Remotes.UpdateTilt:FireServer(v and 0/0 or 0)
    end,
    keycallback = function(v)

    end
})

local fallingConnection

function isFalling()
    local humanoid = localplayer.Character and localplayer.Character:FindFirstChild("Humanoid")
    return humanoid and humanoid:GetState() == Enum.HumanoidStateType.Freefall
end

function createSafetyPart()
    local rootPart = localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        local safetyPart = Instance.new("Part")
        safetyPart.Size = Vector3.new(4, 0.5, 4)
        safetyPart.Anchored = true
        safetyPart.CanCollide = true
        safetyPart.Transparency = transparencyToggle and 0 or 1
        safetyPart.Color = falldmgcolor
        safetyPart.Material = Enum.Material.ForceField
        safetyPart.Position = rootPart.Position - Vector3.new(0, 4.9, 0)
        safetyPart.Parent = game.Workspace

        safetyPart.Touched:Connect(function(hit)
            if hit and hit.Parent == localplayer.Character then
                safetyPart:Destroy()
            end
        end)

        delay(0.05, function()
            if safetyPart and safetyPart.Parent then
                safetyPart:Destroy()
            end
        end)
    end
end

local function startFallProtection()
    if fallingConnection then fallingConnection:Disconnect() end

    fallingConnection = runs.Heartbeat:Connect(function()
        if NoFallDamage and isFalling() then
            createSafetyPart()
        end
    end)
end

privatefeatures:AddSeparator({
    enabled = true,
    text = "No Fall Damage"
})

privatefeatures:AddToggle({
    text = "No Fall Damage",
    tooltip = "Main Toggle for No Fall Damage",
    flag = "NoFallDamage",
    callback = function(v)
        NoFallDamage = v
        if v then
            startFallProtection()
        elseif fallingConnection then
            fallingConnection:Disconnect()
            fallingConnection = nil
        end
    end
})

privatefeatures:AddToggle({
    text = "Visualize",
    tooltip = "Visualizes No Fall Damage",
    flag = "VisualizeNFD",
    callback = function(v)
        transparencyToggle = v
    end
}):AddColor({
    enabled = true,
    text = "Visualize Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "VisualizeNFDColor",
    trans = 0,
    open = false,
    callback = function(v)
        falldmgcolor = v
    end
})

local gcConnection

function createTrail()
    local rootPart = localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        local safetyPart = Instance.new("Part")
        safetyPart.Size = Vector3.new(0.08, 0.08, 0.08)
        safetyPart.Anchored = true
        safetyPart.CanCollide = false
        safetyPart.Color = trailcolor
        if trailmaterial == "ForceField" then
            safetyPart.Material = Enum.Material.ForceField
        elseif trailmaterial == "Neon" then
            safetyPart.Material = Enum.Material.Neon
        elseif trailmaterial == "Smooth Plastic" then
            safetyPart.Material = Enum.Material.SmoothPlastic
        end
        safetyPart.Position = rootPart.Position - Vector3.new(0, 1.7, 0)
        safetyPart.Parent = game.Workspace

        local fadeTime = traillifetime * 0.5
        task.delay(traillifetime - fadeTime, function()
            for i = 1, 10 do
                if safetyPart then
                    safetyPart.Transparency = i / 10
                    task.wait(fadeTime / 10)
                end
            end
            if safetyPart and safetyPart.Parent then
                safetyPart:Destroy()
            end
        end)
    end
end

local function startTrail()
    if gcConnection then gcConnection:Disconnect() end

    gcConnection = runs.Heartbeat:Connect(function()
        if trailenabled then
            createTrail()
        end
    end)
end

effects:AddToggle({
    text = "Bullet Tracers Enabled",
    tooltip = "Enables/disables Bullet Tracers",
    flag = "BulletTracersToggle",
    callback = function(v)
        tracbool = v
    end
}):AddColor({
    enabled = true,
    text = "Bullet Tracer Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "BulletTracerColor",
    trans = 0,
    open = false,
    callback = function(v)
        traccolor = v
    end
})

effects:AddList({
    enabled = true,
    text = "Tracer Texture", 
    tooltip = "Bullet Tracer Texture",
    selected = "Neon",
    flag = "TracerTexture",
    multi = false,
    open = false,
    max = 4,
    values = {"None", "Neon", "Lightning", "Wide"},
    callback = function(v)
        tracertexture = tracertextures[v]
    end
})

effects:AddSlider({
    enabled = true,
    text = "Tracer Lifetime",
    flag = "TracerLifetime",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0.5,
    max = 20,
    increment = 0.5,
    callback = function(v)
        tracwait = v
    end
}):SetValue(1)

effects:AddSeparator({
    enabled = true,
    text = ""
})

wh:AddToggle({
    text = "ESP Enabled",
    tooltip = "Main Toggle for ESP",
    flag = "ESPToggle",
    callback = function(v)
        espbool = v
    end
})

wh:AddToggle({
    text = "AI",
    tooltip = "Includes AI in ESP",
    flag = "ESPAI",
    callback = function(v)
        espbots = v
    end
})

wh:AddToggle({
    text = "Name",
    tooltip = "Includes Names in ESP",
    flag = "ESPName",
    callback = function(v)
        espname = v
    end
}):AddColor({
    text = "ESP Name Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "ESPNameColor",
    callback = function(v)
        espnamecolor = v
    end
})

wh:AddToggle({
    text = "Health",
    tooltip = "Includes Health in ESP",
    flag = "ESPHealth",
    callback = function(v)
        esphp = v
    end
}):AddColor({
    text = "ESP Health Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "ESPHealthColor",
    callback = function(v)
        esphpcolor = v
    end
})

wh:AddToggle({
    text = "Distance",
    tooltip = "Includes Distance in ESP",
    flag = "ESPDistance",
    callback = function(v)
        espdistance = v
    end
}):AddColor({
    text = "ESP Distance Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "ESPDistColor",
    callback = function(v)
        espdistcolor = v
    end
})

wh:AddToggle({
    text = "Chams",
    tooltip = "Includes Chams in ESP",
    flag = "ESPChams",
    callback = function(v)
        esphigh = v
    end
})

wh:AddToggle({
    text = "Equipped Tool",
    tooltip = "Includes Equipped Tool in ESP",
    flag = "ESPEquippedTool",
    callback = function(v)
        esphotbar = v
    end
}):AddColor({
    text = "ESP Equipped Item Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "ESPItemColor",
    callback = function(v)
        esphotbarcolor = v
    end
})

wh:AddToggle({
    text = "Body",
    tooltip = "Includes Dead Bodies in ESP",
    flag = "ESPBody",
    callback = function(v)
        espdead = v
    end
})

wh:AddToggle({
    text = "Extract",
    tooltip = "Includes Extracts in ESP",
    flag = "ESPExtract",
    callback = function(v)
        espexit = v
    end
})

wh:AddSeparator({
    enabled = true,
    text = "ESP Parameters"
})

wh:AddSlider({
    enabled = true,
    text = "Text Size",
    tooltip = "ESP Text Size",
    flag = "ESPTextSize",
    suffix = "",
    dragging = true,
    focused = false,
    min = 1,
    max = 35,
    increment = 1,
    callback = function(v)
        esptextsize = v
    end
}):SetValue(17)

wh:AddToggle({
    text = "Text Outline",
    tooltip = "Adds a Text Outline to ESP",
    flag = "ESPTextOutline",
    callback = function(v)
        esptextline = v
    end
})

wh:AddSeparator({
    enabled = true,
    text = "Cham Parameters"
})

wh:AddToggle({
    text = "Occluded Chams",
    tooltip = "Enables/Disables Occluded Chams",
    flag = "ESPOccludedChams",
    callback = function(v)
        occludedchams = v
    end
})

local currentCoroutine = nil

wh:AddToggle({
    text = "Thermal Chams",
    flag = "ThermalChams",
    callback = function(v)
        thermalchams = v

        if thermalchams then
            if currentCoroutine then
                thermalchams = false
                currentCoroutine = nil
            end

            currentCoroutine = coroutine.wrap(function()
                while thermalchams do
                    for i = 0.05, 1, thermspeed do
                        espchamsfill = i
                        runs.RenderStepped:Wait()
                    end
                    for i = 1, 0.05, -thermspeed do
                        espchamsfill = i
                        runs.RenderStepped:Wait()
                    end
                end
            end)
            currentCoroutine()

        elseif not thermalchams then
            if currentCoroutine then
                thermalchams = false
                currentCoroutine = nil
            end
        end
    end
})


wh:AddSlider({
    enabled = true,
    text = "Thermal Chams Speed",
    flag = "vSThermalSpeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 1,
    max = 5,
    increment = 0.5,
    callback = function(v)
        thermspeed = v * 0.008
    end
})

wh:AddSlider({
    enabled = true,
    text = "Chams Outline Transparency",
    flag = "vSCOT",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 1,
    increment = 0.1,
    callback = function(v)
        espchamsline = v
    end
})
wh:AddColor({
    enabled = true,
    text = "Chams Outline Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "ESPCOC",
    trans = 0,
    open = false,
    callback = function(v)
        esplinecolor = v
    end
})
wh:AddSlider({
    enabled = true,
    text = "Chams Fill Transparency",
    flag = "ESPCFT",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 1,
    increment = 0.1,
    callback = function(v)
        espchamsfill = v
    end
}):SetValue(1)
wh:AddColor({
    enabled = true,
    text = "Chams Fill Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "ESPCFC",
    trans = 0,
    open = false,
    callback = function(v)
        espfillcolor = v
    end
})

cross:AddToggle({
    text = "Crosshair Enabled",
    tooltip = "Enables/disables crosshair",
    flag = "CrosshairEnabled",
    callback = function(v)
        crosshair.Visible = v
    end
}):AddColor({
    enabled = true,
    text = "Crosshair Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "CrosshairColor",
    trans = 0,
    open = false,
    callback = function(v)
        crosshair.Color = v
    end
})

worldh:AddToggle({
    text = "No Grass",
    tooltip = "Adds/Removes Grass",
    flag = "NoGrass",
    callback = function(v)
        sethiddenproperty(workspace.Terrain, "Decoration", not v)
    end
})

worldh:AddToggle({
    text = "No Leaves",
    tooltip = "Adds/Removes Leaves",
    flag = "NoLeaves",
    callback = function(v)
        worldleaves = v
    end
})

worldh:AddSeparator({
    enabled = true,
    text = "Lighting Parameters"
})

worldh:AddToggle({
    text = "Modify Clock Time",
    tooltip = "Turns off/on clock time modifier",
    flag = "ClockTimeModifier",
    callback = function(v)
        worldclockmodifier = v
    end
}):AddBind({
    enabled = true,
    text = "Clock Time",
    mode = "toggle",
    bind = "None",
    flag = "ClockTimeModifierBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        worldclockmodifier = v
    end,
    keycallback = function(v)

    end
})

worldh:AddSlider({
    enabled = true,
    text = "Clock Time",
    flag = "ClockTime",
    suffix = "h",
    dragging = true,
    focused = false,
    min = 0,
    max = 24,
    increment = 0.1,
    callback = function(v)
        worldclock = v
    end
})

worldh:AddToggle({
    text = "No Fog",
    tooltip = "Enables/Disables Fog",
    flag = "NoFog",
    callback = function(v)
        if atmosphere then
            if v then
                atmosphere.Density = 0
                atmosphere.Offset = 0
            else
                atmosphere.Density = originalDensity
                atmosphere.Offset = originalOffset
            end
        end
    end
})

local prevAmbient = game.Lighting.Ambient
local prevOutdoor = game.Lighting.OutdoorAmbient

worldh:AddToggle({
    text = "Ambient Toggle",
    tooltip = "Enables/Disables Ambient Modifier",
    flag = "AmbientToggle",
    callback = function(v)
        worldvisualstoggle = v
        if worldvisualstoggle then
            game.Lighting.Ambient = worldambient
            game.Lighting.OutdoorAmbient = worldoutdoor
        else
            game.Lighting.Ambient = prevAmbient
            game.Lighting.OutdoorAmbient = prevOutdoor
        end
        
        if _G.LoadingConfig and worldvisualstoggle then
            task.spawn(function()
                task.wait(0.2)
                game.Lighting.Ambient = worldambient
                game.Lighting.OutdoorAmbient = worldoutdoor
            end)
        end
    end
})

worldh:AddColor({
    enabled = true,
    text = "Ambient Color",
    color = Color3.fromRGB(255, 255, 255),
    flag = "AmColor",
    trans = 0,
    open = false,
    callback = function(v)
        worldambient = v
    end
})

worldh:AddColor({
    enabled = true,
    text = "Outdoor Ambient Color",
    color = Color3.fromRGB(255, 255, 255),
    flag = "OAmColor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        worldoutdoor = v
    end
})

effects:AddToggle({
    text = "Hit Markers",
    tooltip = "Enables/Disables Hit Markers",
    flag = "HitToggle",
    callback = function(v)
        hitmarkbool = v
    end
}):AddColor({
    enabled = true,
    text = "Hit Marker Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "HitColor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        hitmarkcolor = v
    end
})

effects:AddList({
    enabled = true,
    text = "Hit Marker Texture", 
    selected = "Cross",
    flag = "HitTexture",
    multi = false,
    open = false,
    max = 4,
    values = {"Cross", "Star", "Heart"},
    risky = false,
    callback = function(v)
        hitmarktexture = v
    end
})

effects:AddSlider({
    enabled = true,
    text = "Hit Marker Lifetime",
    flag = "HitLifetime",
    suffix = "s",
    dragging = true,
    focused = false,
    min = 0,
    max = 10,
    increment = 0.5,
    callback = function(v)
        hitmarkfade = v
    end
}):SetValue(2)

effects:AddSeparator({
    enabled = true,
    text = ""
})

effects:AddToggle({
    text = "Breadcrumbs",
    tooltip = "Enables/Disables breadcrumbs",
    flag = "BreadcrumbsToggle",
    callback = function(v)
        trailenabled = v
        if v then
            startTrail()
        elseif gcConnection then
            gcConnection:Disconnect()
            gcConnection = nil
        end
    end
}):AddColor({
    enabled = true,
    text = "Breadcrumbs Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "BreadcrumbsColor",
    trans = 0,
    open = false,
    callback = function(v)
        trailcolor = v
    end
})

effects:AddList({
    enabled = true,
    text = "Breadcrumbs Material", 
    tooltip = "Breadcrumbs Material",
    selected = "ForceField",
    flag = "BreadcrumbsMaterial",
    multi = false,
    open = false,
    max = 4,
    values = {"ForceField", "Neon", "Smooth Plastic"},
    callback = function(v)
        trailmaterial = v
    end
})

effects:AddSlider({
    enabled = true,
    text = "Breadcrumbs Lifetime",
    tooltip = "Breadcrumbs Lifetime",
    flag = "BreadcrumbsLifetime",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 0.3,
    increment = 0.01,
    callback = function(v)
        traillifetime = v
    end
}):SetValue(0.2)

viewmod:AddToggle({
    text = "Viewmodel Chams",
    tooltip = "Enables/Disables Viewmodel Chams",
    flag = "ViewmodelChams",
    callback = function(v)
        viewmodbool = v
    end
})
viewmod:AddList({
    enabled = true,
    text = "Arm Chams Material", 
    selected = "Forcefield",
    flag = "ViewmodelArmChamMaterial",
    multi = false,
    open = false,
    max = 4,
    values = {"Neon", "Forcefield", "Plastic"},
    risky = false,
    callback = function(v)
        if viewmod_materials[v] then
            viewmodhandmat = viewmod_materials[v]
        else
    
        end
    end
})
viewmod:AddList({
    enabled = true,
    text = "Weapon Chams Material", 
    selected = "Forcefield",
    flag = "ViewmodelWeaponChamMaterial",
    multi = false,
    open = false,
    max = 4,
    values = {"Neon", "Forcefield", "Plastic"},
    risky = false,
    callback = function(v)
        if viewmod_materials[v] then
            viewmodgunmat = viewmod_materials[v]
        else
    
        end
    end
})
viewmod:AddColor({
    enabled = true,
    text = "Arm Chams Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "ArmChamsColor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        viewmodhandcolor = v
    end
})
viewmod:AddColor({
    enabled = true,
    text = "Weapon Chams Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "WeaponChamsColor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        viewmodguncolor = v
    end
})

viewmod:AddSeparator({
    enabled = true,
    text = "Outline Chams"
})

viewmod:AddToggle({
    text = "Viewmodel Outline Chams",
    tooltip = "Enables/Disables Viewmodel Outline Chams",
    flag = "ViewmodelOutlineChams",
    callback = function(v)
        viewmodhighlightchams = v
    end
})

viewmod:AddColor({
    enabled = true,
    text = "Outline Fill Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "ViewmodelOFC",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        viewmodhighlightfillcolor = v
    end
})

viewmod:AddSlider({
    enabled = true,
    text = "Outline Fill Transparency",
    flag = "ViewmodelOFT",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 1,
    increment = 0.1,
    callback = function(v)
        viewmodhighlightfilltransparency = v
    end
}):SetValue(1)

viewmod:AddColor({
    enabled = true,
    text = "Outline Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "ViewmodelOC",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        viewmodhighlightoutlinecolor = v
    end
})

viewmod:AddSlider({
    enabled = true,
    text = "Outline Transparency",
    flag = "ViewmodelT",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 1,
    increment = 0.1,
    callback = function(v)
        viewmodhighlightoutlinetransparency = v
    end
})

local zoomtoggle = false

local classicfov = 100
local zoomfov = 5

camzoom:AddToggle({
    text = "Zoom",
    tooltip = "Enables/Disables Zoom",
    flag = "ZoomEnabled",
    callback = function(v)
    if _G.LoadingConfig == true then return end; if _G.Loading == true then return end

if zoomtoggle then
			if rp.Players and rp.Players:FindFirstChild(localplayer.Name) and rp.Players:FindFirstChild(localplayer.Name).Settings then
				local settings = rp.Players:FindFirstChild(localplayer.Name).Settings
                                zoomtoggle = false
				settings.GameplaySettings:SetAttribute("DefaultFOV", classicfov)
			end
else
	                if rp.Players and rp.Players:FindFirstChild(localplayer.Name) and rp.Players:FindFirstChild(localplayer.Name).Settings then
		                local settings = rp.Players:FindFirstChild(localplayer.Name).Settings
                                zoomtoggle = true
		                 settings.GameplaySettings:SetAttribute("DefaultFOV", zoomfov)
	                end
end
    end
}):AddBind({
    enabled = true,
    text = "Zoom",
    tooltip = "Zoom Keybind",
    mode = "toggle",
    bind = "None",
    flag = "ZoomBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
    if _G.LoadingConfig == true then return end; if _G.Loading == true then return end

if zoomtoggle then
			if rp.Players and rp.Players:FindFirstChild(localplayer.Name) and rp.Players:FindFirstChild(localplayer.Name).Settings then
				local settings = rp.Players:FindFirstChild(localplayer.Name).Settings
                                zoomtoggle = false
				settings.GameplaySettings:SetAttribute("DefaultFOV", classicfov)
			end
else
	                if rp.Players and rp.Players:FindFirstChild(localplayer.Name) and rp.Players:FindFirstChild(localplayer.Name).Settings then
		                local settings = rp.Players:FindFirstChild(localplayer.Name).Settings
                                zoomtoggle = true
		                 settings.GameplaySettings:SetAttribute("DefaultFOV", zoomfov)
	                end
end
    end,
    keycallback = function(v)
    if _G.LoadingConfig == true then return end; if _G.Loading == true then return end

if zoomtoggle then
			if rp.Players and rp.Players:FindFirstChild(localplayer.Name) and rp.Players:FindFirstChild(localplayer.Name).Settings then
				local settings = rp.Players:FindFirstChild(localplayer.Name).Settings
                                zoomtoggle = false
				settings.GameplaySettings:SetAttribute("DefaultFOV", classicfov)
			end
else
	                if rp.Players and rp.Players:FindFirstChild(localplayer.Name) and rp.Players:FindFirstChild(localplayer.Name).Settings then
		                local settings = rp.Players:FindFirstChild(localplayer.Name).Settings
                                zoomtoggle = true
		                 settings.GameplaySettings:SetAttribute("DefaultFOV", zoomfov)
	                end
end
    end
})

camzoom:AddSlider({
    enabled = true,
    text = "Base FOV",
    flag = "BaseFOV",
    suffix = "",
    dragging = true,
    focused = false,
    min = 5,
    max = 100,
    increment = 1,
    callback = function(v)
        classicfov = v
    end
}):SetValue(100)

camzoom:AddSlider({
    enabled = true,
    text = "Zoom FOV",
    flag = "ZoomFOV",
    suffix = "",
    dragging = true,
    focused = false,
    min = 5,
    max = 80,
    increment = 1,
    callback = function(v)
        zoomfov = v
    end
})

local closestDistance = math.huge
local closestPlayerTemp

local H34289423980432908 = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local Line = Instance.new("Frame")
local Weapons = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local Weapon1 = Instance.new("ImageLabel")
local Dura = Instance.new("Frame")
local DuraBar = Instance.new("Frame")
local UIGradient_2 = Instance.new("UIGradient")
local Ammo = Instance.new("TextLabel")
local Weapon2 = Instance.new("ImageLabel")
local Ammo_2 = Instance.new("TextLabel")
local Dura_2 = Instance.new("Frame")
local DuraBar_2 = Instance.new("Frame")
local UIGradient_3 = Instance.new("UIGradient")
local Weapon3 = Instance.new("ImageLabel")
local Ammo_3 = Instance.new("TextLabel")
local Dura_3 = Instance.new("Frame")
local DuraBar_3 = Instance.new("Frame")
local UIGradient_4 = Instance.new("UIGradient")
local TextLabel = Instance.new("TextLabel")

H34289423980432908.Name = "H34289423980432908"
H34289423980432908.Parent = game:GetService("CoreGui")
H34289423980432908.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
H34289423980432908.ResetOnSpawn = false
H34289423980432908.Enabled = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = H34289423980432908
MainFrame.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.249208868, 0, 0.448336244, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 21)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(71, 71, 71)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient.Rotation = 90
UIGradient.Parent = MainFrame

Line.Name = "Line"
Line.Parent = MainFrame
Line.BackgroundColor3 = accentcolor
Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(-0.000791098864, 0, -0.0278538298, 0)
Line.Size = UDim2.new(0, 220, 0, 1)
Line.ZIndex = 3

Weapons.Name = "Weapons"
Weapons.Parent = MainFrame
Weapons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Weapons.BackgroundTransparency = 1.000
Weapons.BorderColor3 = Color3.fromRGB(0, 0, 0)
Weapons.BorderSizePixel = 0
Weapons.Position = UDim2.new(0, 0, 1.42857146, 0)
Weapons.Size = UDim2.new(0, 220, 0, 91)

UIGridLayout.Parent = Weapons
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 70, 0, 70)

Weapon1.Name = "Weapon1"
Weapon1.Parent = Weapons
Weapon1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Weapon1.BackgroundTransparency = 1.000
Weapon1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Weapon1.BorderSizePixel = 0
Weapon1.Position = UDim2.new(0, 0, 1, 0)
Weapon1.Size = UDim2.new(0, 100, 0, 100)

Dura.Name = "Dura"
Dura.Parent = Weapon1
Dura.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Dura.BorderColor3 = Color3.fromRGB(0, 0, 0)
Dura.BorderSizePixel = 0
Dura.Position = UDim2.new(0, 0, 0, -5)
Dura.Size = UDim2.new(0, 70, 0, 2)

DuraBar.Name = "DuraBar"
DuraBar.Parent = Dura
DuraBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DuraBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
DuraBar.BorderSizePixel = 0
DuraBar.Size = UDim2.new(0, 70, 0, 2)

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, inventorygradient1), ColorSequenceKeypoint.new(1.00, inventorygradient2)}
UIGradient_2.Parent = DuraBar

Ammo.Name = "Ammo"
Ammo.Parent = Weapon1
Ammo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ammo.BackgroundTransparency = 1.000
Ammo.BorderColor3 = Color3.fromRGB(0, 0, 0)
Ammo.BorderSizePixel = 0
Ammo.Position = UDim2.new(0.571428597, 0, 0.742857158, 0)
Ammo.Size = UDim2.new(0, 30, 0, 18)
Ammo.Font = Enum.Font.Code
Ammo.Text = "0/10"
Ammo.TextColor3 = ammotextcolor
Ammo.TextSize = 14.000
Ammo.TextStrokeTransparency = 0.500

Weapon2.Name = "Weapon2"
Weapon2.Parent = Weapons
Weapon2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Weapon2.BackgroundTransparency = 1.000
Weapon2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Weapon2.BorderSizePixel = 0
Weapon2.Position = UDim2.new(0, 0, 1, 0)
Weapon2.Size = UDim2.new(0, 100, 0, 100)

Ammo_2.Name = "Ammo"
Ammo_2.Parent = Weapon2
Ammo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ammo_2.BackgroundTransparency = 1.000
Ammo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Ammo_2.BorderSizePixel = 0
Ammo_2.Position = UDim2.new(0.571428597, 0, 0.742857158, 0)
Ammo_2.Size = UDim2.new(0, 30, 0, 18)
Ammo_2.Font = Enum.Font.Code
Ammo_2.Text = "0/10"
Ammo_2.TextColor3 = ammotextcolor
Ammo_2.TextSize = 14.000
Ammo_2.TextStrokeTransparency = 0.500

Dura_2.Name = "Dura"
Dura_2.Parent = Weapon2
Dura_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Dura_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Dura_2.BorderSizePixel = 0
Dura_2.Position = UDim2.new(0, 0, 0, -5)
Dura_2.Size = UDim2.new(0, 70, 0, 2)

DuraBar_2.Name = "DuraBar"
DuraBar_2.Parent = Dura_2
DuraBar_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DuraBar_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
DuraBar_2.BorderSizePixel = 0
DuraBar_2.Size = UDim2.new(0, 70, 0, 2)

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, inventorygradient1), ColorSequenceKeypoint.new(1.00, inventorygradient2)}
UIGradient_3.Parent = DuraBar_2

Weapon3.Name = "Weapon3"
Weapon3.Parent = Weapons
Weapon3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Weapon3.BackgroundTransparency = 1.000
Weapon3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Weapon3.BorderSizePixel = 0
Weapon3.Position = UDim2.new(0, 0, 1, 0)
Weapon3.Size = UDim2.new(0, 100, 0, 100)

Ammo_3.Name = "Ammo"
Ammo_3.Parent = Weapon3
Ammo_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ammo_3.BackgroundTransparency = 1.000
Ammo_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Ammo_3.BorderSizePixel = 0
Ammo_3.Position = UDim2.new(0.571428597, 0, 0.742857158, 0)
Ammo_3.Size = UDim2.new(0, 30, 0, 18)
Ammo_3.Font = Enum.Font.Code
Ammo_3.Text = "0/10"
Ammo_3.TextColor3 = ammotextcolor
Ammo_3.TextSize = 14.000
Ammo_3.TextStrokeTransparency = 0.500

Dura_3.Name = "Dura"
Dura_3.Parent = Weapon3
Dura_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Dura_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Dura_3.BorderSizePixel = 0
Dura_3.Position = UDim2.new(0, 0, 0, -5)
Dura_3.Size = UDim2.new(0, 70, 0, 2)

DuraBar_3.Name = "DuraBar"
DuraBar_3.Parent = Dura_3
DuraBar_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DuraBar_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
DuraBar_3.BorderSizePixel = 0
DuraBar_3.Size = UDim2.new(0, 70, 0, 2)

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, inventorygradient1), ColorSequenceKeypoint.new(1.00, inventorygradient2)}
UIGradient_4.Parent = DuraBar_3

TextLabel.Parent = MainFrame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, 0.019763764, 0)
TextLabel.Size = UDim2.new(0, 219, 0, 20)
TextLabel.Font = Enum.Font.Code
TextLabel.Text = "No one's Hotbar"
TextLabel.TextColor3 = inventorymaintextcolor
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.500

local function XWMGQVE_fake_script()
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(XWMGQVE_fake_script)()

inventorychecker:AddToggle({
    text = "Hotbar Checker",
    tooltip = "Enables/Disables Hotbar Checker",
    flag = "HotbarChecker",
    callback = function(v)
        H34289423980432908.Enabled = v
    end
})

inventorychecker:AddColor({
    enabled = true,
    text = "Durability Gradient Left",
    tooltip = "Durability Gradient Left Side Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "DGradient1",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        inventorygradient1 = v
    end
})

inventorychecker:AddColor({
    enabled = true,
    text = "Durability Gradient Right",
    tooltip = "Durability Gradient Right Side Color",
    color = Color3.fromRGB(99, 69, 194),
    flag = "DGradient2",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        inventorygradient2 = v
    end
})

inventorychecker:AddColor({
    enabled = true,
    text = "Player Name Color",
    tooltip = "Player Name Title Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "PColorInv",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        inventorymaintextcolor = v
    end
})

inventorychecker:AddColor({
    enabled = true,
    text = "Ammo Text Color",
    tooltip = "Ammo Text Color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "AmmoColorInv",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        ammotextcolor = v
    end
})

inventorychecker:AddColor({
    enabled = true,
    text = "Accent",
    tooltip = "Accent color",
    color = Color3.fromRGB(159, 99, 254),
    flag = "AccentColorInv",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        accentcolor = v
    end
})

noEffectsActive = false

camer:AddToggle({
    text = "No Effects",
    tooltip = "Enables/Disables Screen Effects",
    flag = "NoEffects",
    callback = function(v)
        noEffectsActive = v
        if noEffectsActive then
            task.spawn(function()
                while noEffectsActive do
                    task.wait(0.1)
                    local pg = localplayer.PlayerGui
                    if pg and pg:FindFirstChild("MainGui") and pg.MainGui:FindFirstChild("MainFrame") and pg.MainGui.MainFrame:FindFirstChild("ScreenEffects") then
                        for i, v in ipairs(localplayer.PlayerGui.MainGui.MainFrame.ScreenEffects:GetChildren()) do
                            if v:IsA("Frame") then
                                v.Visible = false
                            end
                        end
                    end
                end
            end)
        else
            local pg = localplayer.PlayerGui
            if pg and pg:FindFirstChild("MainGui") and pg.MainGui:FindFirstChild("MainFrame") and pg.MainGui.MainFrame:FindFirstChild("ScreenEffects") then
                for i, v in ipairs(localplayer.PlayerGui.MainGui.MainFrame.ScreenEffects:GetChildren()) do
                    if v:IsA("Frame") then
                        v.Visible = true
                    end
                end
            end
        end
    end
})

camer:AddToggle({
    text = "No Visor",
    tooltip = "Enables/Disables Visor Visibility",
    flag = "NoVisor",
    callback = function(v)
        if v == true then
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.HelmetMask.TitanShield.Size = UDim2.new(0,0,1,0)
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Mask.GP5.Size = UDim2.new(0,0,1,0)
            for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Visor:GetChildren()) do
                v.Size = UDim2.new(0,0,1,0)
            end
        else
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.HelmetMask.TitanShield.Size = UDim2.new(1,0,1,0)
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Mask.GP5.Size = UDim2.new(1,0,1,0)
            for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Visor:GetChildren()) do
                v.Size = UDim2.new(1,0,1,0)
            end
        end
    end
})

camer:AddToggle({
    text = "No Flashbang",
    tooltip = "Enables/Disables Flashbang Effect",
    flag = "NoFlashbang",
    callback = function(v)
        if v == true then
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Flashbang.Size = UDim2.new(0,0,1,0)
        else
            game.Players.LocalPlayer.PlayerGui.MainGui.MainFrame.ScreenEffects.Flashbang.Size = UDim2.new(1,0,1,0)
        end
    end
})

camer:AddToggle({
    text = "No Drown",
    tooltip = "Enables/Disables Drown Damage",
    flag = "NoDrown",
    risky = true,
    callback = function(v)
        AntiDrown = v
        if AntiDrown then
            game.Lighting.WaterBlur.Size = 0
        else
            game.Lighting.WaterBlur.Size = 24
        end
    end
})

local origZoom = localplayer.CameraMaxZoomDistance
local origMode = localplayer.CameraMode

local isToggled = false

local newZoom = 99999
local newMode = Enum.CameraMode.Classic

camer:AddToggle({
    text = "Third Person",
    tooltip = "Enables/Disables Third Person Ability",
    flag = "ThirdPerson",
    callback = function(v)
    if _G.LoadingConfig == true then return end
        thirdpersonvisualizer = v
        isToggled = v
        if isToggled then
            localplayer.CameraMaxZoomDistance = newZoom
            localplayer.CameraMode = newMode
        else
            localplayer.CameraMaxZoomDistance = origZoom
            localplayer.CameraMode = origMode
        end
    end
}):AddBind({
    enabled = true,
    text = "Third Person",
    tooltip = "Third Person Keybind",
    mode = "toggle",
    bind = "None",
    flag = "ThirdPersonBind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
    if _G.LoadingConfig == true then return end
        thirdpersonvisualizer = v
        isToggled = v
        if isToggled then
            localplayer.CameraMaxZoomDistance = newZoom
            localplayer.CameraMode = newMode
        else
            localplayer.CameraMaxZoomDistance = origZoom
            localplayer.CameraMode = origMode
        end
    end,
    keycallback = function(v)

    end
})

hitsounds:AddToggle({
    text = "Hitsounds Enabled",
    tooltip = "Enables/Disables Custom Hitsounds",
    flag = "HitsoundBool",
    callback = function(v)
        hitsoundbool = v
    end
})

hitsounds:AddList({
    enabled = true,
    text = "Headshot Hitsound", 
    selected = "Neverlose",
    flag = "HSHS",
    multi = false,
    open = false,
    max = 4,
    values = {"Neverlose", "Gamesense", "Rust", "Bubble", "Minecraft", "Among-Us"},
    risky = false,
    callback = function(v)
        if _G.Loading == true then return end

        hitsoundhead = v

        local preview = Instance.new("Sound", workspace)
        preview.SoundId = hitsoundlib[v]
        preview:Play()
        task.wait(1)
        preview:Destroy()
    end
})

hitsounds:AddList({
    enabled = true,
    text = "Bodyhit Hitsound", 
    selected = "Gamesense",
    flag = "BHHS",
    multi = false,
    open = false,
    max = 4,
    values = {"Neverlose", "Gamesense", "Rust", "Bubble", "Minecraft", "Among-Us"},
    risky = false,
    callback = function(v)
        if _G.Loading == true then return end

        hitsoundbody = v

        local preview = Instance.new("Sound", workspace)
        preview.SoundId = hitsoundlib[v]
        preview:Play()
        task.wait(1)
        preview:Destroy()
    end
})

local ST329132995293534123 = Instance.new("ScreenGui")
local StaffFrame = Instance.new("Frame")
local StaffTitle = Instance.new("TextLabel")
local UIVSGradient = Instance.new("UIGradient")
local XLine = Instance.new("Frame")
local StaffList = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Template = Instance.new("Folder")
local StaffLabel = Instance.new("TextLabel")

ST329132995293534123.Name = "ST329132995293534123"
ST329132995293534123.Parent = game:GetService("CoreGui")
ST329132995293534123.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ST329132995293534123.ResetOnSpawn = false
ST329132995293534123.Enabled = false

StaffFrame.Name = "StaffFrame"
StaffFrame.Parent = ST329132995293534123
StaffFrame.AnchorPoint = Vector2.new(0.5, 0.5)
StaffFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StaffFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
StaffFrame.BorderSizePixel = 0
StaffFrame.Position = UDim2.new(0.930379748, 0, 0.458844125, 0)
StaffFrame.Size = UDim2.new(0, 110, 0, 124)

StaffTitle.Name = "StaffTitle"
StaffTitle.Parent = StaffFrame
StaffTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StaffTitle.BackgroundTransparency = 1.000
StaffTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
StaffTitle.BorderSizePixel = 0
StaffTitle.Size = UDim2.new(0, 110, 0, 18)
StaffTitle.Font = Enum.Font.Code
StaffTitle.Text = "STAFF IN SERVER ()"
StaffTitle.TextColor3 = stafftitlecolor
StaffTitle.TextScaled = true
StaffTitle.TextSize = 14.000
StaffTitle.TextStrokeTransparency = 0.500
StaffTitle.TextWrapped = true

UIVSGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 18, 18)), ColorSequenceKeypoint.new(0.47, Color3.fromRGB(20, 20, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(44, 44, 44))}
UIVSGradient.Rotation = -90
UIVSGradient.Name = "UIVSGradient"
UIVSGradient.Parent = StaffFrame

XLine.Name = "Line"
XLine.Parent = StaffFrame
XLine.AnchorPoint = Vector2.new(0.5, 0.5)
XLine.BackgroundColor3 = stafflinecolor
XLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
XLine.BorderSizePixel = 0
XLine.Position = UDim2.new(0.501329422, 0, -0.00312500005, 0)
XLine.Size = UDim2.new(1, 0, 0, 1)

StaffList.Name = "StaffList"
StaffList.Parent = StaffFrame
StaffList.AnchorPoint = Vector2.new(0.5, 0.5)
StaffList.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
StaffList.BackgroundTransparency = 1.000
StaffList.BorderColor3 = Color3.fromRGB(0, 0, 0)
StaffList.BorderSizePixel = 0
StaffList.Position = UDim2.new(0.501329482, 0, 0.560483813, 0)
StaffList.Size = UDim2.new(0.890909076, 0, 0.822580516, 1)

UIListLayout.Parent = StaffList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)

Template.Name = "Template"
Template.Parent = StaffFrame

StaffLabel.Name = "StaffLabel"
StaffLabel.Parent = Template
StaffLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StaffLabel.BackgroundTransparency = 1.000
StaffLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
StaffLabel.BorderSizePixel = 0
StaffLabel.Size = UDim2.new(0, 97, 0, 15)
StaffLabel.Font = Enum.Font.Code
StaffLabel.Text = ""
StaffLabel.TextColor3 = stafflabelcolor
StaffLabel.TextScaled = true
StaffLabel.TextSize = 14.000
StaffLabel.TextStrokeTransparency = 0.500
StaffLabel.TextWrapped = true

local function E_fake_script()
	local script = Instance.new('LocalScript', StaffFrame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(E_fake_script)()

modchecker:AddToggle({
    text = "Staff List",
    tooltip = "Enables/Disables Staff List",
    flag = "StaffList",
    callback = function(v)
        ST329132995293534123.Enabled = v
    end
})

modchecker:AddColor({
    enabled = true,
    text = "Staff Text Color",
    tooltip = "The color of a staff member shown in the staff list.",
    color = Color3.fromRGB(159, 99, 254),
    flag = "StaffTextColor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        stafflabelcolor = v
    end
})

modchecker:AddColor({
    enabled = true,
    text = "Staff Title Color",
    tooltip = "The title color of the staff list.",
    color = Color3.fromRGB(159, 99, 254),
    flag = "StaffTitleColor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        stafftitlecolor = v
    end
})

modchecker:AddColor({
    enabled = true,
    text = "Accent",
    tooltip = "The accent of the staff list.",
    color = Color3.fromRGB(159, 99, 254),
    flag = "StaffListAccent",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        stafflinecolor = v
    end
})

modchecker:AddSlider({
    enabled = true,
    text = "Moderator Notification Volume",
    tooltip = "Changes the notification volume",
    flag = "ModNotificationVol",
    suffix = "",
    dragging = true,
    focused = false,
    min = 1,
    max = 5,
    increment = 0.5,
    risky = false,
    callback = function(v)
        moddetectorvolume = v
    end
}):SetValue(3)

--tracers--

local function runtracer(start, endp)
if tracbool then
    -- Use tracertextures to find the texture ID if tracertexture is a key
    if tracertextures[tracertexture] then
        tracertexture = tracertextures[tracertexture]
    end

    local beam = Instance.new("Beam")
    beam.Name = "LineBeam"
    beam.Parent = game.Workspace

    local startpart = Instance.new("Part")
    startpart.CanCollide = false
    startpart.CanQuery = false
    startpart.Transparency = 1
    startpart.Position = start
    startpart.Parent = workspace
    startpart.Anchored = true
    startpart.Size = Vector3.new(0.01, 0.01, 0.01)

    local endpart = Instance.new("Part")
    endpart.CanCollide = false
    endpart.CanQuery = false
    endpart.Transparency = 1
    endpart.Position = endp
    endpart.Parent = workspace
    endpart.Anchored = true
    endpart.Size = Vector3.new(0.01, 0.01, 0.01)

    beam.Attachment0 = Instance.new("Attachment", startpart)
    beam.Attachment1 = Instance.new("Attachment", endpart)
    beam.Color = ColorSequence.new(traccolor, traccolor)
    beam.Width0 = 0.05
    beam.Width1 = 0.05
    beam.FaceCamera = true
    beam.Transparency = NumberSequence.new(0)
    beam.LightEmission = 1

    if tracertexture then
        beam.Texture = tracertexture
        beam.TextureSpeed = 3
        beam.TextureLength = (endp - start).Magnitude

        if tracertexture == "http://www.roblox.com/asset/?id=75056325012653" then
            beam.Width0 = 0.3
            beam.Width1 = 0.3
        elseif tracertexture == "http://www.roblox.com/asset/?id=118249217749149" then
            beam.Width0 = 0.8
            beam.Width1 = 0.8
        end
    end

    wait(tracwait)

    for i = 0, 1, 0.1 do
        beam.Transparency = NumberSequence.new(i)
        wait(0.01)
    end

    beam:Destroy()
    startpart:Destroy()
    endpart:Destroy()
    end
end

-- silent aim
local function isonscreen(object)
    local _, bool = wcamera:WorldToScreenPoint(object.Position)
    return bool
end
local v311 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"))
local globalist11 = v311.ReturnTable("GlobalIgnoreListProjectile")
local function isvisible(char, object)
    if not localplayer.Character or not localplayer.Character:FindFirstChild("HumanoidRootPart") then
        return false
    end
    if aimvischeck == false then
        return true
    end

    local origin = localplayer.Character.HumanoidRootPart.Position + Vector3.new(0, 1.3, 0)

    local pos = object.Position
    local dir = pos - origin
    local dist = dir.Magnitude + 5
    local penetrated = true
    dir = dir.Unit

    local params = RaycastParams.new()
    params.IgnoreWater = true
    params.CollisionGroup = "WeaponRay"
    params.FilterDescendantsInstances = {
        localplayer.Character:GetChildren(),
        wcamera:GetChildren(),
        globalist11,
        aimignoreparts
    }

    local ray = workspace:Raycast(origin, dir * dist, params)
    if ray and ray.Instance:IsDescendantOf(char) then
        return true
    elseif ray and ray.Instance.Name ~= "Terrain" and not ray.Instance:GetAttribute("NoPen") then
        local armorpen4 = 10
        if globalammo then
            armorpen4 = globalammo:GetAttribute("ArmorPen")
        end

        local FunctionLibraryExtension = require(game.ReplicatedStorage.Modules.FunctionLibraryExtension)
        local armorpen1, newpos2 = FunctionLibraryExtension.Penetration(FunctionLibraryExtension, ray.Instance, ray.Position, dir, armorpen4)
        if armorpen1 == nil or newpos2 == nil then
            return false
        end

        local neworigin = ray.Position + dir * 0.01
        local newray = workspace:Raycast(neworigin, dir * (dist - (neworigin - origin).Magnitude), params)
        if newray and newray.Instance:IsDescendantOf(char) then
            return true
        end
    end

    return false
end
local function predictpos(tpart, bulletspeed, bulletdrop)
    local velocity = tpart.Velocity
    local distance = (wcamera.CFrame.Position - tpart.CFrame.Position).Magnitude
    local tth = (distance / bulletspeed)
    local predict1 = tpart.CFrame.Position + (velocity * tth)
    local delta = (predict1 - tpart.CFrame.Position).Magnitude
    local finalspeed = bulletspeed - 0.013 * bulletspeed ^ 2 * tth ^ 2
    tth += (delta / finalspeed)
    local predictres1 = tpart.CFrame.Position + (velocity * tth)
    local predictres2 = bulletdrop * tth ^ 2
    if tostring(drop_timing):find("nan") then
        predictres2 = 0
    end
    return predictres1 -- + Vector3.new(0,predictres2,0)
end
local function choosetarget()
if not localplayer.Character or not localplayer.Character:FindFirstChild("HumanoidRootPart") or not localplayer.Character:FindFirstChild("Humanoid") then return end
    local cent = Vector2.new(wcamera.ViewportSize.X / 2, wcamera.ViewportSize.Y / 2)
    local cdist = math.huge
    local ctar = nil
    local cpart = nil

    local ammodistance = 999999999
    if aimdistcheck and globalammo then
        ammodistance = globalammo:GetAttribute("MuzzleVelocity")
    end

    local bparts = {
        "Head",
        "HeadTopHitBox",
        "FaceHitBox",
        "UpperTorso",
        "LowerTorso",
        "LeftUpperArm",
        "RightUpperArm",
        "LeftLowerArm",
        "RightLowerArm",
        "LeftHand",
        "RightHand",
        "LeftUpperLeg",
        "RightUpperLeg",
        "LeftLowerLeg",
        "RightLowerLeg",
        "LeftFoot",
        "RightFoot"
    }

    local legparts = {
        "LeftUpperLeg",
        "RightUpperLeg",
        "LeftLowerLeg",
        "RightLowerLeg",
        "LeftFoot",
        "RightFoot"
    }

    local upperparts = {
        "Head",
        "HeadTopHitBox",
        "FaceHitBox",
        "UpperTorso",
        "LowerTorso",
        "LeftUpperArm",
        "RightUpperArm",
        "LeftLowerArm",
        "RightLowerArm"
    }

    local function chooseTpart(charact)
        if aimpart == "Head" then
            return charact:FindFirstChild("Head")
            
        elseif aimpart == "HeadTop" then
            return charact:FindFirstChild("HeadTopHitBox")

        elseif aimpart == "Face" then
            return charact:FindFirstChild("FaceHitBox")

        elseif aimpart == "Upper Body" then
            return charact:FindFirstChild(upperparts[math.random(1, #upperparts)])

        elseif aimpart == "Upper Torso" then
            return charact:FindFirstChild("UpperTorso")
        elseif aimpart == "Lower Torso" then
            return charact:FindFirstChild("LowerTorso")

        elseif aimpart == "Legs" then
            return charact:FindFirstChild(legparts[math.random(1, #legparts)])

        elseif aimpart == "Random" then
            return charact:FindFirstChild(bparts[math.random(1, #bparts)])
        end
    end

    if aimbots then --priority 2 (bots)
        for _, botfold in ipairs(workspace.AiZones:GetChildren()) do
            for _, bot in ipairs(botfold:GetChildren()) do
                if bot:IsA("Model") and bot:FindFirstChild("Humanoid") and bot.Humanoid.Health > 0 then
                    if friendlistbots then
                        if friendlistmode == "Blacklist" then 
                            if table.find(aimFRIENDLIST, bot.Name) ~= nil then
                                continue
                            end
                        elseif friendlistmode == "Whitelist" then 
                            if table.find(aimFRIENDLIST, bot.Name) == nil then
                                continue
                            end
                        end
                    end

                    local potroot = chooseTpart(bot)
                    if potroot and localplayer.Character then
                        local spoint = wcamera:WorldToViewportPoint(potroot.Position)
                        local optpoint = Vector2.new(spoint.X, spoint.Y)
                        local dist = (optpoint - cent).Magnitude

                        local betweendist = (localplayer.Character.PrimaryPart.Position - potroot.Position).Magnitude * 0.3336
                        local betweendistSTUDS = (localplayer.Character.PrimaryPart.Position - potroot.Position).Magnitude
                        if dist <= aimfovcircle.Radius and dist < cdist and betweendist < aimdistance and betweendistSTUDS < ammodistance then
                            local canvis = isvisible(bot, potroot)
                            if canvis and isonscreen(potroot) then
                                cdist = dist
                                ctar = bot
                                cpart = potroot
                            end
                        end
                    end
                end
            end
        end
    end

    for _, pottar in ipairs(game.Players:GetPlayers()) do --priority 1 (players)
        if pottar ~= localplayer and pottar.Character and localplayer.Character.PrimaryPart ~= nil then
            if friendlistmode == "Blacklist" then 
                if table.find(aimFRIENDLIST, pottar.Name) ~= nil then
                    continue
                end
            elseif friendlistmode == "Whitelist" then 
                if table.find(aimFRIENDLIST, pottar.Name) == nil then
                    continue
                end
            end

            local potroot = chooseTpart(pottar.Character)
            if potroot then
                local spoint = wcamera:WorldToViewportPoint(potroot.Position)
                local optpoint = Vector2.new(spoint.X, spoint.Y)
                local dist = (optpoint - cent).Magnitude

                local betweendist = (localplayer.Character.PrimaryPart.Position - potroot.Position).Magnitude * 0.3336
                local betweendistSTUDS = (localplayer.Character.PrimaryPart.Position - potroot.Position).Magnitude
                if dist <= aimfovcircle.Radius and dist < cdist and betweendist < aimdistance and betweendistSTUDS < ammodistance then
                    local canvis = isvisible(pottar.Character, potroot)
                    if canvis and isonscreen(potroot) then
                        cdist = dist
                        ctar = pottar
                        cpart = potroot
                    end
                end
            end
        end
    end

    if ctar == nil then
        aimtarget = nil
        aimtargetpart = nil
    else
        aimtarget = ctar
        aimtargetpart = cpart
    end
end
local tweens = game:GetService("TweenService")
local function runhitmark(v140)
    if hitmarkbool then
        local hitpart = Instance.new("Part", workspace)
        hitpart.Transparency = 1
        hitpart.CanCollide = false
        hitpart.CanQuery = false
        hitpart.Size = Vector3.new(0.01,0.01,0.01)
        hitpart.Anchored = true
        hitpart.Position = v140

        local hit = Instance.new("BillboardGui")
        hit.Name = "_HITMARKER"
        hit.AlwaysOnTop = true
        hit.Parent = hitpart

        local hit_img = Instance.new("ImageLabel")
        hit_img.Name = "_ImageLabel"
        hit_img.BackgroundTransparency = 1
        hit_img.Size = UDim2.new(0, 30, 0, 30)
        hit_img.Visible = true
        hit_img.ImageColor3 = hitmarkcolor
        hit_img.Rotation = 0
        hit_img.AnchorPoint = Vector2.new(0.5, 0.5)
        hit_img.Parent = hit

        if hitmarktexture == "Cross" then
            hit_img.Image = "http://www.roblox.com/asset/?id=8797893157" -- 17133031476
        elseif hitmarktexture == "Heart" then
            hit_img.Image = "http://www.roblox.com/asset/?id=14078245947"
        elseif hitmarktexture == "Star" then
            hit_img.Image = "http://www.roblox.com/asset/?id=15433490778"
        end

        task.spawn(function()
            local tweninfo = TweenInfo.new(hitmarkfade, Enum.EasingStyle.Sine)
            local tweninfo2 = TweenInfo.new(hitmarkfade, Enum.EasingStyle.Linear)
            tweens:Create(hit_img, tweninfo, {ImageTransparency = 1}):Play()
            tweens:Create(hit_img, tweninfo2, {Rotation = 180}):Play()
            task.wait(hitmarkfade)
            hit_img:Destroy()
            hit:Destroy()
        end)
    end
end

aimmodfunc = function(prikol, p49, p50, p_u_51, v88, prikol1, p52, p53, p54, p55)-- prikol, p49, p50, p_u_51, _, p52, p53, p54, p55 \\\\\\\\\\\ _, v85, v86, v87, v88, _, v90, v91, v92
    local v_u_6 = game.ReplicatedStorage.Remotes.VisualProjectile
    local v_u_108 = 1
    local v_u_106 = 0
    local v_u_7 = game.ReplicatedStorage.Remotes.FireProjectile
    local target = aimtarget
    local target_part
    local v_u_4 = require(game.ReplicatedStorage.Modules:WaitForChild("FunctionLibraryExtension"))
    local v_u_15 = localplayer
    local v_u_115 = v_u_4:GetEstimatedCameraPosition(v_u_15)
    local v_u_103
    local v_u_114
    local v_u_16 = game.ReplicatedStorage.Players:FindFirstChild(v_u_15.Name)
    local v_u_64 = v_u_16.Status.GameplayVariables:GetAttribute("EquipId")
    local v_u_13 = game.ReplicatedStorage:WaitForChild("VFX")
    local v_u_2 = require(game.ReplicatedStorage.Modules:WaitForChild("VFX"))
    local v3 = require(game.ReplicatedStorage.Modules:WaitForChild("UniversalTables"))
    local v_u_5 = game.ReplicatedStorage.Remotes.ProjectileInflict
    local v_u_10 = game:GetService("ReplicatedStorage")
    local v_u_12 = v_u_10:WaitForChild("RangedWeapons")
    local v_u_17 = game.ReplicatedStorage.Temp
    local v_u_56 = v_u_15.Character
    local v135 = 500000
    local v_u_18 = v3.ReturnTable("GlobalIgnoreListProjectile")
    local v_u_115 = v_u_4:GetEstimatedCameraPosition(v_u_15)
    local v65 = v_u_10.AmmoTypes:FindFirstChild(p52)
    local v_u_74 = v65:GetAttribute("Pellets")
    local v60 = p50.ItemRoot
    local v61 = p49.ItemProperties
    local v62 = v_u_12:FindFirstChild(p49.Name)
    local v63 = v61:FindFirstChild("SpecialProperties")
    local v_u_66 = v63 and v63:GetAttribute("TracerColor") or v62:GetAttribute("ProjectileColor")
    local itemprop = require(v_u_16.Inventory:FindFirstChild(p49.Name).SettingsModule)
    local bulletspeed = v65:GetAttribute("MuzzleVelocity")
    local armorpen4 = v65:GetAttribute("ArmorPen")
    local tracerendpos = nil
    local v79 = {
        ["x"] = {
            ["Value"] = 0
        },
        ["y"] = {
            ["Value"] = 0
        }
    }

    if v_u_56:FindFirstChild(p49.Name) then
        local v83 = 0.001 
        local v82 = 0.001
        local v81 = 10000
        if v61.Tool:GetAttribute("MuzzleDevice") or "Default" == "Suppressor" then
            if tick() - p53 < 0.8 then
                v_u_4:PlaySoundV2(v60.FireSoundSupressed, v60.FireSoundSupressed.TimeLength, v_u_17)
            else
                v_u_4:PlaySoundV2(v60.FireSoundSupressed, v60.FireSoundSupressed.TimeLength, v_u_17)
            end
        elseif tick() - p53 < 0.8 then
            v_u_4:PlaySoundV2(v60.FireSound, v60.FireSound.TimeLength, v_u_17)
        else
            v_u_4:PlaySoundV2(v60.FireSound, v60.FireSound.TimeLength, v_u_17)
        end
        local v_u_59
        if p_u_51.Item.Attachments:FindFirstChild("Front") then
            v_u_59 = p_u_51.Item.Attachments.Front:GetChildren()[1].Barrel
            local _ = p50.Attachments.Front:GetChildren()[1].Barrel
        else
            v_u_59 = p_u_51.Item.Barrel
            local _ = p50.Barrel
        end

        if target ~= nil and aimtargetpart ~= nil then
            target_part = aimtargetpart
            if aimtype == "Prediction" then
                local buldrop = v65:GetAttribute("ProjectileDrop")
                local bulsp = v65:GetAttribute("MuzzleVelocity")
                target_part = predictpos(target_part, bulsp, buldrop)
                v_u_103 = CFrame.new(v_u_115, target_part).LookVector
            else
                v_u_103 = CFrame.new(v_u_115, target_part.Position).LookVector
            end
            v_u_114 = v_u_103
        else
            target_part = p55
            v_u_103 = CFrame.new(v_u_115, v_u_15:GetMouse().Hit.Position).LookVector
            v_u_114 = v_u_103
        end

        function v185()
            local v_u_110 = RaycastParams.new()
            v_u_110.FilterType = Enum.RaycastFilterType.Exclude
            local v_u_111 = { v_u_56, p_u_51, v_u_18, aimignoreparts}
            v_u_110.FilterDescendantsInstances = v_u_111
            v_u_110.CollisionGroup = "WeaponRay"
            v_u_110.IgnoreWater = true

            v_u_106 += 1

            local usethisvec = v_u_114
            if aimdebug1 then
                usethisvec = Vector3.new(0,1,0)
            end

            if v_u_106 == 1 then
                task.spawn(function()
                    for i=1, multitaps do
                        if aimtype == "Silent Aim" then
                            if not v_u_7:InvokeServer(usethisvec, v_u_108, tick()-15) then 
                                game.ReplicatedStorage.Modules.FPS.Binds.AdjustBullets:Fire(v_u_64, 1)
                            end
                        else
                            if not v_u_7:InvokeServer(usethisvec, v_u_108, tick()) then 
                                game.ReplicatedStorage.Modules.FPS.Binds.AdjustBullets:Fire(v_u_64, 1)
                            end
                        end
                    end
                end)
            elseif 1 < v_u_106 then
                for i=1, multitaps do
                    v_u_6:FireServer(usethisvec, v_u_108)
                end
            end

            local v_u_131 = nil
            local v_u_132 = 0
            local v_u_133 = 0

            if (aimtype == "Prediction" or aimfakewait) and target ~= nil then
                local tpart 
                if target:IsA("Model") then
                    tpart = target.HumanoidRootPart
                else
                    tpart = target.Character.HumanoidRootPart
                end
                local velocity = tpart.Velocity
                local distance = (wcamera.CFrame.Position - tpart.CFrame.Position).Magnitude
                local tth = (distance / bulletspeed)
                task.wait(tth + 0.01)

                if aimtarget ~= nil and aimtargetpart ~= nil then
                    target_part = aimtargetpart
                    if aimtype == "Prediction" then
                        local buldrop = v65:GetAttribute("ProjectileDrop")
                        local bulsp = v65:GetAttribute("MuzzleVelocity")
                        target_part = predictpos(target_part, bulsp, buldrop)
                        v_u_103 = CFrame.new(v_u_115, target_part).LookVector
                    else
                        v_u_103 = CFrame.new(v_u_115, target_part.Position).LookVector
                    end
                    v_u_114 = v_u_103
                else
                    target_part = p55
                    v_u_103 = CFrame.new(v_u_115, v_u_15:GetMouse().Hit.Position).LookVector
                    v_u_114 = v_u_103
                end
            end

            local penetrated = false

            function v184(p134)
                v_u_132 = v_u_132 + p134
                if true then
                    v_u_133 = v_u_133 + v_u_132
                    local v136 = workspace:Raycast(v_u_115, v_u_114 * v135, v_u_110)
                    local v137 = nil
                    local v138 = nil
                    local v139 = nil
                    local v140
                    if v136 then
                        v137 = v136.Instance
                        v140 = v136.Position
                        v138 = v136.Normal
                        v139 = v136.Material
                    else
                        v140 = v_u_115 + v_u_114 * v135
                    end

                    if v137 == nil then
                        v_u_131:Disconnect()
                        return
                    end

                    tracerendpos = v140

                    local v171 = v_u_4:FindDeepAncestor(v137, "Model")
                    if v171:FindFirstChild("Humanoid") then -- if hit target
                        local ran = math.random(1, 100)
                        local ranbool = ran <= aimchance
                        if ranbool then
                            local v175 = v137.CFrame:ToObjectSpace(CFrame.new(v140))

                            if target_part and penetrated == false then
                                v_u_5:FireServer(target_part, v175, v_u_108, tick())
                            else
                                v_u_5:FireServer(v137, v175, v_u_108, tick())
                            end
                        else
                            local v175 = v137.CFrame:ToObjectSpace(CFrame.new(v140))
                            v_u_5:FireServer(p55, v175, v_u_108, tick())
                        end

                        v_u_2.Impact(v137, v140, v138, v139, v_u_114, "Ranged", true)

                        task.spawn(function()
                            runhitmark(v140)
                        end)
                    elseif v137.Name == "Terrain" then -- if hit terrain
                        local v175 = v137.CFrame:ToObjectSpace(CFrame.new(v140))
                        v_u_5:FireServer(v137, v175, v_u_108, tick())

                        v_u_2.Impact(v137, v140, v138, v139, v_u_114, "Ranged", true)

                        task.spawn(function()
                            runhitmark(v140)
                        end)
                    else -- if hit not target then try wallpen
                        v_u_2.Impact(v137, v140, v138, v139, v_u_114, "Ranged", true)

                        task.spawn(function()
                            runhitmark(v140)
                        end)

                        local arg1, arg2, arg3 = v_u_4.Penetration(v_u_4, v137, v140, v_u_114, armorpen4)
                        if arg1 == nil or arg2 == nil then
                            local v175 = v137.CFrame:ToObjectSpace(CFrame.new(v140))
                            v_u_5:FireServer(v137, v175, v_u_108, tick())
                            v_u_131:Disconnect()
                            return
                        end

                        armorpen4 = arg1
                        if armorpen4 > 0 then
                            v_u_115 = arg2
                            v_u_2.Impact(unpack(arg3))
                            penetrated = true
                            return
                        end

                        v_u_131:Disconnect()
                        return
                    end
                end

                v_u_131:Disconnect()
                return
            end
            v_u_131 = game:GetService("RunService").RenderStepped:Connect(v184)
            return
        end
        if v_u_74 == nil then
            task.spawn(v185)
        else
            for _ = 1, v_u_74 do
                task.spawn(v185)
            end
        end

        if tracbool then
            task.spawn(function()
                task.wait(0.05)
                if tracerendpos == nil then return end
                runtracer(v60.Position, tracerendpos)
            end)
        end

        return v83, v82, v81, v79
    end
end

--nosway
viewmodoffset = false
do
    local mod = require(game.ReplicatedStorage.Modules.FPS)
    local ogfunc = mod.updateClient

    mod.updateClient = function(a1,a2,a3)
        arg1, arg2, arg3 = ogfunc(a1,a2,a3)
        
        a1table = a1
        
        if NoSway then
            a1.springs.sway.Position = Vector3.new(0,0,0)
            a1.springs.walkCycle.Position = Vector3.new(0,0,0)
            a1.springs.sprintCycle.Position = Vector3.new(0,0,0)
            a1.springs.strafeTilt.Position = Vector3.new(0,0,0)
            a1.springs.jumpTilt.Position = Vector3.new(0,0,0)
            a1.springs.sway.Speed = 0
            a1.springs.walkCycle.Speed = 0
            a1.springs.sprintCycle.Speed = 0
            a1.springs.strafeTilt.Speed = 0
            a1.springs.jumpTilt.Speed = 0
        else
            a1.springs.sway.Speed = 4
            a1.springs.walkCycle.Speed = 4
            a1.springs.sprintCycle.Speed = 4
            a1.springs.strafeTilt.Speed = 4
            a1.springs.jumpTilt.Speed = 4
        end
        if viewmodoffset then
            a1.sprintIdleOffset = CFrame.new(Vector3.new(viewmodX, viewmodY, viewmodZ))
            a1.weaponOffset = CFrame.new(Vector3.new(viewmodX, viewmodY, viewmodZ))
            a1.AimInSpeed = 9e9
        else
            a1.AimInSpeed = 0.4
        end

        return arg1, arg2, arg3
    end
end

-- camera offset
require(game.Players.LocalPlayer.PlayerScripts.PlayerModule.CameraModule.TransparencyController).Update = function(a1, a2) -- transparency = camthirdp and 1 or 0
    local v14_3_ = workspace
    local v14_2_ = v14_3_.CurrentCamera

    local setto = 0
    if camthirdp == false and thirdpersonvisualizer == false then
        setto = 1
    end

    if thirdpersonvisualizer == true then
        setto = 0
    end

    if v14_2_ then
        v14_3_ = a1.enabled
        if v14_3_ then
            local v14_6_ = v14_2_.Focus
            local v14_5_ = v14_6_.p
            local v14_7_ = v14_2_.CoordinateFrame
            v14_6_ = v14_7_.p
            local v14_4_ = v14_5_ - v14_6_
            v14_3_ = v14_4_.magnitude
            v14_5_ = 2
            v14_4_ = 0
            v14_5_ = 0.500000
            if v14_4_ < v14_5_ then
                v14_4_ = 0
            end
            v14_5_ = a1.lastTransparency
            if v14_5_ then
                v14_5_ = 1
                if v14_4_ < v14_5_ then
                    v14_5_ = a1.lastTransparency
                    v14_6_ = 0.950000
                    if v14_5_ < v14_6_ then
                        v14_6_ = a1.lastTransparency
                        v14_5_ = v14_4_ - v14_6_
                        v14_7_ = 2.800000
                        v14_6_ = v14_7_ * a2
                        local v14_9_ = -v14_6_
                        local v14_8_ = v14_5_
                        local v14_10_ = v14_6_
                        local clamp = math.clamp
                        v14_7_ = clamp(v14_8_, v14_9_, v14_10_)
                        v14_5_ = v14_7_
                        v14_7_ = a1.lastTransparency
                        v14_4_ = v14_7_ + v14_5_
                    else
                        v14_5_ = true
                        a1.transparencyDirty = v14_5_
                    end
                else
                    v14_5_ = true
                    a1.transparencyDirty = v14_5_
                end
            else
                v14_5_ = true
                a1.transparencyDirty = v14_5_
            end
            v14_7_ = v0_2_
            v14_7_ = v14_4_
            local v14_8_ = 2
            v14_7_ = 0
            v14_8_ = 1
            v14_4_ = v14_5_
            v14_5_ = a1.transparencyDirty
            if not v14_5_ then
                v14_5_ = a1.lastTransparency
                if v14_5_ ~= v14_4_ then
                    v14_5_ = pairs
                    v14_6_ = a1.cachedParts
                    v14_5_, v14_6_, v14_7_ = v14_5_(v14_6_)
                    for v14_8_, v14_9_ in v14_5_, v14_6_, v14_7_ do
                        local v14_11_ = v0_0_
                        local v14_10_ = false
                        if v14_10_ then
                            v14_11_ = v0_0_
                            v14_10_ = v14_11_.AvatarGestures
                            if v14_10_ then
                                v14_10_ = {}
                                local Hat = Enum.AccessoryType.Hat
                                local v14_12_ = true
                                v14_10_[Hat] = v14_12_
                                local Hair = Enum.AccessoryType.Hair
                                v14_12_ = true
                                v14_10_[Hair] = v14_12_
                                local Face = Enum.AccessoryType.Face
                                v14_12_ = true
                                v14_10_[Face] = v14_12_
                                local Eyebrow = Enum.AccessoryType.Eyebrow
                                v14_12_ = true
                                v14_10_[Eyebrow] = v14_12_
                                local Eyelash = Enum.AccessoryType.Eyelash
                                v14_12_ = true
                                v14_10_[Eyelash] = v14_12_
                                v14_11_ = v14_8_.Parent
                                local v14_13_ = "Accessory"
                                v14_11_ = v14_11_:IsA(v14_13_)
                                if v14_11_ then
                                    v14_13_ = v14_8_.Parent
                                    v14_12_ = v14_13_.AccessoryType
                                    v14_11_ = v14_10_[v14_12_]
                                    if not v14_11_ then
                                        v14_11_ = v14_8_.Name
                                        if v14_11_ == "Head" then
                                            v14_8_.LocalTransparencyModifier = setto
                                        else
                                            v14_11_ = 0
                                            v14_8_.LocalTransparencyModifier = setto
                                            v14_8_.LocalTransparencyModifier = setto
                                        end
                                    end
                                end
                                v14_11_ = v14_8_.Name
                                if v14_11_ == "Head" then
                                    v14_8_.LocalTransparencyModifier = setto
                                else
                                    v14_11_ = 0
                                    v14_8_.LocalTransparencyModifier = setto
                                    v14_8_.LocalTransparencyModifier = setto
                                end
                            else
                                v14_8_.LocalTransparencyModifier = setto
                            end
                        else
                            v14_8_.LocalTransparencyModifier = setto
                        end
                    end
                    v14_5_ = false
                    a1.transparencyDirty = v14_5_
                    a1.lastTransparency = setto
                end
            end
            v14_5_ = pairs
            v14_6_ = a1.cachedParts
            v14_5_, v14_6_, v14_7_ = v14_5_(v14_6_)
            for v14_8_, v14_9_ in v14_5_, v14_6_, v14_7_ do
                local v14_11_ = v0_0_
                local v14_10_ = false
                if v14_10_ then
                    v14_11_ = v0_0_
                    v14_10_ = v14_11_.AvatarGestures
                    if v14_10_ then
                        v14_10_ = {}
                        local Hat = Enum.AccessoryType.Hat
                        local v14_12_ = true
                        v14_10_[Hat] = v14_12_
                        local Hair = Enum.AccessoryType.Hair
                        v14_12_ = true
                        v14_10_[Hair] = v14_12_
                        local Face = Enum.AccessoryType.Face
                        v14_12_ = true
                        v14_10_[Face] = v14_12_
                        local Eyebrow = Enum.AccessoryType.Eyebrow
                        v14_12_ = true
                        v14_10_[Eyebrow] = v14_12_
                        local Eyelash = Enum.AccessoryType.Eyelash
                        v14_12_ = true
                        v14_10_[Eyelash] = v14_12_
                        v14_11_ = v14_8_.Parent
                        local v14_13_ = "Accessory"
                        v14_11_ = v14_11_:IsA(v14_13_)
                        if v14_11_ then
                            v14_13_ = v14_8_.Parent
                            v14_12_ = v14_13_.AccessoryType
                            v14_11_ = v14_10_[v14_12_]
                            if not v14_11_ then
                                v14_11_ = v14_8_.Name
                                if v14_11_ == "Head" then
                                    v14_8_.LocalTransparencyModifier = setto
                                else
                                    v14_11_ = 0
                                    v14_8_.LocalTransparencyModifier = setto
                                    v14_8_.LocalTransparencyModifier = setto
                                end
                            end
                        end
                        v14_11_ = v14_8_.Name
                        if v14_11_ == "Head" then
                            v14_8_.LocalTransparencyModifier = setto
                        else
                            v14_11_ = 0
                            v14_8_.LocalTransparencyModifier = setto
                            v14_8_.LocalTransparencyModifier = setto
                        end
                    else
                        v14_8_.LocalTransparencyModifier = setto
                    end
                else
                    v14_8_.LocalTransparencyModifier = setto
                end
            end
            v14_5_ = false
            a1.transparencyDirty = v14_5_
            a1.lastTransparency = setto
        end
    end
end

--instareload

instrelMODfunc = function(a1,a2)
    local function aaa(a1)
        local v27_2_ = a1.weapon
        local v27_1_ = v27_2_.Attachments
        local v27_3_ = "Magazine"
        v27_1_ = v27_1_:FindFirstChild(v27_3_)
        if v27_1_ then
            local v27_4_ = a1.weapon
            v27_3_ = v27_4_.Attachments
            v27_2_ = v27_3_.Magazine
            v27_2_ = v27_2_:GetChildren()
            v27_1_ = v27_2_[-1]
            if v27_1_ then
                v27_2_ = v27_1_.ItemProperties
                v27_4_ = "LoadedAmmo"
                v27_2_ = v27_2_:GetAttribute(v27_4_)
                a1.Bullets = v27_2_
                v27_2_ = {}
                a1.BulletsList = v27_2_
                v27_3_ = v27_1_.ItemProperties
                v27_2_ = v27_3_.LoadedAmmo
                v27_3_ = v27_2_:GetChildren()
                local v27_6_ = 1
                v27_4_ = #v27_3_
                local v27_5_ = 1
                for v27_6_ = v27_6_, v27_4_, v27_5_ do
                    local v27_7_ = a1.BulletsList
                    local v27_10_ = v27_3_[v27_6_]
                    local v27_9_ = v27_10_.Name
                    local v27_8_ = tonumber
                    v27_8_ = v27_8_(v27_9_)
                    v27_9_ = {}
                    v27_10_ = v27_3_[v27_6_]
                    local v27_12_ = "AmmoType"
                    v27_10_ = v27_10_:GetAttribute(v27_12_)
                    v27_9_.AmmoType = v27_10_
                    v27_10_ = v27_3_[v27_6_]
                    v27_12_ = "Amount"
                    v27_10_ = v27_10_:GetAttribute(v27_12_)
                    v27_9_.Amount = v27_10_
                    v27_7_[v27_8_] = v27_9_
                end
            end
            v27_2_ = 0
            a1.movementModifier = v27_2_
            v27_2_ = a1.weapon
            if v27_2_ then
                v27_2_ = a1.movementModifier
                local v27_6_ = a1.weapon
                local v27_5_ = v27_6_.ItemProperties
                v27_4_ = v27_5_.Tool
                v27_6_ = "MovementModifer"
                v27_4_ = v27_4_:GetAttribute(v27_6_)
                v27_3_ = v27_4_ or 0.000000
                v27_2_ += v27_3_
                a1.movementModifier = v27_2_
                v27_2_ = a1.weapon
                v27_4_ = "Attachments"
                v27_2_ = v27_2_:FindFirstChild(v27_4_)
                if v27_2_ then
                    v27_3_ = a1.weapon
                    v27_2_ = v27_3_.Attachments
                    v27_2_ = v27_2_:GetChildren()
                    v27_5_ = 1
                    v27_3_ = #v27_2_
                    v27_4_ = 1
                    for v27_5_ = v27_5_, v27_3_, v27_4_ do
                        v27_6_ = v27_2_[v27_5_]
                        local v27_8_ = "StringValue"
                        v27_6_ = v27_6_:FindFirstChildOfClass(v27_8_)
                        if v27_6_ then
                            local v27_7_ = v27_6_.ItemProperties
                            local v27_9_ = "Attachment"
                            v27_7_ = v27_7_:FindFirstChild(v27_9_)
                            if v27_7_ then
                                v27_7_ = a1.movementModifier
                                local v27_10_ = v27_6_.ItemProperties
                                v27_9_ = v27_10_.Attachment
                                local v27_11_ = "MovementModifer"
                                v27_9_ = v27_9_:GetAttribute(v27_11_)
                                v27_8_ = v27_9_ or 0.000000
                                v27_7_ += v27_8_
                                a1.movementModifier = v27_7_
                            end
                        end
                        return
                    end
                end
            end
        end
        v27_2_ = a1.weapon
        v27_1_ = v27_2_.ItemProperties
        v27_3_ = "LoadedAmmo"
        v27_1_ = v27_1_:GetAttribute(v27_3_)
        a1.Bullets = v27_1_
        v27_1_ = {}
        a1.BulletsList = v27_1_
        v27_3_ = a1.weapon
        v27_2_ = v27_3_.ItemProperties
        v27_1_ = v27_2_.LoadedAmmo
        v27_2_ = v27_1_:GetChildren()
        local v27_5_ = 1
        v27_3_ = #v27_2_
        local v27_4_ = 1
        for v27_5_ = v27_5_, v27_3_, v27_4_ do
            local v27_6_ = a1.BulletsList
            local v27_9_ = v27_2_[v27_5_]
            local v27_8_ = v27_9_.Name
            local v27_7_ = tonumber
            v27_7_ = v27_7_(v27_8_)
            v27_8_ = {}
            v27_9_ = v27_2_[v27_5_]
            local v27_11_ = "AmmoType"
            v27_9_ = v27_9_:GetAttribute(v27_11_)
            v27_8_.AmmoType = v27_9_
            v27_9_ = v27_2_[v27_5_]
            v27_11_ = "Amount"
            v27_9_ = v27_9_:GetAttribute(v27_11_)
            v27_8_.Amount = v27_9_
            v27_6_[v27_7_] = v27_8_
        end
    end
    local v103_2_ = a1.viewModel
    if v103_2_ then
        local v103_3_ = a1.viewModel
        v103_2_ = v103_3_.Item
        local v103_4_ = "AmmoTypes"
        v103_2_ = v103_2_:FindFirstChild(v103_4_)
        if v103_2_ then
            local v103_5_ = a1.weapon
            v103_4_ = v103_5_.ItemProperties
            v103_3_ = v103_4_.AmmoType
            v103_2_ = v103_3_.Value
            v103_5_ = a1.viewModel
            v103_4_ = v103_5_.Item
            v103_3_ = v103_4_.AmmoTypes
            v103_3_ = v103_3_:GetChildren()
            local v103_6_ = 1
            v103_4_ = #v103_3_
            v103_5_ = 1
            for v103_6_ = v103_6_, v103_4_, v103_5_ do
                local v103_7_ = v103_3_[v103_6_]
                local v103_8_ = 1
                v103_7_.Transparency = v103_8_
            end
            v103_6_ = a1.viewModel
            v103_5_ = v103_6_.Item
            v103_4_ = v103_5_.AmmoTypes
            v103_6_ = v103_2_
            v103_4_ = v103_4_:FindFirstChild(v103_6_)
            v103_5_ = 0
            v103_4_.Transparency = v103_5_
            v103_5_ = a1.viewModel
            v103_4_ = v103_5_.Item
            v103_6_ = "AmmoTypes2"
            v103_4_ = v103_4_:FindFirstChild(v103_6_)
            if v103_4_ then
                v103_6_ = a1.viewModel
                v103_5_ = v103_6_.Item
                v103_4_ = v103_5_.AmmoTypes2
                v103_4_ = v103_4_:GetChildren()
                local v103_7_ = 1
                v103_5_ = #v103_4_
                v103_6_ = 1
                for v103_7_ = v103_7_, v103_5_, v103_6_ do
                    local v103_8_ = v103_4_[v103_7_]
                    local v103_9_ = 1
                    v103_8_.Transparency = v103_9_
                end
                v103_7_ = a1.viewModel
                v103_6_ = v103_7_.Item
                v103_5_ = v103_6_.AmmoTypes2
                v103_7_ = v103_2_
                v103_5_ = v103_5_:FindFirstChild(v103_7_)
                v103_6_ = 0
                v103_5_.Transparency = v103_6_
            end
        end
        v103_2_ = a1.reloading
        if v103_2_ == false then
            v103_2_ = a1.cancellingReload
            if v103_2_ == false then
                v103_2_ = a1.MaxAmmo
                v103_3_ = 0
                if v103_3_ < v103_2_ then
                    v103_3_ = true
                    local v103_6_ = 1
                    local v103_7_ = a1.CancelTables
                    v103_4_ = #v103_7_
                    local v103_5_ = 1
                    for v103_6_ = v103_6_, v103_4_, v103_5_ do
                        local v103_9_ = a1.CancelTables
                        local v103_8_ = v103_9_[v103_6_]
                        v103_7_ = v103_8_.Visible
                        if v103_7_ == true then
                            v103_3_ = false
                        else
                        end
                    end
                    v103_2_ = v103_3_
                    if v103_2_ then
                        v103_3_ = a1.clientAnimationTracks
                        v103_2_ = v103_3_.Inspect
                        if v103_2_ then
                            v103_3_ = a1.clientAnimationTracks
                            v103_2_ = v103_3_.Inspect
                            v103_2_:Stop()
                            v103_3_ = a1.serverAnimationTracks
                            v103_2_ = v103_3_.Inspect
                            v103_2_:Stop()
                            v103_4_ = a1.WeldedTool
                            v103_3_ = v103_4_.ItemRoot
                            v103_2_ = v103_3_.Inspect
                            v103_2_:Stop()
                        end
                        v103_3_ = a1.settings
                        v103_2_ = v103_3_.AimWhileActing
                        if not v103_2_ then
                            v103_2_ = a1.isAiming
                            if v103_2_ then
                                v103_4_ = false
                                a1:aim(v103_4_)
                            end
                        end
                        
                        if a1.reloadType == "loadByHand" then
                            local count = a1.Bullets
                            local maxcount = a1.MaxAmmo

                            for i=count, maxcount do 
                                game.ReplicatedStorage.Remotes.Reload:InvokeServer(nil, 0.001, nil)
                            end

                            aaa(a1)
                        else
                            game.ReplicatedStorage.Remotes.Reload:InvokeServer(nil, 0.001, nil)

                            require(game.ReplicatedStorage.Modules.FPS).equip(a1, a1.weapon, nil)

                            aaa(a1)
                        end      
                    end
                end
            end
        end
    end
end


--instantequip

workspace.Camera.ChildAdded:Connect(function(ch)
    if InstaEquip and ch:IsA("Model") then
        task.wait(0.015)
        for i,v in ch.Humanoid.Animator:GetPlayingAnimationTracks() do
            if v.Animation.Name == "Equip" then
                --v:AdjustSpeed(15)
                v.TimePosition = v.Length - 0.01
            end
        end
    end
end)

--hitsounds
localplayer.CharacterAdded:Connect(function(lchar)
    local maingui = localplayer.PlayerGui:WaitForChild("MainGui")
    if maingui then
        maingui.ChildAdded:Connect(function(Sound)
            if Sound:IsA("Sound") and hitsoundbool then
                if Sound.SoundId == "rbxassetid://4585351098" or Sound.SoundId == "rbxassetid://4585382589" then --headshot
                    Sound.SoundId = hitsoundlib[hitsoundhead]
                elseif Sound.SoundId == "rbxassetid://4585382046" or Sound.SoundId == "rbxassetid://4585364605" then --bodyshot
                    Sound.SoundId = hitsoundlib[hitsoundbody]
                end
            end
        end)
    end
end)
localplayer.PlayerGui.MainGui.ChildAdded:Connect(function(Sound)
    if Sound:IsA("Sound") and hitsoundbool then
        if Sound.SoundId == "rbxassetid://4585351098" or Sound.SoundId == "rbxassetid://4585382589" then --headshot
            Sound.SoundId = hitsoundlib[hitsoundhead]
        elseif Sound.SoundId == "rbxassetid://4585382046" or Sound.SoundId == "rbxassetid://4585364605" then --bodyshot
            Sound.SoundId = hitsoundlib[hitsoundbody]
        end
    end
end)

--esp--

local function setupesp(obj, dtype, otype1)
    local dobj
    local tableinfo
    if dtype == "Name" then
        dobj = Drawing.new("Text")
        dobj.Visible = espbool
        dobj.Center = true
        dobj.Outline = true
        dobj.Size = esptextsize
        dobj.Color = espnamecolor
        dobj.OutlineColor = Color3.new(0, 0, 0)
        tableinfo = {
            primary = obj,
            type = "Name",
            otype = otype1
        }
    elseif dtype == "HP" then
        dobj = Drawing.new("Text")
        dobj.Visible = espbool
        dobj.Center = true
        dobj.Outline = true
        dobj.Size = esptextsize
        dobj.Color = esphpcolor
        dobj.OutlineColor = Color3.new(0, 0, 0)
        tableinfo = {
            primary = obj,
            type = "HP",
            otype = otype1
        }
    elseif dtype == "Distance" then
        dobj = Drawing.new("Text")
        dobj.Visible = espbool
        dobj.Center = true
        dobj.Outline = true
        dobj.Size = esptextsize
        dobj.Color = espdistcolor
        dobj.OutlineColor = Color3.new(0, 0, 0)
        tableinfo = {
            primary = obj,
            type = "Distance",
            otype = otype1
        }
    elseif dtype == "Hotbar" then
        dobj = Drawing.new("Text")
        dobj.Visible = espbool
        dobj.Center = true
        dobj.Outline = true
        dobj.Size = esptextsize
        dobj.Color = esphotbarcolor
        dobj.OutlineColor = Color3.new(0, 0, 0)
        tableinfo = {
            primary = obj,
            type = "Hotbar",
            otype = otype1
        }
    elseif dtype == "Highlight" then
        dobj = Instance.new("Highlight")
        dobj.Name = math.random(10,100)
        dobj.FillColor = espfillcolor
        dobj.OutlineColor = esplinecolor
        dobj.FillTransparency = espchamsfill
        dobj.OutlineTransparency = espchamsline
        dobj.DepthMode = occludedchams and Enum.HighlightDepthMode.Occluded or Enum.HighlightDepthMode.AlwaysOnTop
        if obj.Parent:IsA("Model") then
            dobj.Parent = obj.Parent
        else
            dobj:Destroy()
            return
        end

        dobj.Enabled = esphigh
        tableinfo = {
            primary = obj,
            type = "Highlight",
            otype = otype1
        }
    end

    if dobj == nil or tableinfo == nil then return end

    local function sd()
        if dtype == "Highlight" then
            dobj.Enabled = false
            dobj:Destroy()
        else
            dobj.Visible = false
            dobj:Destroy() -- Use :Destroy() instead of :Remove()
        end
        if removing then
            removing:Disconnect()
            removing = nil
        end
        return
    end


    if esptable[dobj] ~= nil then
        sd()
        return
    else
        esptable[dobj] = tableinfo
    end

    removing = workspace.DescendantRemoving:Connect(function(what)
        if what == obj then
            esptable[dobj] = nil
            sd()
        end
    end)
end
local function startesp(v, otype)
    task.spawn(function()
        if otype == "Extract" then
            setupesp(v, "Name", otype)
            setupesp(v, "Distance", otype)
        elseif otype == "Loot" then
            local Amount
            local TotalPrice = 0
            local Value = 0

            if v.Parent and v.Parent:FindFirstChild("Inventory") then else
                return
            end

            for _, i in ipairs(v.Parent.Inventory:GetChildren()) do
                Amount = i.ItemProperties:GetAttribute("Amount") or 1
                TotalPrice += i.ItemProperties:GetAttribute("Price") or 0
                Value += (valcache[i.ItemProperties:GetAttribute("CallSign")] or 0) * Amount
            end

            if Value >= 4 then
                setupesp(v, "Name", otype)
                setupesp(v, "Hotbar", otype)
                setupesp(v, "Distance", otype)
            end
        elseif otype == "Dead333" then
            local hd = v:WaitForChild("Head",1)
            if hd == nil then return end
            setupesp(hd, "Name", otype)
            setupesp(hd, "Distance", otype)
        else
            local hd = v:WaitForChild("Head",1)
            if hd == nil then return end
            setupesp(hd, "Name", otype)
            setupesp(hd, "HP", otype)
            setupesp(hd, "Distance", otype)
            setupesp(hd, "Hotbar", otype)
            setupesp(hd, "Highlight", otype) 
        end
    end)
end
for i,v in ipairs(workspace:GetDescendants()) do
    if v and v:FindFirstChild("Humanoid") and v ~= localplayer.Character then
        if game.Players:FindFirstChild(v.Name) and not v:FindFirstAncestor("DroppedItems") then
            startesp(v, "Plr")
        elseif v:FindFirstAncestor("AiZones") then
            startesp(v, "Bot333")
        elseif v:FindFirstAncestor("DroppedItems") then
            startesp(v, "Dead333")
        end
    elseif v.Parent == workspace:FindFirstChild("NoCollision"):FindFirstChild("ExitLocations") then
        startesp(v, "Extract")
    elseif v:FindFirstAncestor("Containers") and v:IsA("MeshPart") then
        if v.Parent:IsA("Model") then
            startesp(v, "Loot")
        end
    end
end
workspace.DescendantAdded:Connect(function(v)
    if v and v.Parent and v:IsA("BasePart") and v.Name == "Head" then
        local hum = v.Parent:WaitForChild("Humanoid", 2)
        if hum and v.Parent ~= localplayer.Character then
            if game.Players:FindFirstChild(v.Parent.Name) and not v:FindFirstAncestor("DroppedItems") then
                startesp(v.Parent, "Plr")
            elseif v:FindFirstAncestor("AiZones") then
                startesp(v.Parent, "Bot333")
            elseif v:FindFirstAncestor("DroppedItems") then
                startesp(v.Parent, "Dead333")
            end
        end
    elseif v.Parent == workspace:FindFirstChild("NoCollision"):FindFirstChild("ExitLocations") then
        startesp(v, "Extract")
    elseif v:FindFirstAncestor("Containers") and v:IsA("MeshPart") then
        if v.Parent:IsA("Model") then
            startesp(v, "Loot")
        end
    end
end)

--fullbright--

if worldvisualstoggle then
    pcall(function()
        lighting.Ambient = worldambient
        lighting.OutdoorAmbient = worldoutdoor
        lighting.Brightness = 1
        lighting.FogEnd = 100000
        lighting.GlobalShadows = false
        
        for _, v in pairs(lighting:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
        
        for _, v in pairs(lighting:GetDescendants()) do
            if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                v.Enabled = false
            end
        end
        
        lighting.Changed:Connect(function()
            lighting.Ambient = worldambient
            lighting.Brightness = 1
            lighting.FogEnd = 100000
            lighting.OutdoorAmbient = worldoutdoor
            lighting.ClockTime = worldclock
            
            for _, v in pairs(lighting:GetChildren()) do
                if v:IsA("Atmosphere") then
                    v:Destroy()
                end
            end
        end)
    end)
end


--inventory checker--

local function UpdateInventoryViewerLooks()
    Ammo.TextColor3 = ammotextcolor
    Ammo_2.TextColor3 = ammotextcolor
    Ammo_3.TextColor3 = ammotextcolor
    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, inventorygradient1), ColorSequenceKeypoint.new(1.00, inventorygradient2)}
    UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, inventorygradient1), ColorSequenceKeypoint.new(1.00, inventorygradient2)}
    UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, inventorygradient1), ColorSequenceKeypoint.new(1.00, inventorygradient2)}
    TextLabel.TextColor3 = inventorymaintextcolor
    Line.BackgroundColor3 = accentcolor
end

local function updateWeaponImages(player)
    local items = rp:FindFirstChild("Players") and rp.Players:FindFirstChild(player.Name) and rp.Players[player.Name]:FindFirstChild("Inventory")

    local function hideAllWeapons()
        Weapon1.Image = ""
        Weapon2.Image = ""
        Weapon3.Image = ""

        Ammo.Visible = false
        Ammo_2.Visible = false
        Ammo_3.Visible = false

        Dura.Visible = false
        Dura_2.Visible = false
        Dura_3.Visible = false

        DuraBar.Visible = false
        DuraBar_2.Visible = false
        DuraBar_3.Visible = false
    end

    if items then
        TextLabel.Text = player.Name .. "'s Hotbar"
        hideAllWeapons()
        
        for _, v in pairs(items:GetChildren()) do
            local frameslot = v:FindFirstChild("ItemProperties"):GetAttribute("CurrentFrameName")
            local durability = v:FindFirstChild("ItemProperties"):GetAttribute("Durability") or 0
            local maxDurability = v:FindFirstChild("ItemProperties"):GetAttribute("MaxDurability") or 100

            local function updateDurabilityBar(bar, dura)
                local percent = math.clamp(durability / maxDurability, 0, 1)
                bar.Size = UDim2.new(percent, 0, 1, 0)
                bar.Visible = true
                dura.Visible = true
            end

            local function updateAmmoDisplay(ammoLabel)
                local magazine = v:FindFirstChild("Attachments") and v.Attachments:FindFirstChild("Magazine")
                if magazine and #magazine:GetChildren() > 0 then
                    local magItem = magazine:GetChildren()[1]
                    local loadedAmmo = magItem.ItemProperties:GetAttribute("LoadedAmmo") or 0
                    local maxLoadedAmmo = magItem.ItemProperties:GetAttribute("MaxLoadedAmmo") or 0
                    ammoLabel.Text = loadedAmmo .. "/" .. maxLoadedAmmo
                    ammoLabel.Visible = true
                elseif not magazine then
                    local nonmagItemMaxAmmo = v:FindFirstChild("ItemProperties"):GetAttribute("MaxLoadedAmmo")
                    local nonmagItemAmmo = v:FindFirstChild("ItemProperties"):GetAttribute("LoadedAmmo")

                    ammoLabel.Text = nonmagItemAmmo .. "/" .. nonmagItemMaxAmmo
                    ammoLabel.Visible = true
                else
                    ammoLabel.Visible = false
                end
            end

            if frameslot == "ItemHip1" then
                Weapon1.Image = v:FindFirstChild("ItemProperties"):FindFirstChild("ItemIcon").Image
                updateDurabilityBar(DuraBar, Dura)
                updateAmmoDisplay(Ammo)
            elseif frameslot == "ItemBack1" then
                Weapon2.Image = v:FindFirstChild("ItemProperties"):FindFirstChild("ItemIcon").Image
                updateDurabilityBar(DuraBar_2, Dura_2)
                updateAmmoDisplay(Ammo_2)
            elseif frameslot == "ItemBack2" then
                Weapon3.Image = v:FindFirstChild("ItemProperties"):FindFirstChild("ItemIcon").Image
                updateDurabilityBar(DuraBar_3, Dura_3)
                updateAmmoDisplay(Ammo_3)
            end
        end
    else
        TextLabel.Text = "No one's Hotbar"
        hideAllWeapons()
    end
end

task.spawn(function()
    while task.wait(0.02) do
        local oldClosestPlayer = closestPlayerTemp
        closestDistance = math.huge
        closestPlayerTemp = nil

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localplayer and player.Character and player.Character.PrimaryPart then
                local part = player.Character.PrimaryPart
                local vector, onscreen = wcamera:WorldToScreenPoint(part.Position)
                local screenpoint = Vector2.new(vector.X, vector.Y)
                local mousePos = Vector2.new(mouse.X, mouse.Y)
                local distance = (screenpoint - mousePos).Magnitude

                if onscreen and distance < aimfov and distance < closestDistance then
                    closestDistance = distance
                    closestPlayerTemp = player
                end
            end
        end

        if closestPlayerTemp then
            updateWeaponImages(closestPlayerTemp)
        elseif oldClosestPlayer then
            TextLabel.Text = "No one's Hotbar"
            Weapon1.Image = ""
            Weapon2.Image = ""
            Weapon3.Image = ""

            Ammo.Visible = false
            Ammo_2.Visible = false
            Ammo_3.Visible = false

            Dura.Visible = false
            Dura_2.Visible = false
            Dura_3.Visible = false

            DuraBar.Visible = false
            DuraBar_2.Visible = false
            DuraBar_3.Visible = false
        end
    end
end)

-- anti aim

function FlipBack()
    local characterxx = localplayer.Character or localplayer.CharacterAdded:Wait()
    local humanoidRootPart = characterxx:WaitForChild("HumanoidRootPart")
    local rootCFrame = humanoidRootPart.CFrame
    local position = rootCFrame.Position
    local forcedRotation = CFrame.Angles(math.rad(0), 0, 0)
    
    localplayer.Character.Humanoid.PlatformStand = true
    humanoidRootPart.CFrame = CFrame.new(position) * forcedRotation
end

-- resolver
--[[
spawn(function()
    while animresolver do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localplayer then
                local character = player.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local animator = humanoid:FindFirstChildOfClass("Animator")
                        if animator then
                            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                                track:Stop()
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.02)
    end
end)
]]

local Hooks = {}

Hooks.Namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
    local Method = getnamecallmethod()

    if not checkcaller() then
        if Method == "GetAttribute" then
            if Args[1] == "UpAngle" and upangleresolver then
                return resolverangle
            end
        end
    end

    return Hooks.Namecall(self, ...)
end)

--fly--

local function fly_move(dir)
    local hrp = localplayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

	local newPos = hrp.CFrame + (dir * 1)
	hrp.CFrame = newPos
end
local function fly_getclosestpoint()
    local hrp = localplayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

	local dirs = {
        Vector3.new(1, 0, 0),
        Vector3.new(-1, 0, 0),
        Vector3.new(0, 1, 0),
        Vector3.new(0, -1, 0),
        Vector3.new(0, 0, 1),
        Vector3.new(0, 0, -1),
        Vector3.new(1, 1, 0),
        Vector3.new(1, -1, 0),
        Vector3.new(-1, 1, 0),
        Vector3.new(-1, -1, 0),
        Vector3.new(1, 0, 1),
        Vector3.new(1, 0, -1),
        Vector3.new(-1, 0, 1),
        Vector3.new(-1, 0, -1),
        Vector3.new(0, 1, 1),
        Vector3.new(0, 1, -1),
        Vector3.new(0, -1, 1),
        Vector3.new(0, -1, -1),
        Vector3.new(1, 1, 1),
        Vector3.new(1, 1, -1),
        Vector3.new(1, -1, 1),
        Vector3.new(1, -1, -1),
        Vector3.new(-1, 1, 1),
        Vector3.new(-1, 1, -1),
        Vector3.new(-1, -1, 1),
        Vector3.new(-1, -1, -1)
    }

	local fcp = nil
	local cd = math.huge

    local playerslist = game.Players:GetPlayers()
    local ignorl = {localplayer.Character, wcamera}

    for _, player in ipairs(playerslist) do
        if player.Character then
            table.insert(ignorl, player.Character)
        end
    end

	for _, dir in ipairs(dirs) do
		local ray = Ray.new(hrp.Position, dir * 200)
		local part, pos = workspace:FindPartOnRayWithIgnoreList(ray, ignorl)
		if part and pos then
			local d = (hrp.Position - pos).Magnitude
			if d < cd then
				cd = d
				fcp = pos
			end
		end
	end

	return fcp
end
function fly_getoffset(dir)
	local offset = Vector3.new(0.1, 0.1, 0.1)
	if dir.X > 0 then
		offset = Vector3.new(0.1, 0, 0)
	elseif dir.X < 0 then
		offset = Vector3.new(-0.1, 0, 0)
	elseif dir.Y > 0 then
		offset = Vector3.new(0, 0.1, 0)
	elseif dir.Y < 0 then
		offset = Vector3.new(0, -0.1, 0)
	elseif dir.Z > 0 then
		offset = Vector3.new(0, 0, 0.1)
	elseif dir.Z < 0 then
		offset = Vector3.new(0, 0, -0.1)
	end
	return offset
end

-- admin detector --

local function CheckAdminStatus(player)
    local replicatedPlayers = rp:FindFirstChild("Players")
    if replicatedPlayers then
        local playerData = replicatedPlayers:FindFirstChild(player.Name)
        if playerData then
            local status = playerData:FindFirstChild("Status")
            if status then
                local UAC = status:FindFirstChild("UAC")
                if UAC then
                    return UAC:GetAttribute("A1Detected") or UAC:GetAttribute("A2Detected")
                end
            end
        end
    end
    return false
end

local function SoundEffect(volume)
    local soundeffect = "rbxassetid://6698737249"
    local sound = Instance.new("Sound")

    sound.SoundId = soundeffect
    sound.Parent = game.Workspace
    sound.Volume = volume
    sound:Play()
    sound.Loaded:Wait()
    wait(sound.TimeLength)
    sound:Destroy()
end

task.spawn(function()
    while true do
        for _, player in ipairs(Players:GetPlayers()) do
            local isAdmin = CheckAdminStatus(player)
            if isAdmin and not detectedAdmins[player.Name] then
                detectedAdmins[player.Name] = true
                print("[SPECTER.VIP] Admin joined:" .. player.Name)
                library:SendNotification(("Admin Detected: " .. player.Name), 15)
                SoundEffect(moddetectorvolume)
            elseif not isAdmin and detectedAdmins[player.Name] then
                detectedAdmins[player.Name] = nil
            end
        end
        task.wait(1)
    end
end)

Players.PlayerAdded:Connect(function(player)
    task.delay(1, function()
        if CheckAdminStatus(player) then
            print("[SPECTER.VIP] Admin joined:" .. player.Name)
            library:SendNotification(("Admin Detected: " .. player.Name), 15)
            SoundEffect(moddetectorvolume)
            detectedAdmins[player.Name] = true
        end
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    if detectedAdmins[player.Name] then
        print("[SPECTER.VIP] Admin left:" .. player.Name)
        library:SendNotification(("Admin Left: " .. player.Name), 15)
        SoundEffect(moddetectorvolume)
        detectedAdmins[player.Name] = nil
    end
end)

-- staff list

local existingLabels = {}

task.spawn(function()
    while true do
        local currentAdmins = {}
        local adminCount = 0

        for playerName, isAdmin in pairs(detectedAdmins) do
            if isAdmin then
                if not existingLabels[playerName] then
                    local template = StaffLabel:Clone()
                    template.Parent = StaffList
                    template.Text = playerName
                    existingLabels[playerName] = template
                end
                currentAdmins[playerName] = true
                adminCount += 1
            end
        end

        for playerName, label in pairs(existingLabels) do
            if not detectedAdmins[playerName] then
                label:Destroy()
                existingLabels[playerName] = nil
            end
        end

        StaffTitle.Text = "STAFF IN SERVER (" .. adminCount .. ")"

        wait(0.02)
    end
end)


local function UpdateStaffListLooks()
    StaffLabel.TextColor3 = stafflabelcolor
    XLine.BackgroundColor3 = stafflinecolor
    StaffTitle.TextColor3 = stafftitlecolor
end

--global cycle--

task.spawn(function() -- very slow
    while wait(10.5) do
        table.clear(aimignoreparts)
        for i,v in ipairs(workspace:GetDescendants()) do
            if v:GetAttribute("PassThrough") then
                table.insert(aimignoreparts, v)
            end
        end
    end
end)

task.spawn(function() -- slow
    while wait(1) do

        local function handleFoliage()
            if workspace:FindFirstChild("SpawnerZones") then
                for i, v in ipairs(workspace.SpawnerZones.Foliage:GetDescendants()) do
                    if v:FindFirstChildOfClass("SurfaceAppearance") then
                        if worldleaves then
                            v.Transparency = 1
                        else
                            v.Transparency = 0
                        end
                    end
                end
            end
        end

        local function handleInventory()
            local x, y, z = viewmodX, viewmodY, viewmodZ
            local offset = CFrame.new(Vector3.new(tonumber(x), tonumber(y), tonumber(z)))
            if not offset then return end
            local inv = game.ReplicatedStorage.Players:FindFirstChild(localplayer.Name).Inventory
            if not inv then return end
            for i, v in ipairs(inv:GetChildren()) do
                local sett = require(v.SettingsModule)
                sett.weaponOffSet = offset
                if RapidFire then
                    sett.FireRate = 0.002
                end
                if UnlockFiremodes then
                    sett.FireModes = {"Auto", "Semi"}
                end
            end
        end

        local function handleViewModelHighlight()
            if viewmodhighlightchams and wcamera:FindFirstChild("ViewModel") then
                local vmhighlight = Instance.new("Highlight")
                vmhighlight.Parent = wcamera:FindFirstChild("ViewModel")
                vmhighlight.DepthMode = Enum.HighlightDepthMode.Occluded

                vmhighlight.FillColor = viewmodhighlightfillcolor
                vmhighlight.OutlineColor = viewmodhighlightoutlinecolor

                vmhighlight.FillTransparency = viewmodhighlightfilltransparency
                vmhighlight.OutlineTransparency = viewmodhighlightoutlinetransparency
            elseif viewmodhighlightchams == false and wcamera:FindFirstChild("ViewModel") and wcamera:FindFirstChild("ViewModel"):FindFirstAncestorWhichIsA("Highlight") then
                local temporaryhighlight = wcamera:FindFirstChild("ViewModel"):FindFirstChildWhichIsA("Highlight")
                temporaryhighlight:Destroy()
            end
        end

        local function handleViewModel()
            if viewmodbool and wcamera:FindFirstChild("ViewModel") then
                for _, obj in ipairs(wcamera.ViewModel:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        if not obj:FindFirstAncestor("Item") then
                            local mb = obj:FindFirstChildOfClass("SurfaceAppearance")
                            if mb then
                                mb:Destroy()
                            end

                            obj.Color = viewmodhandcolor
                            obj.Material = viewmodhandmat
                        else
                            local mb = obj:FindFirstChildOfClass("SurfaceAppearance")
                            if mb then
                                mb:Destroy()
                            end

                            obj.Color = viewmodguncolor
                            obj.Material = viewmodgunmat
                        end
                    elseif obj:IsA("Model") and obj:FindFirstChild("LL") then
                        obj:Destroy()
                    end
                end
            end
        end

        handleFoliage()
        handleInventory()
        handleViewModel()
        handleViewModelHighlight()
        UpdateInventoryViewerLooks()
        UpdateStaffListLooks()
    end
end)

local dysenc = {}

local fpsrequired = require(game.ReplicatedStorage.Modules.FPS)
runs.Heartbeat:Connect(function(delta) 
    if not localplayer.Character or not localplayer.Character:FindFirstChild("HumanoidRootPart") or not localplayer.Character:FindFirstChild("Humanoid") then
        return
    end

    choosetarget()

    if hillwallbang and aimtarget ~= nil then
        fpsrequired.action(a1table, true)
        wait()
        fpsrequired.action(a1table, false)
    end

    if upangletoggle then
        game:GetService("ReplicatedStorage").Remotes.UpdateTilt:FireServer(upangleY)
    end

if FullUnderToggle and localplayer.Character and localplayer.Character:FindFirstChild("Humanoid") then
    danceTrack.TimePosition = animpos
    dysenc[1] = localplayer.Character.HumanoidRootPart.CFrame
    dysenc[2] = localplayer.Character.HumanoidRootPart.AssemblyLinearVelocity

    local sjeifsfije = localplayer.Character.HumanoidRootPart.CFrame
    sjeifsfije = sjeifsfije + Vector3.new(0, underground, 0)

    local newRotation = CFrame.Angles(math.rad(undergroundcharrotX), 0, math.rad(undergroundcharrotZ))

    localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(sjeifsfije.Position) * newRotation

    runs.RenderStepped:Wait()

    if localplayer.Character and localplayer.Character.HumanoidRootPart then
        localplayer.Character.HumanoidRootPart.CFrame = dysenc[1]
        localplayer.Character.HumanoidRootPart.AssemblyLinearVelocity = dysenc[2]
    end
end


end)

runs.RenderStepped:Connect(function(delta) --  fast
    --runs.RenderStepped:Wait()
    if not localplayer.Character or not localplayer.Character:FindFirstChild("HumanoidRootPart") or not localplayer.Character:FindFirstChild("Humanoid") then
        return
    end

    if charsemifly == false and localplayer.Character.Humanoid.PlatformStand == true then
        localplayer.Character.Humanoid.PlatformStand = false
    end

    if aimtrigger and aimtarget ~= nil then
        if not uis.MouseIconEnabled then
            task.spawn(function()
                mouse1press()
                wait()
                mouse1release()
            end)
        end
    end

    if charsemifly and charantiaim_underground then
        flipback = true
    elseif charsemifly == false and charantiaim_underground and flipback then
        localplayer.Character.Humanoid.PlatformStand = true
        FlipBack()
        localplayer.Character.Humanoid.PlatformStand = true
        flipback = false
    end

    local function flipCharacterUpsideDown()
        local characterxx = localplayer.Character or localplayer.CharacterAdded:Wait()
        local humanoidRootPart = characterxx:WaitForChild("HumanoidRootPart")
        local rootCFrame = humanoidRootPart.CFrame
        local position = rootCFrame.Position
        local forcedRotation = CFrame.Angles(math.rad(xrot), yrot, zrot)

        humanoidRootPart.CFrame = CFrame.new(position) * forcedRotation
    end
    
    if worldclockmodifier == true then
        game.Lighting.ClockTime = worldclock
    end

    local bodyparts = {
        "Head",
        "HeadTopHitBox",
        "FaceHitBox",
        "UpperTorso",
        "LeftUpperArm",
        "RightUpperArm",
        "LeftLowerArm",
        "RightLowerArm",
        "LeftHand",
        "RightHand",
        "LeftUpperLeg",
        "RightUpperLeg",
        "LeftLowerLeg",
        "RightLowerLeg",
        "LeftFoot",
        "RightFoot"
    }

    local character = localplayer.Character or localplayer.CharacterAdded:Wait()
    local originalCollisions = {}

    local function enableNoclip(character)
        for _, partName in pairs(bodyparts) do
            local part = character:FindFirstChild(partName)
            if part then
                originalCollisions[partName] = part.CanCollide
                part.CanCollide = false
            end
        end
    end

    local function disableNoclip(character)
        for _, partName in pairs(bodyparts) do
            local part = character:FindFirstChild(partName)
            if part and originalCollisions[partName] ~= nil then
                part.CanCollide = originalCollisions[partName]
            end
        end
    end

    if charsemifly and charantiaim_underground then
        flipCharacterUpsideDown()
        enableNoclip(character)
    else
        disableNoclip(character)
    end

    if charsemifly and localplayer.Character then --semifly
        local hrp = localplayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local dir = Vector3.new(0, 0, 0)
        

		if uis:IsKeyDown(Enum.KeyCode.W) then
			dir += wcamera.CFrame.LookVector
		elseif uis:IsKeyDown(Enum.KeyCode.S) then
			dir -= wcamera.CFrame.LookVector
		end

		if uis:IsKeyDown(Enum.KeyCode.A) then
			dir -= wcamera.CFrame.RightVector
		elseif uis:IsKeyDown(Enum.KeyCode.D) then
			dir += wcamera.CFrame.RightVector
		end

		if uis:IsKeyDown(Enum.KeyCode.Space) then
			dir += Vector3.new(0, 1, 0)
		elseif uis:IsKeyDown(Enum.KeyCode.LeftShift) then
			dir -= Vector3.new(0, 1, 0)
		end

		local closest = fly_getclosestpoint()
		if closest then
			local d = (hrp.Position - closest).Magnitude
			if d > charsemiflydist then
				local ldir = (hrp.Position - closest).Unit * charsemiflydist
				local offset = fly_getoffset(ldir)
				hrp.CFrame = CFrame.new(closest + ldir - offset)
			else
				fly_move(dir * charsemiflyspeed * runs.RenderStepped:Wait())
			end
		else
			fly_move(dir * charsemiflyspeed * runs.RenderStepped:Wait())
		end
    end

    if changerbool and localplayer.Character ~= nil then -- humanoid changer
        localplayer.Character.Humanoid.WalkSpeed = changerspeed
        localplayer.Character.Humanoid.JumpHeight = changerjump
        localplayer.Character.Humanoid.HipHeight = changerheight
        workspace.Gravity = changergrav
    end

if aimtarget ~= nil then
    local displayText = "[[ " .. aimtarget.Name

    local botNames = {
        "Death",
        "Whisper",
        "Anton",
        "AntonGuard",
        "Dozer",
        "OccupantSniper",
        "SniperBandit",
        "OccupantSoldier",
        "OccupantSurveyTeam",
        "WastelandBandit",
        "HighwayBandit"
    }

    local isBot = false
    for _, botName in ipairs(botNames) do
        if aimtarget.Name == botName then
            isBot = true
            break
        end
    end

    local isAdmin = false
    if not isBot then
        local player = game:GetService("ReplicatedStorage").Players:FindFirstChild(aimtarget.Name)
        if player and player:FindFirstChild("Status") then
            local status = player.Status.UAC
            isAdmin = (status:GetAttribute("A1Detected") == true) or (status:GetAttribute("A2Detected") == true)
        end
    end

    if healthtargetname and not isBot and aimtarget.Character and aimtarget.Character:FindFirstChild("Humanoid") then
        displayText = displayText .. " | HP: " .. aimtarget.Character.Humanoid.Health
    end

    if admintargetname and not isBot then
        displayText = displayText .. " | Admin: " .. tostring(isAdmin)
    end

    displayText = displayText .. " ]]"
    aimtargetname.Text = displayText
else
    aimtargetname.Text = " "
end

    aimtargetname.Position = Vector2.new(wcamera.ViewportSize.X / 2, wcamera.ViewportSize.Y / 2 + aimfov + 20) 
    aimfovcircle.Position = Vector2.new(wcamera.ViewportSize.X / 2, wcamera.ViewportSize.Y / 2)
    crosshair.Position = Vector2.new(wcamera.ViewportSize.X / 2, wcamera.ViewportSize.Y / 2)

    if aimdynamicfov then
        aimfovcircle.Radius = aimfov * (90 / wcamera.FieldOfView )
    else
        aimfovcircle.Radius = aimfov
    end

    if snaplinebool and aimtargetpart then
        aimsnapline.Visible = true
        local headpos = wcamera:WorldToViewportPoint(aimtargetpart.Position)
        aimsnapline.From = Vector2.new(wcamera.ViewportSize.X / 2, wcamera.ViewportSize.Y / 2)
        aimsnapline.To = Vector2.new(headpos.X, headpos.Y)
    else
        aimsnapline.Visible = false
    end

    for dobj, info in esptable do --esp part
        local dtype = info.type
        local otype = info.otype
        
        if info.primary == nil or info.primary.Parent == nil then
            esptable[dobj] = nil
            if dtype == "Highlight" then
                dobj.Enabled = false
                dobj:Destroy()
            else
                dobj.Visible = false
                dobj:Remove()
            end
            continue
        end

        local obj
        local isHumanoid
        if otype == "Extract" then
            obj = info.primary
            isHumanoid = true
        elseif otype == "Loot" then
            obj = info.primary
            isHumanoid = true
        else
            obj = info.primary.Parent:FindFirstChild("UpperTorso")
            if not obj then
                esptable[dobj] = nil
                if dtype == "Highlight" then
                    dobj.Enabled = false
                    dobj:Destroy()
                else
                    dobj.Visible = false
                    dobj:Remove()
                end
                continue
            end
            isHumanoid = obj.Parent:FindFirstChild("Humanoid")
        end

        if (otype == "Bot333" and espbots == false) or (otype == "Dead333" and espdead == false) or (otype == "Extract" and espexit == false) or (otype == "Loot" and esploot == false) then
            if dtype == "Highlight" then
                dobj.Enabled = false
            else
                dobj.Visible = false
            end
            continue
        end

        if localplayer.Character == nil or localplayer.Character.PrimaryPart == nil then
            if dtype == "Highlight" then
                dobj.Enabled = false
            else
                dobj.Visible = false
            end
            continue
        end
        
        if otype == "Bot333" and obj.Parent.Humanoid.Health == 0 then
            info.otype = "Dead333"
        end

        local metersdist = math.floor((localplayer.Character.PrimaryPart.Position - obj.Position).Magnitude * 0.333)

        if espbool and isonscreen(obj) and isHumanoid and metersdist < esprenderdist then
            local headpos = wcamera:WorldToViewportPoint(obj.Position)
            local resultpos = Vector2.new(headpos.X, headpos.Y)
    
            if dtype == "Name" then
                if espname then
                    resultpos = resultpos - Vector2.new(0, 32)
                    if otype == "Extract" then
                        dobj.Text = obj.Name
                    else
                        dobj.Text = obj.Parent.Name
                    end
                    dobj.Position = resultpos
                    dobj.Size = esptextsize
                    dobj.Color = espnamecolor
                    dobj.Outline = esptextline
                    dobj.Visible = true
                else
                    dobj.Visible = false
                end
            elseif dtype == "HP" then

                if otype == "Dead333" then
                    dobj.Visible = false
                    continue
                end

                resultpos = resultpos - Vector2.new(25, 15)
                dobj.Text = math.floor(obj.Parent.Humanoid.Health) .. "HP"
                dobj.Position = resultpos
                dobj.Size = esptextsize
                dobj.Color = esphpcolor
                dobj.Visible = esphp
                dobj.Outline = esptextline
            elseif dtype == "Distance" then
                if espdistance then
                    resultpos = resultpos - Vector2.new(-25, 15)
                    dobj.Text = metersdist .. "m"
                    dobj.Position = resultpos
                    dobj.Size = esptextsize
                    dobj.Color = espdistcolor
                    dobj.Outline = esptextline
                    dobj.Visible = true
                else
                    dobj.Visible = false
                end
            elseif dtype == "Hotbar" then

                if otype == "Dead333" then
                    dobj.Visible = false
                    continue
                end

                resultpos = resultpos + Vector2.new(0, 10)
                local hotgun = " "
                for _, v in ipairs(obj.Parent:GetChildren()) do
                    if v:FindFirstChild("ItemRoot") then
                        hotgun = v.Name
                        break
                    end
                end

                dobj.Visible = esphotbar
                if otype == "Loot" then
                    local Amount
                    local TotalPrice = 0
                    local Value = 0

                    for _, h in ipairs(obj.Parent.Inventory:GetChildren()) do
                        Amount = h.ItemProperties:GetAttribute("Amount") or 1
                        TotalPrice += h.ItemProperties:GetAttribute("Price") or 0
                        Value += (valcache[h.ItemProperties:GetAttribute("CallSign")] or 0) * Amount
                    end

                    if Value >= 20 then
                        dobj.Text = "Loot: $$$$ / " .. TotalPrice .. "$"
                    elseif Value >= 12 then
                        dobj.Text = "Loot: $$$ / " .. TotalPrice .. "$"
                    elseif Value >= 8 then
                        dobj.Text = "Loot: $$ / " .. TotalPrice .. "$"
                    elseif Value >= 4 then
                        dobj.Text = "Loot: $ / " .. TotalPrice .. "$"
                    end
                else
                    dobj.Text = hotgun
                end
                dobj.Position = resultpos
                dobj.Size = esptextsize
                dobj.Outline = esptextline
                dobj.Color = esphotbarcolor
            elseif dtype == "Highlight" then

                if otype == "Dead333" then
                    esptable[dobj] = nil
                    dobj.Enabled = false
                    dobj:Destroy()
                    continue
                end

                if obj.Parent == nil or not obj.Parent:IsA("Model") then
                    esptable[dobj] = nil
                    dobj.Enabled = false
                    dobj:Destroy()
                    continue
                end

                dobj.FillColor = espfillcolor
                dobj.OutlineColor = esplinecolor
                dobj.FillTransparency = espchamsfill
                dobj.OutlineTransparency = espchamsline
                dobj.DepthMode = occludedchams and Enum.HighlightDepthMode.Occluded or Enum.HighlightDepthMode.AlwaysOnTop
                dobj.Enabled = esphigh
            end
        else
            if dtype == "Highlight" then
                dobj.Enabled = false
            else
                dobj.Visible = false
            end
        end
    end
end)

local Time = (string.format("%."..tostring(Decimals).."f", os.clock() - Clock))
library:SendNotification(("Loaded in "..tostring(Time).."s"), 6)

_G.Loading = false
movementtoggle(false); charsemifly = false
camthirdp = false; thirdpersonvisualizer = false; localplayer.CameraMaxZoomDistance = origZoom; localplayer.CameraMode = origMode

--[[
    --Window1:SetOpen(false)
    makefolder("Title Here")
    library:SetTheme(Default)
    library:GetConfig(Default)
    library:LoadConfig(Default)
    library:SaveConfig(Default)
]]
