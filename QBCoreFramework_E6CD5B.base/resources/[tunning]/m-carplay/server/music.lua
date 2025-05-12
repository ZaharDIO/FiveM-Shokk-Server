RegisterServerEvent('mCarplay:server:playSong', function(pos, Player, link, serverId, mp3, net)
    if tonumber(source) ~= tonumber(Player) then
        TriggerClientEvent("mCarplay:client:Post", Player, 'PlayMusic', link)
    end
    TriggerClientEvent("mCarplay:client:playSong", -1, pos, Player, link, serverId, mp3, net)
end)

RegisterServerEvent('mCarplay:server:stopSong', function(Player)
    TriggerClientEvent("mCarplay:client:stopSong", -1, Player)
end)

RegisterServerEvent('mCarplay:server:pauseSong', function(Player)
    if tonumber(source) ~= tonumber(Player) then
        TriggerClientEvent("mCarplay:client:Post", Player, 'PauseMusic')
    end
    TriggerClientEvent("mCarplay:client:pauseSong", -1, Player)
end)

RegisterServerEvent('mCarplay:server:resumeSong', function(Player)
    if tonumber(source) ~= tonumber(Player) then
        TriggerClientEvent("mCarplay:client:Post", Player, 'ResumeMusic')
    end
    TriggerClientEvent("mCarplay:client:resumeSong", -1, Player)
end)

AddEventHandler('playerDropped', function(source)
    local src = source
    TriggerClientEvent("mCarplay:client:stopSong", -1, tostring(src))
end)

RegisterServerEvent('mCarplay:server:SetTimeStamp')
AddEventHandler('mCarplay:server:SetTimeStamp', function(timestamp, id)
    if id then
        TriggerClientEvent("mCarplay:client:SetTimeStamp", -1, id, timestamp)
        if tonumber(id) ~= source  then
            TriggerClientEvent("mCarplay:client:Post", source, 'timestamp')
        end
    else
        local src = source
        TriggerClientEvent("mCarplay:client:SetTimeStamp", -1, src, timestamp)
    end
end)
-- by 5M EXCLUSIVE-SCRIPTS
--https://discord.gg/fivemscripts