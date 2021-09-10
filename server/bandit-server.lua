RegisterServerEvent('banditSearch:giveRandomItems')
AddEventHandler('banditSearch:giveRandomItems', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local chance = math.random(Config.banditSearch.Chance.mininum, Config.banditSearch.Chance.maximum)
    local item = Config.banditSearch.giveRandomItems[math.random(1, #Config.banditSearch.giveRandomItems)]
    xPlayer.addInventoryItem(item, chance)
end)
