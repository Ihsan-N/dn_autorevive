local isDead = false
-- Define the timer duration in milliseconds (e.g., 4 minutes = 240000 milliseconds)
local timerDuration = 60000 -- change this value as needed ,60000 for 1minute for testing 

AddEventHandler('playerSpawned', function()
    isDead = false
end)

AddEventHandler('esx:onPlayerDeath', function() 
    local remainingTime = timerDuration / 60000 -- Convert milliseconds to seconds
    exports["dn_notify"]:notify('Notification', 'You will auto revive in ' .. remainingTime .. ' minute! .', 'info', 10000)
    isDead = true
    reviveTimer()
end)

function reviveTimer()
    Citizen.SetTimeout(timerDuration, function()
        if isDead then
            TriggerEvent('esx_ambulancejob:revive')
            isDead = false
            exports["dn_notify"]:notify('Notification', 'You have been revived!', 'success', 5000)
        else
        --exports["dn_notify"]:notify('Notification', 'You are fine', 'info', 10000) 
            print(isDead) --for debugging
       end
    end)
end