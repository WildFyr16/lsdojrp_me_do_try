fx_version 'cerulean'
game 'gta5'

name 'LSDOJRP /ME, DO & TRY'
description '/me, /do & /try commands'
author 'hoaaiww & WildFyr'
version '1.6.1'

client_scripts {
    'config.lua',
    'client/client.lua'
}

server_scripts {
    'config.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

-- dependency 'es_extended' -- https://github.com/esx-framework/esx-legacy.git -- Uncomment out if you want to use ESX Framework for player names. (See config)
