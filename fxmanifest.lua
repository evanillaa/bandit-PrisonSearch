
fx_version "adamant"
game "gta5"

author 'Bandit#3068 / GRIZY#5968'
description 'Récolte de point'
version '1.0.0'

shared_script '@es_extended/imports.lua'

client_scripts {
    'client/bandit-client.lua',
    'config.lua'
}
server_scripts {
    'server/bandit-server.lua',
    'config.lua'
}
