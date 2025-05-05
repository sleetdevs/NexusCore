-- config.lua - Admin Role IDs and configuration settings

Config = {}

-- Discord Role IDs
Config.AdminRoles = {
    -- Replace these IDs with actual Discord Role IDs from your server
    { id = "123456789012345678", acePermission = "nexuscore.admin" }, -- Example role
    { id = "987654321098765432", acePermission = "nexuscore.moderator" } -- Another role example
}

-- Examples of how to config in your permissions.cfg or server.cfg

-- add_ace group.admin nexuscore.admin allow
-- add_ace group.admin nexuscore.moderator allow

-- You can deny permissions by using "deny" instead of "allow"

-- add_ace group.moderator nexuscore.moderator deny
-- add_ace group.user nexuscore.user deny