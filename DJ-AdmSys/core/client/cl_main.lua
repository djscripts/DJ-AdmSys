--- ADMIN MENU ---

function adminMenu() 
    local elements = {}
	    table.insert(elements, {label = 'Menú TPs', value = 'tpsMenu'})
      table.insert(elements, {label = 'Menú PEDs', value = 'pedsMenu'})
      table.insert(elements, {label = 'Acciones Administrador', value = 'actionsMenu'})
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'headbagging',
      {
        title    = 'Menú de Administracion',
        align    = 'bottom-right',
        elements = elements
        },
            function(data, menu)
             if data.current.value == 'tpsMenu' then
                tpsMenu()
             elseif data.current.value == 'pedsMenu' then
                pedsMenu()
             elseif data.current.value == 'actionsMenu' then
                actionsMenu()
            else
            end
        end,
      function(data, menu)
        menu.close()
        
      end)
  end




--- TPs MENU ---

function tpsMenu() 
    local elements = {}
        table.insert(elements,	{label = 'Comisaria | Mission Row', value = 'comisaria', coords = {x = 422.75, y = -990.80, z = 29.69}})
        table.insert(elements,	{label = 'Hospital | PillboxHill', value = 'pillbox', coords = {x = 304.8132, y = -616.9582, z = 42.4337}})
        table.insert(elements,	{label = 'Zona Admin | MazeBank', value = 'zone1', coords = {x = -68.6901, y = -811.4241, z = 325.1765}})
        table.insert(elements,	{label = 'Zona Admin | Base Militar', value = 'zone2', coords = {x = -1855.06, y = 2979.99, z = 31.82}})
    
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'headbagging',
      {
        title    = 'Menú TPs',
        align    = 'bottom-right',
        elements = elements
        },
            function(data, menu)
             if data.current.value then
                SetPedCoordsKeepVehicle(PlayerPedId(), data.current.coords.x, data.current.coords.y, data.current.coords.z)
                Notification('Has sido ~g~teletransportado ~w~a ~y~'..data.current.label)
            else
            end
        end,
    function(data, menu)
        menu.close()
    end)
end




--- PEDs MENU ---

function pedsMenu() 
  local elements = {}
      table.insert(elements, {label = 'Peds Vanilla', value = 'peds_vanilla'})
      table.insert(elements, {label = 'Ped Personalizada', value = 'custom_ped'})  
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'headbagging',
    {
      title    = 'PEDs Menú',
      align    = 'bottom-right',
      elements = elements
      },
          function(data, menu)
           if data.current.value == 'peds_vanilla' then
              pedsvanillaMenu()
           elseif data.current.value == 'custom_ped' then
              menu.close()
              custompedDialog()
          else
          end
      end,
  function(data, menu)
      menu.close()
      adminMenu()
  end)
end

function custompedDialog()
  ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'pedcustom',
  {
    title = 'Ped Personalizada',
  },
    function(data, menu)
      SetPed(data.value)
      Notification('Te has ~g~puesto ~w~la ped con hash ~y~'..data.value)
      pedsMenu()
    end, function(data, menu)
    menu.close()
    end)
end


function pedsvanillaMenu() 
  local elements = {}
      table.insert(elements,	{label = 'Michael', value = 'player_zero'})
      table.insert(elements,	{label = 'Franklin', value = 'player_one'})
      table.insert(elements,	{label = 'Trevor', value = 'player_two'})
      table.insert(elements,  {label = 'LSPD | Hombre', value = 's_m_y_cop_01'})
      table.insert(elements,  {label = 'LSPD | Mujer', value = 's_f_y_cop_01'})
  
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'headbagging',
    {
      title    = 'PEDs Menú | Vanilla',
      align    = 'bottom-right',
      elements = elements
      },
          function(data, menu)
           if data.current.value then
              SetPed(data.current.value)
              Notification('Te has ~g~puesto ~w~la ped de ~y~'..data.current.label)
          else
          end
      end,
  function(data, menu)
      menu.close()
      pedsMenu()
  end)
end

SetPed = function(pedName)
	local hash = GetHashKey(pedName)
	RequestModel(hash)
	while not HasModelLoaded(hash)
		do RequestModel(hash)
		Citizen.Wait(0)
		end
	SetPlayerModel(PlayerId(), hash)
end



--- ACCIONES DE ADMINISTRADOR ---

function actionsMenu() 
  local elements = {}
      table.insert(elements, {label = 'Noclip', value = 'noclip'})
      table.insert(elements, {label = 'Invisible', value = 'invi'})
      table.insert(elements, {label = 'GodMode', value = 'godmode'})
      table.insert(elements, {label = 'Reparar Vehículo', value = 'repair'})
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'headbagging',
    {
      title    = 'Acciones de Administrador',
      align    = 'bottom-right',
      elements = elements
      },
          function(data, menu)
            if data.current.value == 'noclip' then
              TriggerEvent('DJ-AdmSys:Noclip')
            elseif data.current.value == 'invi' then
              TriggerEvent('DJ-AdmSys:invi')
            elseif data.current.value == 'godmode' then
              TriggerEvent('DJ-AdmSys:GodMode')
            elseif data.current.value == 'repair' then
              ExecuteCommand('repair')
            else
            end
      end,
  function(data, menu)
      menu.close()
      adminMenu()
  end)
end





--- KICK PLAYER ---

function KickPlayer()
  ESX.TriggerServerCallback('kickPlayer', function() end)
  return
end