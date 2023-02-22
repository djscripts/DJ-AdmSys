godmode = false

RegisterNetEvent('DJ-AdmSys:GodMode')
AddEventHandler('DJ-AdmSys:GodMode', function()
	godmode = not godmode
	local playerPed = PlayerPedId()
    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == 'admin' then
	        if godmode then
		        SetEntityInvincible(playerPed, true)
		        Notification('Has ~g~activado ~w~el ~y~godmode')
	        else
		        SetEntityInvincible(playerPed, false)
		        Notification('Has ~g~desactivado ~w~el ~y~godmode')
	        end
        else
            KickPlayer()
        end
    end)
end)