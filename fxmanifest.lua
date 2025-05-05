fx_version 'cerulean'
game 'gta5'

author 'sleetdevs'
description 'NexusCore Framework'
version '1.0.0'

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/main.lua',
    'server/commands.lua',
}

shared_scripts {
    'shared/*.lua',
}

lua54 'yes'
