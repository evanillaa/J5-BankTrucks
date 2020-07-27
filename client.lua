local spawnTheTRUCK = false
local targetVehicleped 
local timer = nil 
local canBankCard = false
local canDoAnything = true 
local isRobbing = false
local sec = 1000
local min = sec *60 
local fourty = min *40
local phaseAllow = false
local tick = 0 
local isdumb = true

-- Joe5ki twitch.tv/joe5ki

local spawns = { -- Will be used for spawning the vehicles at direct times if the other way doesnt work
[0] = {['x'] = -104.27612304688,['y'] = 6488.6264648438,['z'] = 30.708909988403},
[1] = {['x'] = -1520.1434326172,['y'] = -580.83502197266,['z'] = 22.740440368652},
[2] = {['x'] = -18.434614181519,['y'] = -702.42889404297,['z'] = 31.802713394165},
[3] = {['x'] = 1185.1776123047,['y'] = 2727.3310546875,['z'] = 37.469100952148},
}

local type = {
    [1] = 'green',
    [2] = 'blue',
    [3] = 'red',
    [4] = 'gold',
    [5] = 'yellow',
    [6] = 'pruple',
}

local center = { -- Will be used to get times on how long it takes to open the door.,
[0] = {['x'] = -98.773475646973,['y'] = -852.99230957031,['z'] = 40.554481506348},
}


function modelRequest(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
end

function Rob3(timer, phase)
    looting = true
    TriggerEvent('loot')
    TriggerEvent("mythic_progressbar:client:progress", {
		name = "Phase",
		duration = timer,
		label = "Robbing.. Phase: " .. phase,
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = false,
		},
	}, function(status)
		if not status then
            amount = math.random(2,5)
            TriggerServerEvent('BandsBABY', amount)
            looting = false
            print('Giveitems')
            looting = false
            ClearPedTasks(GetPlayerPed(-1))
            if math.random(100) > 65 then --35%
                type = math.random(1,6)
                TriggerServerEvent('CARDPog', type)
                    -- Give bank card
                print('GiveCard')
            end
        end
    end)
end

function Rob2(timer, phase)
    if phaseAllow == true then 
        looting = true
        TriggerEvent('loot')
        TriggerEvent("mythic_progressbar:client:progress", {
			name = "Phase",
			duration = timer,
			label = "Robbing.. Phase: " .. phase,
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = false,
			},
		}, function(status)
			if not status then
                amount = math.random(2,5)
                TriggerServerEvent('BandsBABY', amount)
                print('Giveitems')
                if math.random(100) > 85 then --15%
                    type = math.random(1,6)
                    TriggerServerEvent('CARDPog', type)
                    -- Give bank card
                    print('GiveCard')
                end
                Wait(2000)
                phase = 3
                timer = sec * 15
                phaseAllow = false
                Rob3(timer, phase)
                looting = false
                ClearPedTasks(GetPlayerPed(-1))
			end
        end)
    end

end

function Rob(targetVehicle)
 -- robbing funct
    if isRobbing == true then
        looting = true
        TriggerEvent('loot', targetVehicle)
        local timer = sec * 5 -- 30 sec default
        local phase = 1
        local amount = nil
        TriggerEvent("mythic_progressbar:client:progress", {
			name = "Phase",
			duration = timer,
			label = "Robbing.. Phase: " .. phase,
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = false,
			},
		}, function(status)
			if not status then
                amount = math.random(2,5)
                TriggerServerEvent('BandsBABY', amount)
                print('Giveitems')
                if math.random(100) > 95 then --5%
                    type = math.random(1,6)
                    TriggerServerEvent('CARDPog', type)
                    -- Give bank card
                    print('GiveCard')
                end
                canBankCard = false
                isRobbing = false
                TriggerServerEvent('RejectTruck', isdumb, targetVehicle)
                Wait(2000)
                phaseAllow = true
                phase = 2
                timer = sec * 10
                Rob2(timer, phase, phaseAllow)
                looting = false
                ClearPedTasks(GetPlayerPed(-1))
			end
        end)
    end
end

function cuntPunch(targetVehicle)
    welding = fa
    modelRequest(0xCDEF5408)
    local source = GetPlayerPed(-1)

    local cunt = {
        [1] = CreatePedInsideVehicle(targetVehicle,27, 0xCDEF5408, 2, true, true),
        [2] = CreatePedInsideVehicle(targetVehicle,27, 0xCDEF5408, 1, true, true),
        [3] = CreatePedInsideVehicle(targetVehicle,27, 0xCDEF5408, 0, true, true),
    }

    
    for i=1, 3 do   
        GiveWeaponToPed(cunt[i], 0xC0A3098D, 200, false, true )
        TaskLeaveVehicle(cunt[i], targetVehicle, 0)
        TaskCombatPed(cunt[i], source)
        SetPedAccuracy(cunt[i], 100)
        SetPedArmour(cunt[i], 100)
        SetPedAsCop(cunt[i], true)
    end

    if IsPedDeadOrDying(cunt[i]) then 
        tick = 30 -- total of 30 sec to rob after npc spawns.
        canBankCard = true 
        isRobbing = true
        while tick > 0 do
            Citizen.Wait(1000)
            tick = tick -1 
            if tick == 0  then 
                canBankCard = false 
                isRobbing = false
            end
        end
    end
end

-- Citizen.CreateThread(function()
--     while true do 
--         Citizen.Wait(1)
--         print(tick)
--     end
-- end)

function blowIt(ReggieABitch, targetVehicle)
    print('pussy')
    -- PUT ALERT HERE FOR POLICE
    -- PUT ALERT HERE FOR POLICE
    -- PUT ALERT HERE FOR POLICE
    -- PUT ALERT HERE FOR POLICE
    -- PUT ALERT HERE FOR POLICE
    welding = true
    TriggerEvent('BlowTorch', targetVehicle)

    if ReggieABitch <= 600 then 
        timer = 5000 -- 5 Sec in city area
        TriggerEvent("mythic_progressbar:client:progress", {
			name = "Phase",
			duration = timer,
			label = "You a Wizard",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = false,
			},
		}, function(status)
			if not status then
                cuntPunch(targetVehicle)
                welding = false
			end
        end)
    elseif ReggieABitch <= 1200 then 
        timer = 10000 -- 10 sec
        TriggerEvent("mythic_progressbar:client:progress", {
			name = "Phase",
			duration = timer,
			label = "You a Wizard",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = false,
			},
		}, function(status)
			if not status then
                cuntPunch(targetVehicle)
                welding = false
			end
        end)
    elseif ReggieABitch <= 2000 then 
        timer = 15000 -- 15 sec
        TriggerEvent("mythic_progressbar:client:progress", {
			name = "Phase",
			duration = timer,
			label = "You a Wizard",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = false,
			},
		}, function(status)
			if not status then
                cuntPunch(targetVehicle)
                welding = false
			end
        end)
    elseif ReggieABitch <= 4000 then 
        timer = 30000 -- 30 sec
        TriggerEvent("mythic_progressbar:client:progress", {
			name = "Phase",
			duration = timer,
			label = "You a Wizard",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = false,
			},
		}, function(status)
			if not status then
                cuntPunch(targetVehicle)
                welding = false
			end
        end)
    elseif ReggieABitch <= 6000 then 
        timer = 35000 -- 35 sec
        TriggerEvent("mythic_progressbar:client:progress", {
			name = "Phase",
			duration = timer,
			label = "You a Wizard",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = false,
			},
		}, function(status)
			if not status then
                cuntPunch(targetVehicle)
                welding = false
			end
        end)
    elseif ReggieABitch <= 9000 then 
        timer = 40000 -- 40 sec
        TriggerEvent("mythic_progressbar:client:progress", {
			name = "Phase",
			duration = timer,
			label = "You a Wizard",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = false,
			},
		}, function(status)
			if not status then
                cuntPunch(targetVehicle)
                welding = false
			end
        end)
    end
    welding = false
    ClearPedTasks(GetPlayerPed(-1))
end

RegisterNetEvent('TruckRob') -- Will trigger this when item is used and will do all math and shit when its doing// not for BLACK CARD
AddEventHandler('TruckRob', function(source)
	local playerped = PlayerPedId()
    local coordA = GetEntityCoords(playerped, 1)
    local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    local targetVehicle = getVehicleInDirection(coordA, coordB)
    local ass = GetEntityModel(targetVehicle)
    local eatass = GetDisplayNameFromVehicleModel(ass)
    local ReggieABitch =  #(vector3(center[0]['x'],center[0]['y'],center[0]['z']) - coordA)
    if GetVehicleBodyHealth(targetVehicle) >= 1 then
        if canBankCard == true and isRobbing == true and tick > 0 then 
            if targetVehicle ~= 0 and eatass == 'STOCKADE' then -- Gets Correct Vehicle so only works on the truck

                local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
                local moveto = GetOffsetFromEntityInWorldCoords(targetVehicle, 0.0,d2['y']-6.8,0.0)
                local dist = #(vector3(moveto['x'],moveto['y'],moveto['z']) - GetEntityCoords(PlayerPedId()))
                local count = 1000

                while dist > 1.2 and count > 0 do
                    dist = #(vector3(moveto['x'],moveto['y'],moveto['z']) - GetEntityCoords(PlayerPedId()))
                    Citizen.Wait(1)
                    count = count - 1
                    DrawText3Ds(moveto['x'],moveto['y'],moveto['z'],'Move Here To Rob.') -- Back of Truck
                end
                Rob(targetVehicle)
            end
        elseif canBankCard == false and isRobbing == false and tick == 0 then 
            
            if targetVehicle ~= 0 and eatass == 'STOCKADE' then -- Gets Correct Vehicle so only works on the truck

                local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
                local moveto = GetOffsetFromEntityInWorldCoords(targetVehicle, 0.0,d2['y']-6.8,0.0)
                local dist = #(vector3(moveto['x'],moveto['y'],moveto['z']) - GetEntityCoords(PlayerPedId()))
                local count = 1000

                while dist > 1.2 and count > 0 do
                    dist = #(vector3(moveto['x'],moveto['y'],moveto['z']) - GetEntityCoords(PlayerPedId()))
                    Citizen.Wait(1)
                    count = count - 1
                    DrawText3Ds(moveto['x'],moveto['y'],moveto['z'],'Move Here To Blow.') -- Back of Truck
                end
                blowIt(ReggieABitch, targetVehicle)
            end
        end
    else 
        print('vehicle no robbo')
    end
end)

function getVehicleInDirection(coordFrom, coordTo) -- Gets vehicle
    local offset = 0
    local rayHandle
    local vehicle

    for i = 0, 100 do
        rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)   
        a, b, c, d, vehicle = GetRaycastResult(rayHandle)
        
        offset = offset - 1

        if vehicle ~= 0 then break end
    end
    
    local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
    
    if distance > 25 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

function DrawText3Ds(x,y,z, text) -- Draw 3d text
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 245, 215)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 71, 41, 68)
end

RegisterNetEvent('FuckVehicle')
AddEventHandler('FuckVehicle', function(electricVeh, fucked, targetVehicle)
    if fucked == true then 
        SetVehicleBodyHealth(targetVehicle, 0.0)
        SetVehicleAsNoLongerNeeded(targetVehicle)
        print('Fuccccked')
    end
end)


RegisterNetEvent('loot')
AddEventHandler('loot', function(targetVehicle)
    if targetVehicle then
        SetVehicleDoorOpen(targetVehicle,6 , 0, 0)
        TaskTurnPedToFaceEntity(PlayerPedId(), targetVehicle, 1.0)
    end

    RequestAnimDict('mini@repair')
    while not HasAnimDictLoaded('mini@repair') do
        Citizen.Wait(0)
    end

    while looting do
        local animation = IsEntityPlayingAnim(PlayerPedId(), 'mini@repair', 'fixing_a_player', 3)
        if not animation then
            TaskPlayAnim(PlayerPedId(), 'mini@repair', 'fixing_a_player', 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end

    Citizen.Wait(1000)
end)


RegisterNetEvent('BlowTorch')
AddEventHandler('BlowTorch', function(targetVehicle)
    RequestAnimDict('rcmbarry')
    while not HasAnimDictLoaded('rcmbarry') do
        Citizen.Wait(0)
    end

    while welding do
        local animation = IsEntityPlayingAnim(PlayerPedId(), 'rcmbarry', 'bar_1_attack_idle_aln', 3)
        if not animation then
            TaskPlayAnim(PlayerPedId(), 'rcmbarry', 'bar_1_attack_idle_aln', 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), targetVehicle, 1.0)
    Citizen.Wait(1000)
end)