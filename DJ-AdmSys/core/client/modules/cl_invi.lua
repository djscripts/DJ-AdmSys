invi = false

RegisterNetEvent('DJ-AdmSys:invi')
AddEventHandler('DJ-AdmSys:invi', function()
	invi = not invi
    local ped = GetPlayerPed(-1)
    SetEntityVisible(ped, not invi, false)
    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == 'admin' then
            if invi == true then 
                Notification('Has ~g~activado ~w~el ~y~invisible')
            else
                Notification('Has ~g~desactivado ~w~el ~y~invisible')
            end
        else
            KickPlayer()
        end
    end)
end)