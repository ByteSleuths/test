local webhookUrl = "https://discord.com/api/webhooks/1300169758586699826/nEdn9xWepoAyski9Rnh4eqr0mM8mAPxItz6T6NArZGv_82cO-NogCFt-E9NWHpGn3uG5"

local function sendWebhookMessage()
    local computerName = os.getenv("COMPUTERNAME") or "Inconnu"
    local userName = os.getenv("USERNAME") or "Inconnu"
    
    local message = {
        content = "🚀 Nouveau lancement du script détecté !\n" ..
                  "💻 Ordinateur: " .. computerName .. "\n" ..
                  "👤 Utilisateur: " .. userName .. "\n" ..
                  "⏰ Date: " .. os.date("%Y-%m-%d %H:%M:%S")
    }
    
    local headers = {
        ["Content-Type"] = "application/json"
    }
    
    local body = game:GetService("HttpService"):JSONEncode(message)
    
    local success, response = pcall(function()
        game:GetService("HttpService"):PostAsync(webhookUrl, body, Enum.HttpContentType.ApplicationJson, false, headers)
    end)
    
    if not success then
        warn("Erreur lors de l'envoi du webhook:", response)
    end
end

sendWebhookMessage()
