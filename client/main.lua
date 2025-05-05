RegisterNetEvent("NexusCore:TeleportToCoords", function(coords)
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
end)
