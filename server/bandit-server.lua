 ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
   end)
   


RegisterServerEvent('BanditSearch:GiveRandomItems')
AddEventHandler('BanditSearch:GiveRandomItems', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        for i = 1, math.random(1, 1), 1 do
            local chance = math.random(Config.BanditSearch.Chance.mininum, Config.BanditSearch.Chance.maximum)
            local item = Config.BanditSearch.GiveRandomItems[math.random(1, #Config.BanditSearch.GiveRandomItems)]
            xPlayer.addInventoryItem(item, chance)
        end
end)
