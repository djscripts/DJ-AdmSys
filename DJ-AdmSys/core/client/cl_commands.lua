--- ADMIN MENU ---

RegisterKeyMapping('admin:menu', 'Menú de Administración [Solo Admin]', 'keyboard', Shared.KeyAdmMenu)

RegisterCommand('admin:menu', function()
    local DataJob = ESX.GetPlayerData()
    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == "admin" then
            adminMenu()
        else
        end
    end)
 end)




--- TPs MENU ---

RegisterCommand('tps', function()
    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == "admin" then
            tpsMenu()
        else
            Notification('No tienes permisos suficientes')
        end
    end)
 end)

 


--- PEDs MENU ---
RegisterCommand('admin:peds', function()
    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == "admin" then
            pedsMenu()
        else
            Notification('No tienes permisos suficientes')
        end
    end)

 end)
 



--- REPAIR COCHE ---

RegisterCommand('repair', function()
    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == "admin" then
            if IsPedInAnyVehicle(PlayerPedId(), false)  then
                local vehicle = GetVehiclePedIsIn(PlayerPedId())
                SetVehicleDeformationFixed(vehicle)
                SetVehicleFixed(vehicle)
                SetVehicleFuelLevel(vehicle, 100)
                SetVehicleDirtLevel(vehicle, 0)
                exports['LegacyFuel']:SetFuel(vehicle, 100)
                Notification('Tu vehículo ha sido reparado')
            else
                Notification('Debes estar en un vehículo')
            end
        else
            Notification('No tienes permisos suficientes')
        end
    end)
 end)




--- RELLENAR TANQUE ---

RegisterCommand('rellenar', function()
    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == "admin" then
            if IsPedInAnyVehicle(PlayerPedId(), false)  then
                local vehicle = GetVehiclePedIsIn(PlayerPedId())
                exports['LegacyFuel']:SetFuel(vehicle, 100)
                Notification('Tu vehículo ha sido llenado')
            else
                Notification('Debes estar en un vehículo')
            end
        else
            Notification('No tienes permisos suficientes')
        end
    end)
 end)




--- NOCLIP ---

RegisterKeyMapping('admin:noclip', 'Noclip [Solo Admin]', 'keyboard', Shared.KeyNoclip)

RegisterCommand('admin:noclip', function()
    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == 'admin' then
            TriggerEvent('DJ-AdmSys:Noclip')
        else
            print('No tienes permiso')
        end
    end)
end)




--- INVISIBLE ---
RegisterCommand('invi', function()
    ESX.TriggerServerCallback('DJ-AdmSys:UserRank', function(UserRank)
        if UserRank == 'admin' then
            TriggerEvent('DJ-AdmSys:invi')
        else
            Notification('No tienes permisos suficientes')
        end
    end)
end)




--- TP COORDS ---

RegisterNetEvent('DJ-AdmSys:tp', function(coords)
    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == 'admin' then
            SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
        else
            Notification('No tienes permisos suficientes')
        end
    end)
end)