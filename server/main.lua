local Core = exports['NexusCore']:GetCoreObject()

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Core.PrintDebug("NexusCore has started.")
    end
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    deferrals.defer()
    Wait(0)
    deferrals.update("Checking player...")
    Wait(0)
    deferrals.done()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Core.PrintDebug("NexusCore has stopped.")
    end
end)