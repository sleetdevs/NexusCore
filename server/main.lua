local Core = exports['NexusCore']:GetCoreObject()

-- Import the permission logic
local permissions = require('permissions')

-- Print debug when resource starts
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Core.PrintDebug("NexusCore has started.")
    end
end)

-- Clean player connection handler
AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    deferrals.defer()
    Wait(0)
    deferrals.update("Checking player...")
    Wait(0)
    deferrals.done()
end)

-- Debug message on stop
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Core.PrintDebug("NexusCore has stopped.")
    end
end)

-- Handle menu access request
RegisterNetEvent("NexusCore:RequestMenu", function()
    local src = source
    if permissions.IsPlayerAdmin(src) then  -- Checking if the player has the required Ace permission
        TriggerClientEvent("NexusCore:OpenMenu", src)
    else
        TriggerClientEvent("chat:addMessage", src, {
            args = { "^1NexusCore", "You do not have permission to use this menu." }
        })
        print("[NexusCore] Unauthorized attempt by " .. GetPlayerName(src))
    end
end)

-- Handle teleportation request
RegisterNetEvent("NexusCore:TeleportToCoords", function(x, y, z)
    local src = source
    if permissions.IsPlayerAdmin(src) then  -- Checking Ace permission for teleportation
        local playerPed = GetPlayerPed(src)
        SetEntityCoords(playerPed, x, y, z, false, false, false, true)
        TriggerClientEvent("chat:addMessage", src, {
            args = { "^2NexusCore", "Teleported to coordinates: " .. x .. ", " .. y .. ", " .. z }
        })
    else
        TriggerClientEvent("chat:addMessage", src, {
            args = { "^1NexusCore", "You do not have permission to teleport." }
        })
    end
end)
