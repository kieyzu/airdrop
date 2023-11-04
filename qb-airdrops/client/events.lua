RegisterNetEvent('qb-airdrops:markAirdrop')
AddEventHandler('qb-airdrops:markAirdrop', function(x, y, z)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 1) -- Use the appropriate blip sprite ID for the airdrop
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3) -- You can change the color based on your preference
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Airdrop")
    EndTextCommandSetBlipName(blip)
end)
