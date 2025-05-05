fx_version 'cerulean'
game 'gta5'
author 'sleetdevs'
description 'Sleet - NexusCore Framework'
version '1.0.0'
lua54 'yes'

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

dependencies {
    'RageUI',  -- If you are using RageUI, make sure this is listed as a dependency
}

-- Export Core Object (if you haven't already done so)
export 'GetCoreObject'
