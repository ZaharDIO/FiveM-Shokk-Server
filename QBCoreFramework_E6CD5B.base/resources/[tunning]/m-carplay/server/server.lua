local Caches   = {
    Avatars = {}
}
AllPassengerAcces = {}
Core = nil
CreateThread(function()
    Core, Config.Framework = GetCore()
end)




Citizen.CreateThread(function()
    while Core == nil do
        Citizen.Wait(0)
    end
    Citizen.Wait(500)
    RegisterCallback('mCarplay:getPlayerMusicData', function(source, cb)
        local identifier = GetIdentifier(source)
        getData = ExecuteSql('SELECT * FROM `mcarplay` WHERE `identifier` = @identifier', {
            ['@identifier'] = identifier
        })
        if getData and next(getData) then
            cb(getData[1].playlistData)
        else
            cb(nil)
        end
    end)

    RegisterCallback('mCarplay:getPlayerData', function (source, cb)
        print('https://discord.gg/fivemscripts')
        local avatar = GetDiscordAvatar(source) or 'https://cdn.discordapp.com/attachments/1119364138959913171/1151616231531622511/image.png?ex=6513e871&is=651296f1&hm=f1c601f73a666003da1f11e85eb1d1acde70db19ea9f002546d11beeb7c7c94d&'
        local name = GetName(source)
        local playerData = {
            ['avatar'] = avatar,
            ['name'] = name
        }
        cb(playerData)
    end)

    RegisterCallback('mCarplay:getPlayerPassengerAccess', function (source, cb, id)
        cb(AllPassengerAcces[id])
    end)



end)


RegisterServerEvent('mCarplay:passengerAccess', function(bool)
    local src = source
    AllPassengerAcces[src] = bool
end)


RegisterServerEvent('mCarplay:createPlaylist', function (data)
    local src = source
    local identifier = GetIdentifier(src)

    local getMusicData = ExecuteSql('SELECT * FROM `mcarplay` WHERE `identifier` = @identifier', {
        ['@identifier'] = identifier
    })

    if getMusicData and next(getMusicData) then
        ExecuteSql('UPDATE `mcarplay` SET `playlistData` = @playlistData WHERE `identifier` = @identifier', {
            ['@identifier'] = identifier,
            ['@playlistData'] = json.encode(data)
        })
    else
        ExecuteSql('INSERT INTO `mcarplay` (`identifier`, `playlistData`) VALUES (@identifier, @playlistData)', {
            ['@identifier'] = identifier,
            ['@playlistData'] = json.encode(data)
        })
    end

end)


local bot_Token = 'MTEzNzQ2NzAxNjExOTM0MTE0Ng.GZqH3t.dU6dFULV1-l3euzHv5j6ElkRPQghoxmaFWlFCE'

local FormattedToken = "Bot " .. bot_Token
function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest(
        "https://discordapp.com/api/" .. endpoint,
        function(errorCode, resultData, resultHeaders)
            data = { data = resultData, code = errorCode, headers = resultHeaders }
        end,
        method,
        #jsondata > 0 and json.encode(jsondata) or "",
        { ["Content-Type"] = "application/json", ["Authorization"] = FormattedToken }
    )

    while data == nil do
        Citizen.Wait(0)
    end

    return data
end

function GetDiscordAvatar(user)
    print('By 5M EXCLUSIVE-SCRIPTS')
    local discordId = nil
    local imgURL = nil
    for _, id in ipairs(GetPlayerIdentifiers(user)) do
        if string.match(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
            break
        end
    end

    if discordId then
        if Caches.Avatars[discordId] == nil then
            local endpoint = ("users/%s"):format(discordId)
            local member = DiscordRequest("GET", endpoint, {})

            if member.code == 200 then
                local data = json.decode(member.data)
                if data ~= nil and data.avatar ~= nil then
                    if (data.avatar:sub(1, 1) and data.avatar:sub(2, 2) == "_") then
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".gif"
                    else
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".png"
                    end
                end
            end
            Caches.Avatars[discordId] = imgURL
        else
            imgURL = Caches.Avatars[discordId]
        end
    end
    return imgURL
end

function GetPlayer(source)
    local Player = false
    while Core == nil do
        Citizen.Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Player = Core.GetPlayerFromId(source)
    else
        Player = Core.Functions.GetPlayer(source)
    end
    return Player
end


GetName = function(source)
    local Player = GetPlayer(source)
    if Config.Framework == "qb" or Config.Framework == 'oldqb' then
        return Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname
    else
        return GetPlayerCharacterNameESX(source)
    end
end

GetPlayerCharacterNameESX = function(source)
    local Player = GetPlayer(source)
    local identifier = Player.identifier
    local result = ExecuteSql("SELECT * FROM users WHERE identifier = '"..identifier.."'")
    if result[1] then 
        return result[1].firstname..' '..result[1].lastname 
    end;
end

function GetPlayerFromIdentifier(identifier)
    local Player = false
    while Core == nil do
        Citizen.Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Player = Core.GetPlayerFromIdentifier(identifier)
    else
        Player = Core.Functions.GetPlayerByCitizenId(identifier)
    end
    return Player
end

function GetIdentifier(source)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            return Player.getIdentifier()
        else
            return Player.PlayerData.citizenid
        end
    end
end

function GetSource(xPlayer)
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        return xPlayer.source
    else
        if xPlayer and xPlayer.PlayerData then
            return xPlayer.PlayerData.source
        end
    end
end


function RegisterCallback(name, cbFunc)
    while not Core do
        Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterServerCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    else
        Core.Functions.CreateCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    end
end


function ExecuteSql(query, parameters)
    local IsBusy = true
    local result = nil
    if Config.SQL == "oxmysql" then
        if parameters then
            exports.oxmysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "ghmattimysql" then
        if parameters then
            exports.ghmattimysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.ghmattimysql:execute(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "mysql-async" then
        if parameters then
            MySQL.Async.fetchAll(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.Async.fetchAll(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end
