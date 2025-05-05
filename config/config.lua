-- permissions_config.lua - Config file for role-based Ace permissions

Config = {}

-- Define your Discord Role IDs here and map them to Ace permissions
Config.AdminRoles = {
    { id = "123456789012345678", acePermission = "nexuscore.admin" }, -- Replace with actual Discord Role IDs
    { id = "987654321098765432", acePermission = "nexuscore.moderator" } -- Another role example
}

return Config

-- Examples of how to config in your permissions.cfg or server.cfg

-- add_ace group.admin nexuscore.admin allow
-- add_ace group.admin nexuscore.moderator allow

-- You can deny permissions by using "deny" instead of "allow"

-- add_ace group.moderator nexuscore.moderator deny
-- add_ace group.user nexuscore.user deny