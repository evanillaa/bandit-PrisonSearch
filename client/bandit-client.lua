ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5)
	end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for k,v in pairs(Config.BanditSearch.SearchPositions) do
            local playerPed =  PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 0.5)  then
                DrawText3D(v.x, v.y, v.z, (Config.BanditSearch.Drawtext))
                if IsControlJustReleased(0, 38) then
                    TaskStartScenarioInPlace(playerPed, Config.BanditSearch.Animation, 0, true)
                    exports['progressBars']:startUI(Config.BanditSearch.ProgressBarTimer, Config.BanditSearch.ProgressBarTimerText)
                    Wait(Config.BanditSearch.ProgressBarTimer)
                    TriggerServerEvent('BanditSearch:GiveRandomItems')
                    ClearPedTasks(playerPed)
                end
            else
                Citizen.Wait(Config.BanditSearch.SleepThread)
            end
            break
        end
    end
end)


function DrawText3D(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z - 1)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        local onScreen,_x,_y=World3dToScreen2d(x,y,z)
        local px,py,pz=table.unpack(GetGameplayCamCoords())
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
    end
end
