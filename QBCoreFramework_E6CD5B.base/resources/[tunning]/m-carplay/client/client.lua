local opentablet = false
local vehicleImage = "./img/vehicle/0.png"
Core = nil


CreateThread(function()
    Core, Config.Framework = GetCore()
end)

Fuel = function(vehicle)
    if DoesEntityExist(vehicle) then
        if GetResourceState('LegacyFuel') == 'started' then
            return exports["LegacyFuel"]:GetFuel(vehicle)
        end
        return GetVehicleFuelLevel(vehicle)
    end
    return 0
end

Nitro = function (vehicle)
    return 100
end


RegisterCommand("ccontrol", function()
    while Core == nil do
        Citizen.Wait(0)
    end
    local player = PlayerPedId()
    local vehiclecheck = IsPedInAnyVehicle(player)

    if vehiclecheck then
        OPEN_CARPLAY()
    end
end)


function OPEN_CARPLAY()
    opentablet = not opentablet
    local musicData = TriggerCallback('mCarplay:getPlayerMusicData')
    local vehicleData = getVehicleData()
    local playerData = TriggerCallback('mCarplay:getPlayerData')
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local driverPlayer = GetPedInVehicleSeat(vehicle, -1)
    local time = GetClockHours()
    local SetsecilenMode = ""
    if time >= 7 and time < 18 then
        SetsecilenMode = "light"
    else
        SetsecilenMode = "dark"
    end
    local passengerAccess
    if driverPlayer ~= PlayerPedId() then
        local driverPlayerServerID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(driverPlayer))
        passengerAccess = TriggerCallback('mCarplay:getPlayerPassengerAccess', driverPlayerServerID)
        if passengerAccess then
            CheckVehicleDoors()
            SendNUIMessage({
                message = "OPEN_CARPLAY_OTHER",
                musicData = musicData,
                VehicleData = vehicleData,
                playerdata = playerData,
                SetsecilenMode = SetsecilenMode
            })
            SetNuiFocus(true, true)
        else
            Config.Notification('Şöför erişim izni vermeli', 'error')
        end
    else
        CheckVehicleDoors()
        SetNuiFocus(true, true)
        SendNUIMessage({
            message = "OPEN_CARPLAY",
            musicData = musicData,
            VehicleData = vehicleData,
            playerdata = playerData,
            SetsecilenMode = SetsecilenMode
        })
    end
end
-- by 5M EXCLUSIVE-SCRIPTS
--https://discord.gg/fivemscripts

function CLOSE_TABLET()
    opentablet = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        message = "CLOSE_CARPLAY",
    })
end


Citizen.CreateThread(function ()
    while true do
        Wait(sleep)
        sleep = 5000
        if opentablet then
            sleep = 3000
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            local driverPlayer = GetPedInVehicleSeat(vehicle, -1)
            local passengerAccess
            if driverPlayer ~= PlayerPedId() then
                sleep = 1000
                local driverPlayerServerID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(driverPlayer))
                passengerAccess = TriggerCallback('mCarplay:getPlayerPassengerAccess', driverPlayerServerID)
                if not passengerAccess then
                    CLOSE_TABLET()
                end
            end
        end

    end
end)

function getVehicleData()
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    local engineHealth = math.ceil(GetVehicleEngineHealth(vehicle))
    local isEngineOn = engineHealth > 200

    local doors = {}
    for i = 0, 5 do
        doors[i] = GetVehicleDoorAngleRatio(vehicle, i) ~= 0
    end

    local retval, lights, highbeams = GetVehicleLightsState(vehicle) 
    local light, ShortLight, LongLight = false, false, false

    if retval == 1 then
        if lights == 1 then
            light = true
            if highbeams == 1 then
                LongLight = true
            else
                ShortLight = true
            end
        else
            light = false
        end
    end


    local windows = {}
    for i = 0, 3 do
        windows[i] = not IsVehicleWindowIntact(vehicle, i)
    end

    local speed = math.ceil(GetEntitySpeed(vehicle) * 3.6)
    local gearText, gearN

    if GetIsVehicleEngineRunning(vehicle) then
        if speed == 0 then
            gearText = "N"
            gearN = 0
        else
            gearN = GetVehicleCurrentGear(vehicle)
            if gearN == 0 then
                gearText = "R"
            else
                gearText = "D"
            end
        end
    else
        gearText = "P"
        gearN = 0
    end
    SignalActive = GetVehicleIndicatorLights(vehicle, 0)
    LeftSignal, RightSignal = false, false
    if SignalActive == 1 then
        LeftSignal = true
    elseif SignalActive == 2 then
        RightSignal = true
    elseif SignalActive == 3 then
        LeftSignal = true
        RightSignal = true 
    elseif SignalActive == 0 then
        LeftSignal = false
        RightSignal = false
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local zone = GetNameOfZone(x, y, z)
    local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
    local currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    local intersectStreetName = GetStreetNameFromHashKey(intersectStreetHash)


    if intersectStreetName ~= nil and intersectStreetName ~= "" then
        Street = currentStreetName .. " | " .. intersectStreetName
        Zone = Config.zoneNames[zone]
    elseif currentStreetName ~= nil and currentStreetName ~= "" then
        Street = currentStreetName
        Zone = Config.zoneNames[zone]
    else
        Zone = Config.zoneNames[zone]
    end

    local vehicleData = {
        gearN = gearN,
        gear = gearText,
        broken = isEngineOn,
        speed = speed,
        fuel = math.ceil(Fuel(vehicle)),
        nosLevel = math.ceil(Nitro(vehicle)),
        light = light,
        ShortLight = ShortLight,
        LongLight = LongLight,
        belt =  true,
        NeonBool = true,
        LeftSignal = LeftSignal,
        RightSignal = RightSignal,
        doors = doors,
        windows = windows,
        Zone = Zone,
        Street = Street,
    }
    return vehicleData
end


RegisterCommand('sols', function ()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
SetVehicleIndicatorLights(vehicle, 1, true)
end)

RegisterCommand('sags', function ()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
SetVehicleIndicatorLights(vehicle, 0, true)
end)


local lastURL = "" 
local lastData = nil 

Citizen.CreateThread(function()
    while true do
        Wait(1000) 
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local driverPlayer = GetPedInVehicleSeat(vehicle, -1)
        
        if driverPlayer ~= 0 and driverPlayer ~= PlayerPedId() then
            local driverPlayerServerID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(driverPlayer))
            if driverPlayerServerID == 0 then
                return
            else
                if lastURL ~= "" then
                    local data = getMusicData(tostring(driverPlayerServerID), lastURL)
                    if data then
                        lastData = data
                        lastURL = data.url
                    end
                else
                    local data = getMusicData(tostring(driverPlayerServerID))
                    if data then
                        lastData = data
                        lastURL = data.url
                    end
                end
    
                if lastData then
                    SendNUIMessage({
                        message = 'SET_MUSIC_DATA_OTHER',
                        musicData = lastData,
                        musicOwner = driverPlayerServerID
                    })
                end
            end

        end
    end
end) 

Citizen.CreateThread(function()
    while true do
        Wait(1000) 
        if opentablet then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            local driverPlayer = GetPedInVehicleSeat(vehicle, -1)

            if driverPlayer ~= 0 and driverPlayer ~= PlayerPedId() then
                local driverPlayerServerID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(driverPlayer))
                if driverPlayerServerID == 0 then
                    return
                else
                    SendNUIMessage({
                        message = 'SET_MUSIC_DATA_OTHERID',
                        musicOwner = driverPlayerServerID
                    })
                end

            end

            if vehicle == nil then
                CLOSE_TABLET()
            end
        end

    end
end)


Citizen.CreateThread(function ()
    while true do
        Wait(sleep)
        sleep = 1000
        if opentablet then
            sleep = 200
            local vehicleData = getVehicleData()
            local time = GetClockHours()
            local SetsecilenMode = ""
            if time >= 7 and time < 18 then
                SetsecilenMode = "light"
            else
                SetsecilenMode = "dark"
            end
            SendNUIMessage({
                message = "Change_Vehicle_Data",
                VehicleData = vehicleData,
                SetsecilenMode = SetsecilenMode
            })
        end
    end
end)

local neon = {
    [0] = false,
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false,
}
RegisterNUICallback("EDIT_VEHICLE", function(data)
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    if data.page == "DoorPart" then
        local doorAngle = GetVehicleDoorAngleRatio(vehicle, tonumber(data.i))
        if doorAngle > 0.0 then
            SetVehicleDoorShut(vehicle, tonumber(data.i), false)
            Wait(500)
            CheckVehicleDoors()
        else
            SetVehicleDoorOpen(vehicle, tonumber(data.i), false, false)
            Wait(100)
            CheckVehicleDoors()
        end
        
    elseif data.page == "WindowsPart" then
        SetEntityAsMissionEntity(vehicle, true, true )
        local windowState = IsVehicleWindowIntact(vehicle)

        if not windowState then
            if data.i == 'all' then
                RollUpWindow(vehicle, 0)
                RollUpWindow(vehicle, 1)
                RollUpWindow(vehicle, 2)
                RollUpWindow(vehicle, 3)
            else
                RollUpWindow(vehicle, tonumber(data.i))
            end
        else
            if data.i == 'all' then
                RollDownWindows(vehicle)
            else
                RollDownWindow(vehicle, tonumber(data.i))
            end
        end
    elseif data.page == "NeonPosition" then
        if data.i == 'party' then
            partyMode = not partyMode -- Parti modunu tersine Ã§evir
            if partyMode then
                CreateThread(function()
                    while partyMode do
                        for i = 0, 3 do
                            SetVehicleNeonLightEnabled(vehicle, i, true)
                        end
                        Citizen.Wait(222)
                        for i = 0, 3 do
                            SetVehicleNeonLightEnabled(vehicle, i, false)
                        end
                        Citizen.Wait(222)
                    end
                end)
            end
        elseif data.i == 'all' then
            if neon[0] then
                neon[0] = false
                partyMode = false
                for i = 0, 3 do
                    SetVehicleNeonLightEnabled(vehicle, i, false)
                end
            else
                neon[0] = true
                partyMode = false
                for i = 0, 3 do
                    SetVehicleNeonLightEnabled(vehicle, i, true)
                end
            end
        elseif data.i == 'front' then
            if neon[2] then
                neon[2] = false
                partyMode = false
                SetVehicleNeonLightEnabled(vehicle, 2, false)
            else
                neon[2] = true
                partyMode = false
                SetVehicleNeonLightEnabled(vehicle, 2, true)
            end
        elseif data.i == 'rear' then
            if neon[3] then
                neon[3] = false
                partyMode = false
                SetVehicleNeonLightEnabled(vehicle, 3, false)
            else
                neon[3] = true
                partyMode = false
                SetVehicleNeonLightEnabled(vehicle, 3, true)
            end
        elseif data.i == 'l-side' then
            if neon[4] then
                neon[4] = false
                partyMode = false
                SetVehicleNeonLightEnabled(vehicle, 0, false)
            else
                neon[4] = true
                partyMode = false
                SetVehicleNeonLightEnabled(vehicle, 0, true)
            end
        elseif data.i == 'r-side' then
            if neon[5] then
                neon[5] = false
                partyMode = false
                SetVehicleNeonLightEnabled(vehicle, 1, false)
            else
                neon[5] = true
                partyMode = false
                SetVehicleNeonLightEnabled(vehicle, 1, true)
            end
        else
            partyMode = false
            for i = 0, 3 do
                SetVehicleNeonLightEnabled(vehicle, i, false)
            end
        end
    elseif data.page == 'NeonColor' then
        if data.rgb then
            SetVehicleNeonLightsColour(vehicle, data.i[1], data.i[2], data.i[3])
        else
            local r, g, b = hexToRGB(data.i)
            SetVehicleNeonLightsColour(vehicle, r, g, b)
        end

        
    end
end)

function hexToRGB(hex)
    hex = hex:gsub("#","")
    return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
end

RegisterNUICallback("CLOSE_TABLET", function ()
    opentablet = false
    SetNuiFocus(false, false)
end)


function CheckVehicleDoorImage(image, keys, currentVal)
    local found = true
    for _,v in pairs(keys) do
        if not doors[v] then
            found = false
        end
    end
    if found then
        return image
    end
    return currentVal
end

doors = {
    frontLeftDoor = false,
    frontRightDoor = false,
    backLeftDoor = false,
    backRightDoor = false,
    hood = false,
    trunk = false,
}
-- by 5M EXCLUSIVE-SCRIPTS
--https://discord.gg/fivemscripts

function CheckVehicleDoors()
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    doors = {
        frontLeftDoor = false,
        frontRightDoor = false,
        backLeftDoor = false,
        backRightDoor = false,
        hood = false,
        trunk = false,
    }
    vehicleImage = "./img/vehicle/0.png"
    if GetVehicleDoorAngleRatio(vehicle, 0) ~= 0 then
        doors.frontLeftDoor = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 1) ~= 0  then
        doors.frontRightDoor = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 2) ~= 0  then
        doors.backLeftDoor = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 3)  ~= 0 then
        doors.backRightDoor = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 4)  ~= 0 then
        doors.hood = true
    end
    if GetVehicleDoorAngleRatio(vehicle, 5) ~= 0 then
        doors.trunk = true
    end
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/1.png", {"frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/2.png", {"frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/3.png", {"backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/4.png", {"backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/5.png", {"frontLeftDoor", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/6.png", {"frontLeftDoor", "frontRightDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/7.png", {"frontLeftDoor", "frontRightDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/8.png", {"frontLeftDoor", "frontRightDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/9.png", {"trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/10.png", {"hood"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/11.png", {"trunk", "frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/12.png", {"trunk", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/13.png", {"trunk", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/14.png", {"trunk", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/15.png", {"trunk", "frontLeftDoor", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/16.png", {"trunk", "frontLeftDoor", "frontRightDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/17.png", {"trunk", "frontLeftDoor", "frontRightDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/18.png", {"trunk", "frontLeftDoor", "frontRightDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/19.png", {"hood", "frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/20.png", {"hood", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/21.png", {"hood", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/22.png", {"hood", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/23.png", {"hood", "frontLeftDoor", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/24.png", {"hood", "frontLeftDoor", "frontRightDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/25.png", {"hood", "frontLeftDoor", "frontRightDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/eksik.png", {"hood", "frontLeftDoor", "frontRightDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/26.png", {"hood", "trunk"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/27.png", {"hood", "trunk", "frontLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/28.png", {"hood", "trunk", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/29.png", {"hood", "trunk", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/30.png", {"hood", "trunk", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/31.png", {"hood", "trunk", "frontLeftDoor", "frontRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/32.png", {"hood", "trunk", "frontLeftDoor", "frontRightDoor", "backRightDoor",}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/33.png", {"hood", "trunk", "frontLeftDoor", "frontRightDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/34.png", {"hood", "trunk", "frontLeftDoor", "frontRightDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/35.png", {"frontLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/36.png", {"frontRightDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/37.png", {"frontLeftDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/38.png", {"frontRightDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/39.png", {"frontLeftDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/40.png", {"frontRightDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/41.png", {"trunk", "frontLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/42.png", {"trunk", "frontRightDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/43.png", {"trunk", "frontLeftDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/44.png", {"trunk", "frontRightDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/45.png", {"trunk", "frontLeftDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/46.png", {"trunk", "frontRightDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/47.png", {"hood", "frontLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/48.png", {"hood", "frontRightDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/49.png", {"hood", "frontLeftDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/50.png", {"hood", "frontRightDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/51.png", {"hood", "frontLeftDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/52.png", {"hood", "frontRightDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/53.png", {"hood", "trunk", "frontLeftDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/54.png", {"hood", "trunk", "frontRightDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/55.png", {"hood", "trunk", "frontLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/56.png", {"hood", "trunk", "frontRightDoor", "backLeftDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/57.png", {"hood", "trunk", "frontRightDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/58.png", {"hood", "trunk", "frontLeftDoor", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/59.png", {"backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/60.png", {"trunk", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/62.png", {"hood", "backLeftDoor", "backRightDoor"}, vehicleImage)
    vehicleImage = CheckVehicleDoorImage("./img/vehicle/63.png", {"hood", "trunk", "backLeftDoor", "backRightDoor"}, vehicleImage)


    Wait(100)
    SendNUIMessage({
        message = "Change_Vehicle_Image",
        image = vehicleImage
    })
end

local function isPlayingMusic(musicId)
    if not exports['xsound']:soundExists(musicId) then return false end
    return exports['xsound']:isPlaying(musicId) and true or false
end

RegisterNUICallback('MUSIC_VEHICLE', function (data)
    if data.page == 'PlayMusic' then
        if data.musicOwner then
            local id = tostring(data.musicOwner)
            local musicData = getMusicData(id)
            if musicData then
                if musicData.url == data.url then 
                    if musicData.playing then
                        PauseMusic(id)
                    else
                        ResumeMusic(id)
                    end
                    musicData.playing = not musicData.playing
                    SendNUIMessage({
                        message = 'SET_MUSIC_DATA',
                        musicData = musicData
                    })
                    return
                end
                StopSong(id)
            end
            PlaySong(data.url, id)
        else
            local id = tostring(GetPlayerServerId(PlayerId()))
            local musicData = getMusicData(id)
            if musicData then
                if musicData.url == data.url then 
                    if musicData.playing then
                        PauseMusic()
                    else
                        ResumeMusic()
                    end
                    musicData.playing = not musicData.playing
                    SendNUIMessage({
                        message = 'SET_MUSIC_DATA',
                        musicData = musicData
                    })
                    return
                end
                StopSong()
            end
            PlaySong(data.url)
        end


    elseif data.page == 'PauseMusic' then

        if data.musicOwner then
            local id = tostring(data.musicOwner)
            local musicData = getMusicData(id)
            if musicData.playing then
                PauseMusic(id)
            end
        else
            local id = tostring(GetPlayerServerId(PlayerId()))
            local musicData = getMusicData(id)
            if musicData.playing then
                PauseMusic()
            end
        end


    elseif data.page == 'ResumeMusic' then
        if data.musicOwner then
            local id = tostring(data.musicOwner)
            local musicData = getMusicData(id)
            if not musicData.playing then
                ResumeMusic(id)
            end
        else
            local id = tostring(GetPlayerServerId(PlayerId()))
            local musicData = getMusicData(id)
            if not musicData.playing then
                ResumeMusic()
            end
        end
    elseif data.page == 'CreatePlaylist' then
        TriggerServerEvent('mCarplay:createPlaylist', data.musicData)
    elseif data.page == 'SoundLevel' then    
        local id = tostring(GetPlayerServerId(PlayerId()))
        if not isPlayingMusic(id) then return end
        exports["xsound"]:setVolume(id, data.volume / 100)
    elseif data.page == 'timestamp' then
        if data.musicOwner then
            local id = tostring(data.musicOwner)
            SetTimeStamp(data.payload, id)
        else
            local id = tostring(GetPlayerServerId(PlayerId()))
            SetTimeStamp(data.payload, id)
        end
      
    end
end)

RegisterNUICallback('SETTING_VEHICLE', function (data)
    if data.page == 'passengerAccess' then
        TriggerServerEvent('mCarplay:passengerAccess', data.passengerAccess)
    end
end)

RegisterNetEvent('mCarplay:client:Post', function(data, url)
    SendNUIMessage({
        message = 'SET_MUSIC_EQUALTLE',
        data = data,
        url = url
    })
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(250) end
    while true do
        local id = tostring(GetPlayerServerId(PlayerId()))
       
        -- if isPlayingMusic(id) then
            local musicData = getMusicData(id)
            if musicData then
                if musicData.currentTime == musicData.maxDuration-1 then
                    SendNUIMessage({
                        message = 'SET_MUSIC_DATA',
                        musicData = musicData,
                        nextSong = true
                    })
                    else
                    SendNUIMessage({
                        message = 'SET_MUSIC_DATA',
                        musicData = musicData,
                        nextSong = false
                    })
                end
            end
        -- end
        Wait(1000)
    end
end)


function getMusicData(musicId)
    local musicData = exports['xsound']:getInfo(musicId)
    if not musicData then return false end
    return {
        currentTime = musicData.timeStamp,
        maxDuration = musicData.maxDuration,
        volume = musicData.volume * 100,
        paused = musicData.paused,
        playing = musicData.playing,
        url = musicData.url
    }
end

local autopilotActive = false
local blipX = 0.0
local blipY = 0.0
local blipZ = 0.0

RegisterNUICallback('AUTO_PILOT_START', function(data,cb)
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player)
    local model = GetEntityModel(vehicle)
    local displaytext = GetDisplayNameFromVehicleModel(model)
    local blip = GetFirstBlipInfoId(8)
    if (blip ~= nil and blip ~= 0) then
        if data.status == true then
            local coord = GetBlipCoords(blip)
            blipX = coord.x
            blipY = coord.y
            blipZ = coord.z
            TaskVehicleDriveToCoordLongrange(player, vehicle, blipX, blipY, blipZ, Config.AutoPilot["SPEED"], Config.AutoPilot["DRIVING_MODE"], 2.0)
            autopilotActive = true
        elseif data.status == false then
            autopilotActive = false
            ClearPedTasks(PlayerPedId())
        end
    else
        Config.Notification('secilmedi', 'error')
    end
end)




Citizen.CreateThread(function()
    while true do
      Citizen.Wait(200) 
      if autopilotActive then
           local coords = GetEntityCoords(PlayerPedId())
           local blip = GetFirstBlipInfoId(8)
           local dist = Vdist(coords.x, coords.y, coords.z, blipX, blipY, coords.z)
           if dist <= 10 then
              local player = PlayerPedId()
              local vehicle = GetVehiclePedIsIn(player,false)
              ClearPedTasks(player)
              SetVehicleForwardSpeed(vehicle,19.0)
              Citizen.Wait(200)
              SetVehicleForwardSpeed(vehicle,15.0)
              Citizen.Wait(200)
              SetVehicleForwardSpeed(vehicle,11.0)
              Citizen.Wait(200)
              SetVehicleForwardSpeed(vehicle,6.0)
              Citizen.Wait(200)
              SetVehicleForwardSpeed(vehicle,0.0)
              autopilotActive = false
           end
        end
    end
end)

function CalculateDistance(coord1, coord2)
    return #(coord1 - coord2)
end

function FindNearestLocationOfType(playerCoord, locationType)
    local nearestLocation = nil
    local nearestDistance = nil
    local locations = Config.QuickLocations[locationType]
    if locations then
        for i, coords in ipairs(locations) do
            local distance = CalculateDistance(playerCoord, coords)
            
            if not nearestDistance or distance < nearestDistance then
                nearestLocation = coords
                nearestDistance = distance
            end
        end
    end
    return nearestLocation, nearestDistance
end


RegisterNUICallback('MARK_NEAREST', function(data,cb)
    local playerPed = PlayerPedId()
    local playerCoord = GetEntityCoords(playerPed)
    local locationType = data.location 
    local nearestLocation, nearestDistance = FindNearestLocationOfType(playerCoord, locationType)
    if nearestLocation then
        SetNewWaypoint(nearestLocation.x, nearestLocation.y)
    end
end)


function TriggerCallback(name, data)
    local incomingData = false
    local status = 'UNKOWN'
    local counter = 0
    while Core == nil do
        Wait(0)
    end
    if Config.Framework == 'esx' then
        Core.TriggerServerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    else
        Core.Functions.TriggerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    end
    CreateThread(function()
        while incomingData == 'UNKOWN' do
            Wait(1000)
            if counter == 4 then
                status = 'FAILED'
                incomingData = false
                break
            end
            counter = counter + 1
        end
    end)

    while status == 'UNKOWN' do
        Wait(0)
    end
    return incomingData
end



