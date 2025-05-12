local playingSongs = {}
local musicOn = false
local SongMinimumDistance = Config.SongMinimumDistance + 0.0
local selfId = false

function PlaySong(link, id)
    local ped = PlayerPedId()
    local serverId 
    local Player
    if id then
        serverId = id
        Player = tostring(serverId)
    else
        serverId = GetPlayerServerId(PlayerId())
        Player = tostring(serverId)
    end
    local pos = GetEntityCoords(ped)

    local vehicle = GetVehiclePedIsIn(ped)
    if vehicle == 0 then return print('no vehicle') end
    if musicOn then
        TriggerServerEvent("mCarplay:server:stopSong", Player)
        musicOn = false
    end
    if #playingSongs >= 99 then
        return print('Too many people using the youtube app, so the sound of the video you opened cannot be heard by people nearby')
    end
    TriggerServerEvent("mCarplay:server:playSong", pos, Player, link, serverId, false, VehToNet(vehicle))
    musicOn = true
end

function StopSong()
    if musicOn then
        musicOn = false
        TriggerServerEvent("mCarplay:server:stopSong", tostring(GetPlayerServerId(PlayerId())))
    end
end

function PauseMusic(id)
    if id then
        TriggerServerEvent("mCarplay:server:pauseSong", id)
    else
        local myId = tostring(GetPlayerServerId(PlayerId()))
        TriggerServerEvent("mCarplay:server:pauseSong", myId)
    end

end

function ResumeMusic(id)
    if id then
        TriggerServerEvent("mCarplay:server:resumeSong", id)
    else
        local myId = tostring(GetPlayerServerId(PlayerId()))
        TriggerServerEvent("mCarplay:server:resumeSong", myId)
    end
end

function SetTimeStamp(timestamp, id)
    if id then
        TriggerServerEvent("mCarplay:server:SetTimeStamp", math.ceil(timestamp), id)
    else
        local myId = tostring(GetPlayerServerId(PlayerId()))
        TriggerServerEvent("mCarplay:server:SetTimeStamp",  math.ceil(timestamp), myId)
    end
end

RegisterNetEvent('mCarplay:client:playSong')
AddEventHandler('mCarplay:client:playSong', function(pos, Player, link, serverId, mp3, vehicleNet)
    if not enableSelf(Player) then return end
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNet)
    if not vehicle or not DoesEntityExist(vehicle) then return print('no vehicle in mCarplay:client:playSong') end
    playingSongs[Player] = {}
    playingSongs[Player]["duraklat"] = false
    playingSongs[Player]["serverId"] = serverId
    playingSongs[Player]["vehicle"] = vehicle
    playingSongs[Player]["mp3"] = mp3
    if mp3 then
        PlayUrlPos(Player, link, 0.1, pos)
        setVolumeMax(Player, 0.1)
        Distance(Player, 10)
    else
        PlayUrlPos(Player, link, 0.15, pos)
        setVolumeMax(Player, 0.15)
        Distance(Player, 15)
    end
end)

RegisterNetEvent('mCarplay:client:stopSong')
AddEventHandler('mCarplay:client:stopSong', function(Player)
    if not enableSelf(Player) then return end
    playingSongs[Player] = nil
    Destroy(Player)
end)

RegisterNetEvent('mCarplay:client:pauseSong')
AddEventHandler('mCarplay:client:pauseSong', function(Player)
    if not enableSelf(Player) then return end
    if Player and playingSongs[Player] and playingSongs[Player]["duraklat"] == false then
        playingSongs[Player]["duraklat"] = true
        Pause(Player)
    end
end)

RegisterNetEvent('mCarplay:client:resumeSong')
AddEventHandler('mCarplay:client:resumeSong', function(Player)
    if not enableSelf(Player) then return end
    if Player and playingSongs[Player] and playingSongs[Player]["duraklat"] == true then
        playingSongs[Player]["duraklat"] = false
        Resume(Player)
    end
end)

RegisterNetEvent("mCarplay:client:SetTimeStamp")
AddEventHandler("mCarplay:client:SetTimeStamp", function (Player, timestamp)
    if not enableSelf(Player) then return end
    if Player and playingSongs[Player] then
        setTimeStampp(Player, timestamp)
    end
end)

local time = 100
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(time)
        for x, y in pairs(playingSongs) do
            local player = GetPlayerFromServerId(playingSongs[x]["serverId"])
            if player ~= -1 then
                local vehicle = playingSongs[x]["vehicle"]
                if vehicle ~= 0 and DoesEntityExist(vehicle) then
                    local ped = GetPlayerPed(player)
                    local targetVehicleCoords = GetEntityCoords(vehicle)
                    local sourcePlayerCoords = GetEntityCoords(PlayerPedId())
                    local mesafe = #(sourcePlayerCoords - targetVehicleCoords)
                    if mesafe < 200 then
                        time = 100
                        Position(x, targetVehicleCoords)
                            if GetEntitySpeed(vehicle) * 3.6 > 200.0 then
                                Distance(x, 140)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 150.0 then
                                Distance(x, 125)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 110.0 then
                                Distance(x, 100)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 90.0 then
                                Distance(x, 80)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 60.0 then
                                Distance(x, 65)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 30.0 then
                                Distance(x, 40)
                            else
                                Distance(x, SongMinimumDistance)
                            end
                    else
                        time = 2000
                        Position(x, kordinat)
                    end
                else
                    local Player = tostring(playingSongs[x]["serverId"])
                    playingSongs[Player] = nil
                    Destroy(Player)
                end
            else
                local Player = tostring(playingSongs[x]["serverId"])
                playingSongs[Player] = nil
                Destroy(Player)
            end
        end
    end
end)

function Resume(Player)
    return exports['xsound']:Resume(Player)
end

function Position(x, kordinat)
    return exports['xsound']:Position(x, kordinat)
end

function Distance(x, mesafe)
    return exports['xsound']:Distance(x, mesafe)
end

function Destroy(Player)
    return exports['xsound']:Destroy(Player)
end

function Pause(Player)
    return exports['xsound']:Pause(Player)
end

function PlayUrlPos(Player, link, ses, kordinat)
    return exports['xsound']:PlayUrlPos(Player, link, ses, kordinat)
end

function setVolumeMax(Player, ses)
    return exports['xsound']:setVolumeMax(Player, ses)
end

function setTimeStampp(Player, timestamp)
    return exports['xsound']:setTimeStamp(Player, timestamp)
end

function enableSelf(Player)
    return selfId and tostring(GetPlayerServerId(PlayerId())) ~= Player or true
end


--5M EXCLUSIVE-SCRIPTS
--https://discord.gg/fivemscripts