--- PLAYER RANK ---

ESX.RegisterServerCallback("DJ-AdmSys:UserRank", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)




--- LOGs ---

function fichajeAdm(name, message)
    local user = 'DJ-Scripts'
    local avatar ='https://cdn.discordapp.com/attachments/1029742600795725835/1074047935542722632/Logo.png'
    local webhook = ''  -- Pon aquí tu webhook / Put here your webhook
    local embed = {
          {
            ["color"] = 0,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = os.date("Fecha: %x · Hora: %X %p"),
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/1029742600795725835/1074047935542722632/Logo.png'
            },
          }
      }
  
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({avatar_url = avatar, username = user, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function getIdentifierType(source, type)
    if not source then
        return nil
    end

    for key, value in next, GetPlayerIdentifiers(source) do
        if value:match(type) then
            return type ~= 'discord' and value or value:sub(string.len('discord:') + 1)
        end
    end

    return nil
end




--- KICK ---

ESX.RegisterServerCallback('kickPlayer', function(source,cb)
    local x = ESX.GetPlayerFromId(source)
    local nombre = GetPlayerName(source)
    CreateThread(function()
        Wait(150)
        DropPlayer(source, '[DJ-AdmSysSystem] \n Buenas '.. nombre .. ' has sido kickeado del servidor. \n\n Razón: Activar funciones de Administrador sin serlo \n Tu IP: '..GetPlayerEndpoint(source)..' \n Esperamos que no se vuelva a repetir.')
    end)
end)