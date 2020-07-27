local canRobBitch = true -- used for allowing rob of truck
local fucked = true
-- esx shit
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function rejectIdiot(isdumb, targetVehicle) -- if vehicle already robbed then does shit
-- Lul does nothing stops person
    if isdumb == true then 
        local electricVeh = 0.0
        fucked = true
        TriggerClientEvent('FuckVehicle', source, electricVeh, fucked, targetVehicle)
        print('veh fucked')
    else
        fucked = false
    end
end

RegisterServerEvent('RejectTruck')
AddEventHandler('RejectTruck', function(isdumb, targetVehicle)
    rejectIdiot(isdumb, targetVehicle)
end)


function Accepted(source) -- Sex life 
    TriggerClientEvent('TruckRob', source) 
end



RegisterCommand('daddyPls', function(source)
    Accepted(source)
end)
-- esx items 

RegisterServerEvent('BandsBABY')
AddEventHandler('BandsBABY', function(amount)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer == xPlayer then
        xPlayer.addInventoryItem('MoneyBand', amount)
    end
end)

RegisterServerEvent('CARDPog')
AddEventHandler('CARDPog', function(type)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
    if type == green then 
        xPlayer.addInventoryItem('GreenCard', 1)
        print('GotCard')
    end
    if type == blue then 
        xPlayer.addInventoryItem('BlueCard', 1)
        print('GotCard')
    end
    if type == red then 
        xPlayer.addInventoryItem('RedCard', 1)
        print('GotCard')
    end
    if type == gold then 
        xPlayer.addInventoryItem('GoldCard', 1)
        print('GotCard')
    end 
    if type == yellow then
        xPlayer.addInventoryItem('YellowCard', 1)
        print('GotCard')
    end
    if type ==  purple then 
        xPlayer.addInventoryItem('PurpleCard', 1)
        print('GotCard')
    end 
end)

-- esx items
ESX.RegisterUsableItem('blowtorch', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do
    Citizen.Wait(0)
    xPlayer = ESX.GetPlayerFromId(source)
  end
  if xPlayer.getInventoryItem('blowtorch').count > 0 then
    if math.random(100) > 90 then
      xPlayer.removeInventoryItem('blowtorch', 1)
    end
    Accepted(source)
  end
end)

ESX.RegisterUsableItem('BankCard', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do
    Citizen.Wait(0)
    xPlayer = ESX.GetPlayerFromId(source)
  end
  if xPlayer.getInventoryItem('BankCard').count > 0 then
    if math.random(100) > 90 then
      xPlayer.removeInventoryItem('BankCard', 1)
    end
    Accepted(source)
  end
end)