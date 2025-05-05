local Core = {}

function Core.PrintDebug(message)
    print("[NexusCore]: " .. message)
end

-- Export Core object
exports("GetCoreObject", function()
    return Core
end)

return Core
