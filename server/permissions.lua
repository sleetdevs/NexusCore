-- permissions.lua - Logic for checking admin roles with Ace Permissions

-- Import configuration
local Config = require('config')

-- Loop through the player's Discord identifiers and check for roles and Ace permissions
function IsPlayerAdmin(src)
    local identifiers = GetPlayerIdentifiers(src)
    for _, id in pairs(identifiers) do
        if string.sub(id, 1, string.len("discord:")) == "discord:" then
            local discordId = string.sub(id, 9)
            for _, role in pairs(Config.AdminRoles) do
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
