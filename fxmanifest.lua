fx_version 'cerulean'
game 'gta5'

-- Add RageUI as a dependency
dependency 'RageUI'

server_scripts {
    'server/main.lua',
    'server/permissions.lua',
    'server/config/permissions_config.lua',
}

client_scripts {
    'client/main.lua',
    'client/menus.lua',
}

shared_scripts {
    'shared/core.lua',
}

-- Export Core Object (if you haven't already done so)
export 'GetCoreObject'
