-- Command to request the NexusCore menu from server
RegisterCommand("nexusmenu", function()
    TriggerServerEvent("NexusCore:RequestMenu")
end, false)

-- Keybind for the menu
RegisterKeyMapping("nexusmenu", "Open NexusCore Menu", "keyboard", "F1")

-- Command to teleport to specific coordinates
RegisterCommand("teleport", function(source, args, rawCommand)
    local x, y, z = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
    if x and y and z then
        TriggerServerEvent("NexusCore:TeleportToCoords", x, y, z)
    else
        TriggerEvent("chat:addMessage", { args = { "^1NexusCore", "Invalid coordinates." } })
    end
end, false)

-- Keybind for teleporting (F2 for quick teleport)
RegisterKeyMapping("teleport", "Teleport to coordinates", "keyboard", "F2")

-- Menu trigger (will only work if server approves)
RegisterNetEvent("NexusCore:OpenMenu", function()
    ToggleMenu()
end)

-- Teleport menu (example)
RegisterCommand("teleportmenu", function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    -- Open teleport menu
    TriggerEvent('chat:addMessage', {
        args = { "^2Teleport Menu", "Teleport to these coordinates: X: " .. coords.x .. " Y: " .. coords.y .. " Z: " .. coords.z }
    })
end, false)
