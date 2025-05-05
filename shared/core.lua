NexusCore = {}

function Core.PrintDebug(msg)
    print("^5[NexusCore]^0 " .. msg)
end

exports('GetCoreObject', function()
    return NexusCore
end)
