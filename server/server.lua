local success = nil -- Don't touch!

if Config.EnablePlayerName then
    ESX = nil

    TriggerEvent('esx:getSharedObject', function(obj) 
        ESX = obj 
    end)
end

RegisterCommand("me", function(source, args, rawCommand)
    if source ~= 0 then
        local text = "There was an error processing the text!"
        if args[1] then
            text = rawCommand:sub(3)
            if Config.EnablePlayerName then
                local xPlayer = ESX.GetPlayerFromId(source)
                local playerName = xPlayer.getName()
                TriggerClientEvent('arp_medotry:showText', -1, playerName..": "..text, source, "me", success)
            elseif Config.EnablePlayerUserName then
                local lsdojplayerName = GetPlayerName(source)
                TriggerClientEvent('arp_medotry:showText', -1, lsdojplayerName..": "..text, source, "me", success)
            else
                TriggerClientEvent('arp_medotry:showText', -1, text, source, "try", success)
            end
            if Config.Log then
                logMe(("**%s** executed a */me* command.\n\n`Content:` %s"):format(GetPlayerName(source), text))
            end
        else
            TriggerClientEvent('esx:showNotification', source, 'You did ~r~not~s~ give any action')
        end
    end
end)

RegisterCommand("do", function(source, args, rawCommand)
    if source ~= 0 then
        local text = "There was an error processing the text!"
        if args[1] then
            text = rawCommand:sub(3)
            if Config.EnablePlayerName then
                local xPlayer = ESX.GetPlayerFromId(source)
                local playerName = xPlayer.getName()
                TriggerClientEvent('arp_medotry:showText', -1, playerName..": "..text, source, "do", success)
            elseif Config.EnablePlayerUserName then
                local lsdojplayerName = GetPlayerName(source)
                TriggerClientEvent('arp_medotry:showText', -1, lsdojplayerName..": "..text, source, "do", success)
            else
                TriggerClientEvent('arp_medotry:showText', -1, text, source, "try", success)
            end
            if Config.Log then
                logDo(("**%s** executed a */do* command.\n\n`Content:` %s"):format(GetPlayerName(source), text))
            end
        else
            TriggerClientEvent('esx:showNotification', source, 'You did ~r~not~s~ give any action')
        end
    end
end)

RegisterCommand("try", function(source, args, rawCommand)
    if source ~= 0 then
        local text = "There was an error processing the text!"
        if args[1] then
            success = false
            if math.random(0, 100) <= Config.TryChance then
                success = true
            end
            text = rawCommand:sub(4)
            if Config.EnablePlayerName then
                local xPlayer = ESX.GetPlayerFromId(source)
                local playerName = xPlayer.getName()
                TriggerClientEvent('arp_medotry:showText', -1, playerName..": "..text, source, "try", success)
            elseif Config.EnablePlayerUserName then
                local lsdojplayerName = GetPlayerName(source)
                TriggerClientEvent('arp_medotry:showText', -1, lsdojplayerName..": "..text, source, "try", success)
            else
                TriggerClientEvent('arp_medotry:showText', -1, text, source, "try", success)
            end
            if Config.Log then
                logTry(("**%s** executed a */try* command.\n\n`Content:` %s\n`Result:`" ..(success and " Successful" or " Unsuccessful")):format(GetPlayerName(source), text))
            end
            success = nil
        else
            TriggerClientEvent('esx:showNotification', source, 'You did ~r~not~s~ give any action')
        end
    end
end)

function logMe(msg)
    if Config.Logwebhook ~= "" then
        local connect = {
            {
                ["color"] = 4168183,
                ["title"] = "**/Me**",
                ["description"] = msg:gsub("%^%d",""),
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                ["footer"] = {
                    ["text"] = "LSDOJRP: /Me, Do & Try",
                },
            }
        }
        PerformHttpRequest(Config.Logwebhook, function(err, text, headers) end, 'POST', json.encode({embeds = connect}), { ['Content-Type'] = 'application/json' })
    end
end

function logDo(msg)
    if Config.Logwebhook ~= "" then
        local connect = {
            {
                ["color"] = 13247822,
                ["title"] = "**/Do**",
                ["description"] = msg:gsub("%^%d",""),
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                ["footer"] = {
                    ["text"] = "LSDOJRP: /Me, Do & Try",
                },
            }
        }
        PerformHttpRequest(Config.Logwebhook, function(err, text, headers) end, 'POST', json.encode({embeds = connect}), { ['Content-Type'] = 'application/json' })
    end
end

function logTry(msg)
    if Config.Logwebhook ~= "" then
        local connect = {
            {
                ["color"] = 1486276,
                ["title"] = "**/Try**",
                ["description"] = msg:gsub("%^%d",""),
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                ["footer"] = {
                    ["text"] = "LSDOJRP: /Me, Do & Try",
                },
            }
        }
        PerformHttpRequest(Config.Logwebhook, function(err, text, headers) end, 'POST', json.encode({embeds = connect}), { ['Content-Type'] = 'application/json' })
    end
end

if Config.checkForUpdates then
	local version = Config.Version
	local resourceName = GetCurrentResourceName()
	
	Citizen.CreateThread(function()
		function checkVersion(err, response, headers)
			if err == 200 then
				local data = json.decode(response)
				if version ~= data.medotryVersion and tonumber(version) < tonumber(data.medotryVersion) then
					print("The [^2"..resourceName.."^7] script is ^1outdated^7.\nLatest version: ^3"..data.medotryVersion.."\n^7Installed version: ^1"..version.."\n^2Update ^7the script here: ^5https://github.com/hoaaiww/arp_me_do_try ^7")
				elseif tonumber(version) > tonumber(data.medotryVersion) then
					print("The [^2"..resourceName.."^7] script is on ^1higher^7 version then the current up to date version! Please check to update: ^5https://github.com/hoaaiww/arp_me_do_try ^7")
				else
					print("The [^2"..resourceName.."^7] script is ^2up to date^7! Version: ^2" .. version .."^7")
				end
			else
				print("^1Version Check failed!^7 HTTP Error Code: "..err)
			end
			
			SetTimeout(7200000, checkVersionHTTPRequest)
		end
		function checkVersionHTTPRequest()
			PerformHttpRequest("https://raw.githubusercontent.com/hoaaiww/version/main/versions.json", checkVersion, "GET")
		end
		checkVersionHTTPRequest()
	end)
end
