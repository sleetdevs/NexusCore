local mainMenu = RageUI.CreateMenu("NexusCore", "Admin Menu")
local pedMenu = RageUI.CreateSubMenu(mainMenu, "Ped Selector", "Choose a ped")
local vehicleListMenu = RageUI.CreateSubMenu(mainMenu, "Saved Vehicles", "Choose a vehicle")
local open = false

-- Saved Peds / Vehicles
local savedPeds = {
    "a_m_m_business_01", "a_f_m_beach_01", "s_m_y_cop_01", "s_m_m_fiboffice_01"
}

local savedVehicles = {
    "sultan", "adder", "police", "buffalo", "t20"
}

function ToggleMenu()
    open = not open
    RageUI.Visible(mainMenu, open)
    CreateThread(function()
        while open do
            RageUI.IsVisible(mainMenu, function()

                RageUI.Button("Spawn Vehicle (Type Name)", nil, {}, true, {
                    onSelected = function()
                        local model = KeyboardInput("Enter vehicle model", "", 15)
                        if model then
                            SpawnVehicle(model)
                        end
                    end
                })

                RageUI.Button("Spawn Saved Vehicle", nil, {}, true, {
                    onSelected = function() end
                }, vehicleListMenu)

                RageUI.Button("Ped Selector", nil, {}, true, {
                    onSelected = function() end
                }, pedMenu)

                RageUI.Button("Online Players", nil, {}, true, {
                    onSelected = function()
                        local players = GetActivePlayers()
                        for _, id in ipairs(players) do
                            local name = GetPlayerName(id)
                            print("Player:", name, "ID:", id)
                        end
                    end
                })
            end)

            -- Ped Selector
            RageUI.IsVisible(pedMenu, function()
                for _, ped in ipairs(savedPeds) do
                    RageUI.Button(ped, nil, {}, true, {
                        onSelected = function()
                            RequestModel(ped)
                            while not HasModelLoaded(ped) do Wait(0) end
                            SetPlayerModel(PlayerId(), ped)
                            SetModelAsNoLongerNeeded(ped)
                        end
                    })
                end
            end)

            -- Saved Vehicles
            RageUI.IsVisible(vehicleListMenu, function()
                for _, vehicle in ipairs(savedVehicles) do
                    RageUI.Button(vehicle, nil, {}, true, {
                        onSelected = function()
                            SpawnVehicle(vehicle)
                        end
                    })
                end
            end)

            Wait(0)
        end
    end)
end

RegisterNetEvent("NexusCore:OpenMenu", ToggleMenu)

-- Utility Functions
function KeyboardInput(textEntry, exampleText, maxStringLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", exampleText, "", "", "", maxStringLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        return GetOnscreenKeyboardResult()
    end
    return nil
end

function SpawnVehicle(model)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z + 1, GetEntityHeading(ped), true, false)
    TaskWarpPedIntoVehicle(ped, vehicle, -1)
    SetModelAsNoLongerNeeded(model)
end
