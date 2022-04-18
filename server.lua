ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('propcheck')
AddEventHandler('propcheck', function()
    DropPlayer(source, 'Masz usunięte propy | Naprawiaj to szybko i wbijaj')
end)

RegisterNetEvent('Mlody.dobrawek:discord-Logs')
AddEventHandler('Mlody.dobrawek:discord-Logs', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nam = xPlayer.getName()
    local dis = xPlayer.getIdentifier()
    sendDiscord('**[Gracz]:** ' ..nam.. '\n**[Steam]:** ' ..dis..'')
end)
function sendDiscord(message)
    local content = {
        {
            ["color"] = '16449791',
            ["title"] = "Gracz chciał rozwalic wszystkich na bitkach bez propów ale mu nie wsyzło",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Mlody.Dobrawek#2115 - Krzaki logs", 
            },
        }
    }
    PerformHttpRequest("wklejasz tu swój webhook", function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end
