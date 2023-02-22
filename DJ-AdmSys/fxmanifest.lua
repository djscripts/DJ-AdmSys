fx_version 'cerulean'
games 'gta5'

Author 'DaniJim#0001'

shared_scripts {
    'shared/sh_*.lua'
};
server_scripts {
    'core/server/sv_main.lua',
    'core/server/sv_commands.lua'
};

client_scripts {
    'core/client/cl_*.lua',
    'core/client/modules/cl_*.lua'
};