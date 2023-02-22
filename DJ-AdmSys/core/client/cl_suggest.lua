--- DIMENSIONS ---

TriggerEvent('chat:addSuggestion', '/setdimension', 'Setear dimensión de un jugador (Solo Admin)', {
    { name="ID", help='Player ID' },
    { name="Dimension", help='Dimension' }
})

TriggerEvent('chat:addSuggestion', '/resetdimension', 'Resetear dimensión de un jugador a la default (Solo Admin)', {
    { name="ID", help='Player ID' },
})


--- REPAIR ---

TriggerEvent('chat:addSuggestion', '/repair', 'Reparar vehículo (Solo admin)', nil)


--- PEDS ---

TriggerEvent('chat:addSuggestion', '/admin:peds', 'Abrir menú de peds (Solo admin)', nil)


--- TPs ---

TriggerEvent('chat:addSuggestion', '/tps', 'Abrir menú de TPs (Solo admin)', nil)


--- ADMIN MENÚ --- 

TriggerEvent('chat:addSuggestion', '/admin:menu', 'Abrir menú de administración (Solo admin)', nil)


--- RELLENAR ---

TriggerEvent('chat:addSuggestion', '/rellenar', 'Rellenar tanque del vehículo (Solo admin)', nil)


--- FICHARADM ---

TriggerEvent('chat:addSuggestion', '/ficharadm', 'Fichar servicio en administración (Solo Admin)', {
    { name="Tipo", help='entrada / salida' },    
})


--- KICK ---

TriggerEvent('chat:addSuggestion', '/kick', 'Kickear jugador (Solo Admin)', {
    { name="ID", help='Player ID' },    
})


--- CHAT ADMIN ---

TriggerEvent('chat:addSuggestion', '/ac', 'Chat administración (Solo Admin)', {
    { name="message", help='Message' },    
})


--- TP ---


TriggerEvent('chat:addSuggestion', '/tp', 'Tepearte a coordenadas (Solo Admin)', {
    {name="X", help='Eje X'},
    {name="Y", help='Eje Y'},
    {name="Z", help='Eje Z'},
})



--- NOCLIP ---

TriggerEvent('chat:addSuggestion', '/admin:noclip', 'Activar Noclip (Solo admin)', nil)


--- INVI ---

TriggerEvent('chat:addSuggestion', '/invi', 'Activar Invisible (Solo admin)', nil)