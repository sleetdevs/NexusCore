fx_version 'cerulean'
game 'gta5'

-- Add RageUI as a dependency
dependency 'RageUI'

server_script {
    'shared/core.lua',
    'server/main.lua',
    'server/permissions.lua'
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
