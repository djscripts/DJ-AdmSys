--- FICHARADM ---

RegisterCommand('ficharadm', function(source, args)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    steam = GetPlayerName(source)
    discord = getIdentifierType(source, 'discord')
    group = xPlayer.getGroup()

    if group == 'admin' then
        if args[1] == "entrada" then 
            fichajeAdm('Fichaje Administración', '**Tipo:** Entrada \n \n **Discord:** <@'..discord..'>\n **Steam:** '..steam)
            xPlayer.showNotification('Has fichado tu ~g~entrada ~w~de servicio en ~y~administración')
        elseif args[1] == "salida" then 
            fichajeAdm('Fichaje Administración', '**Tipo:** Salida \n \n **Discord:** <@'..discord..'>\n **Steam:** '..steam)
            xPlayer.showNotification('Has fichado tu ~g~salida ~w~de servicio en ~y~administración')
        else
            xPlayer.showNotification('Introduce un valor ~g~válido')
        end
    else 
        xPlayer.showNotification('No tienes permisos suficientes')
    end
end)




--- DIMENSIONS ---

RegisterCommand('setdimension', function(source, args)
    local id = args[1]
    local dimension = tonumber(args[2])
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local group = xPlayer.getGroup()

    if group == 'admin' then
        if id == nil then
            xPlayer.showNotification('Introduce el comando de forma correcta')
        elseif dimension == nil then
            xPlayer.showNotification('Introduce el comando de forma correcta')
        else
            local vehiculo = GetVehiclePedIsIn(GetPlayerPed(id), false)
             if vehiculo ~= 0 then
                SetEntityRoutingBucket(vehiculo, dimension)
                SetPlayerRoutingBucket(id, dimension)
                TaskWarpPedIntoVehicle(GetPlayerPed(id), vehiculo, -1)
                xPlayer.showNotification('La dimension de la ID '..id..' ha sido actualizada a la '..dimension)
             else
                SetPlayerRoutingBucket(id, dimension)
                xPlayer.showNotification('La dimension de la ID '..id..' ha sido actualizada a la '..dimension)
             end
        end
    else
        xPlayer.showNotication('No tienes permisos suficientes')
    end

end, false)

RegisterCommand('resetdimension', function(source, args)
    local id = args[1]
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local group = xPlayer.getGroup()
    

    if group == 'admin' then
        if id == nil then
            xPlayer.showNotification('Introduce el comando de forma correcta')
        else
            if vehiculo ~= 0 then
                SetEntityRoutingBucket(vehiculo, 0)
                SetPlayerRoutingBucket(id, 0)
                TaskWarpPedIntoVehicle(GetPlayerPed(id), vehiculo, -1)
                xPlayer.showNotification('La dimension de la ID '..id..' ha sido actualizada a la default')
            else
                SetPlayerRoutingBucket(id, 0)
                xPlayer.showNotification('La dimension de la ID '..id..' ha sido actualizada a la default')
            end
        end
    else
        xPlayer.showNotification('No tienes permisos suficientes')
    end
end, false)




--- KICK ---

RegisterCommand('kick', function(source, args)
    local id = args[1]
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local group = xPlayer.getGroup()
    
    if group == 'admin' then
        if id == nil then
            xPlayer.showNotification('Introduce valores válidos')
        else
            Player = ESX.GetPlayerFromId(id)
            if Player then
                xPlayer.showNotification('Has ~g~kickeado ~w~al jugador con ID ~y~' .. id)
                DropPlayer(id, 'Has sido kickeado del servidor por un administrador')
            else
                xPlayer.showNotification('El ID ' .. id .. ' no está conectado')
            end
        end
    else
        xPlayer.showNotification('No tienes permisos suficientes')
    end
end)




--- CHAT ADMIN ---

RegisterCommand('ac', function(source, args, rawCommand)
    if source == 0 then
        return
    end
    local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source
    local group = xPlayer.getGroup()
    steam = GetPlayerName(source)

    if group == 'admin' then
        args = table.concat(args, ' ')
        for k,v in ipairs(ESX.GetPlayers()) do
            if group == 'admin' then
                TriggerClientEvent('chat:addMessage', -1, {template = '<div style="padding: 2px; border: 2px solid rgba(46, 98, 0, 0.4); margin: 1px; size : 10px; background-color: rgba(46, 98, 0, 0.4); border-radius: 3px;"><i class="fa-solid fa-shield"></i> Chat Administración | '..steam..': {0}</div>', args = {args}})
            end
        end
    else 
        xPlayer.showNotification('No tienes permisos suficientes')
    end
end, false)