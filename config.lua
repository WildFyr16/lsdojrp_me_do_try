Config = {}

Config.TextColor_Me         = { r = 255, g = 255, b = 255, a = 255 } -- Adjust the text color (3D and the Chat too)
Config.TextColor_Do         = { r = 255, g = 255, b = 255, a = 255 }
Config.TextColor_Try        = { r = 255, g = 255, b = 255, a = 255 }

Config.Background           = true -- Enable/Disable the background of the 3D text?

Config.BackgroundColor_Me   = { r = 172, g = 79, b = 198, a = 150 } -- Bright Purple -- Adjust the background color (3D and the Chat too)
Config.BackgroundColor_Do   = { r = 157, g = 34, b = 53, a = 150 } -- Crimson
Config.BackgroundColor_Try  = { r = 66, g = 158, b = 157, a = 150 } -- Mint Blue

Config.DisplayOnChat        = true -- Display actions in chat?

Config.EnablePlayerName     = false -- Enable player ingame name in the text? Requires ESX to grab player name.
Config.EnablePlayerUserName = true -- Enable player username in the text? Does not require ESX, thanks to WildFyr

Config.Log                  = true -- Enable/Disable logging?
Config.Logwebhook           = "YOUR_WEBHOOK_LINK" -- If logging enabled then replace 'Your Webhook' with your Discord Channel Webhook

Config.checkForUpdates      = true -- Check for updates
Config.Version              = '1.6.1'

---------- Advanced options ----------

Config.Duration             = 5 -- Text duration (in seconds)
Config.Distance             = 10 -- Who can see my action inside the distance (in meter)
Config.TryChance            = 50 -- Chance of the try action (in %)
Config.DropShadow           = false -- Drop shadow (3D text)
Config.Font                 = 4 -- Font type in number (3D text)
