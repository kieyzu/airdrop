RegisterCommand("admin", function(source, args, rawCommand)
    local isAdmin = -- Code to check if the player is an admin (use your admin system logic)
    if isAdmin then
        -- Code to execute when the admin command is used
        -- For example: TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "Admin command executed.")
    else
        TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "You do not have permission to use this command.")
    end
end, false)
