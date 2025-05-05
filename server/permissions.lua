-- permissions.lua - Logic for checking admin roles with Ace Permissions

-- Import configuration from permissions_config.lua
local permissionsConfig = require('config.permissions_config')

-- Function to check if a player has the required admin role
function IsPlayerAdmin(src)
    local identifiers = GetPlayerIdentifiers(src)
    for _, id in pairs(identifiers) do
        if string.sub(id, 1, string.len("discord:")) == "discord:" then
            local discordId = string.sub(id, 9)
            for _, role in pairs(permissionsConfig.AdminRoles) do
                if discordId == role.id then
                    -- Assign Ace Permission based on the Discord Role ID
                    Add_ACE(src, role.acePermission)  -- Grants the player the Ace permission
                    return true
                end
            end
        end
    end
    return false
end
