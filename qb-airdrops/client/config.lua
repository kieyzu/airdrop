local airdropContents = {
    { item = 'weapon_pistol', count = 1 },
    { item = 'weapon_shotgun', count = 1 },
    -- Add more items as needed
}

RegisterCommand("editairdrop", function(source, args, rawCommand)
    local isAdmin = -- Code to check if the player is an admin (use your admin system logic)
    if isAdmin then
        -- Code to parse and validate new airdrop contents from args
        -- Update the airdropContents table accordingly
        airdropContents = {} -- Clear existing contents
        -- Logic to parse and validate new airdrop contents and update airdropContents table goes here

        TriggerClientEvent("qb-core:client:notify", source, "Airdrop contents updated.", "success") -- Notify the player
    else
        TriggerClientEvent("qb-core:client:notify", source, "You do not have permission to use this command.", "error") -- Notify the player of permission error
    end
end, false)
