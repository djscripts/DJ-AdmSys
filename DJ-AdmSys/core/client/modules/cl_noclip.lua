ng_noclip = false
speed = 2.01

Citizen.CreateThread(function()
    while true do 
        local _msec = 250
        if ng_noclip then
          _msec = 0
            local ped = GetPlayerPed(-1)
            local x,y,z = getPosition()
            local dx,dy,dz = getCamDirection()
            
        

            SetEntityVelocity(ped, 0.05,  0.05,  0.05)

            if IsControlPressed(0, 32) then
              _msec = 0
                x = x + speed * dx
                y = y + speed * dy
                z = z + speed * dz
            end

            if IsControlPressed(0, 269) then
              _msec = 0
                x = x - speed * dx
                y = y - speed * dy
                z = z - speed * dz
            end

            SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
        end
        Citizen.Wait(_msec)
    end
end)

RegisterNetEvent('DJ-AdmSys:Noclip')
AddEventHandler('DJ-AdmSys:Noclip',function()
	ng_noclip = not ng_noclip
    local ped = GetPlayerPed(-1)

    ESX.TriggerServerCallback("DJ-AdmSys:UserRank", function(UserRank)
        if UserRank == 'admin' then
            if ng_noclip then
    	        SetEntityInvincible(ped, true)
    	        SetEntityVisible(ped, false, false)
            else
    	        SetEntityInvincible(ped, false)
    	        SetEntityVisible(ped, true, false)
            end
        else
            print('drop')
            KickPlayer()
        end
    end)

    if ng_noclip == true then
        Notification('Has ~g~activado ~w~el ~y~noclip')
    else
        Notification('Has ~g~desactivado ~w~el ~y~noclip')
    end
end)

getPosition = function()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  	return x,y,z
end

getCamDirection = function()
	local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
	local pitch = GetGameplayCamRelativePitch()
  
	local x = -math.sin(heading*math.pi/180.0)
	local y = math.cos(heading*math.pi/180.0)
	local z = math.sin(pitch*math.pi/180.0)
  
	local len = math.sqrt(x*x+y*y+z*z)
	if len ~= 0 then
	  x = x/len
	  y = y/len
	  z = z/len
	end
  
	return x,y,z
end
