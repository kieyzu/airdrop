local airdropInterval = 30 * 1000 -- 30 seconds in milliseconds
local airdropModel = "prop_mil_crate_01"

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(airdropInterval) -- Wait for the specified interval (30 seconds)

        -- Code to spawn the airdrop goes here
        local coords = GenerateRandomAirdropLocation() -- Generate random airdrop location
        TriggerEvent('qb-airdrops:spawnAirdrop', coords.x, coords.y, coords.z) -- Custom event to spawn the airdrop at random location
    end
end)

RegisterNetEvent('qb-airdrops:spawnAirdrop')
AddEventHandler('qb-airdrops:spawnAirdrop', function(x, y, z)
    local modelHash = GetHashKey(airdropModel)
    RequestModel(modelHash)

    while not HasModelLoaded(modelHash) do
        Wait(500)
    end

    local airdropObject = CreateObject(modelHash, x, y, z + 500.0, true, true, true) -- Spawn the airdrop above the ground
    SetEntityAsMissionEntity(airdropObject, true, true)
    SetEntityVisible(airdropObject, false) -- Make the object invisible initially

    local flareParticle = StartParticleFxLoopedOnEntity("ent_amb_sparking_wires", airdropObject, 0.0, 0.0, 5.0, 0.0, 0.0, 0.0, 1.0, false, false, false)

    Citizen.Wait(5000) -- Wait for 5 seconds

    -- Code to simulate airdrop landing animation goes here
    SetEntityVisible(airdropObject, true) -- Make the object visible after landing
    StopParticleFxLooped(flareParticle, 0) -- Stop the flare particle effect
end)

function GenerateRandomAirdropLocation()
    -- Generate random coordinates within the GTA map boundaries (excluding waters)
    local x, y, z = 0.0, 0.0, 0.0
    repeat
        x, y, z = math.random(-2000.0, 2000.0), math.random(-2000.0, 2000.0), 0.0
        SetEntityCoordsNoOffset(PlayerPedId(), x, y, z, true, true, true)
    until not IsPointInWater(vector3(x, y, z)) and not IsPedInAnyVehicle(PlayerPedId(), true)
    return vector3(x, y, z)
end
