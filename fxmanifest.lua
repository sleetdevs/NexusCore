fx_version 'cerulean'
game 'gta5'

author 'sleetdevs'
description 'NexusCore Framework'
version '1.0.0'

client_scripts {
    'client/*.lua',
}

server_scripts {
    'client/RageUI/RMenu.lua',
    'client/RageUI/menu/RageUI.lua',
    'client/RageUI/menu/Menu.lua',
    'client/RageUI/menu/MenuController.lua',
    'client/RageUI/components/*.lua',
    'client/RageUI/menu/elements/*.lua',
    'client/RageUI/menu/items/*.lua',
    'client/RageUI/menu/panels/*.lua',
    'client/RageUI/menu/windows/*.lua',
    'client/menus.lua',
    'server/main.lua',
    'server/commands.lua',
}

shared_scripts {
    'shared/*.lua',
}

lua54 'yes'
