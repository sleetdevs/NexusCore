RegisterCommand("tpto", function(source, args)
    local targetId = tonumber(args[1])
    if not targetId or not GetPlayerPed(targetId) then
        TriggerClientEvent("chat:addMessage", source, {
            args = {"^1System", "Invalid player ID."}
        })
        return
    end

    local targetPed = GetPlayerPed(targetId)
    local coords = GetEntityCoords(targetPed)

    TriggerClientEvent("NexusCore:TeleportToCoords", source, coords)
end, true)

RegisterCommand("bring", function(source, args)
    local targetId = tonumber(args[1])
    if not targetId or not GetPlayerPed(targetId) then
        TriggerClientEvent("chat:addMessage", source, {
            args = {"^1System", "Invalid player ID."}
        })
        return
    end

    local srcPed = GetPlayerPed(source)
    local coords = GetEntityCoords(srcPed)

    TriggerClientEvent("NexusCore:TeleportToCoords", targetId, coords)
end, true)

RegisterCommand("goto", function(source, args)
    local targetId = tonumber(args[1])
    if not targetId or not GetPlayerPed(targetId) then
        TriggerClientEvent("chat:addMessage", source, {
            args = {"^1System", "Invalid player ID."}
        })
        return
    end

    local targetPed = GetPlayerPed(targetId)
    local coords = GetEntityCoords(targetPed)

    TriggerClientEvent("NexusCore:TeleportToCoords", source, coords)
end, true)

RegisterCommand("coords", function(source, args)
    local playerPed = GetPlayerPed(source)
    local coords = GetEntityCoords(playerPed)

    TriggerClientEvent("chat:addMessage", source, {
        args = {"^1System", "Your current coordinates: " .. coords.x .. ", " .. coords.y .. ", " .. coords.z}
    })
end, true)