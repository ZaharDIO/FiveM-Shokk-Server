
fx_version 'cerulean'

author 'rex_1'
version '1.0.0'
game 'gta5'

client_scripts {
    'shared/*.lua',
    'client/*.lua',

}

shared_scripts {
	'shared/*.lua',

}

server_scripts {
    --'@mysql-async/lib/MySQL.lua',
    '@oxmysql/lib/MySQL.lua',
    'shared/*.lua',
    'server/*.lua',

}
ui_page 'html/index.html'


files {
    "html/**.*",
}

lua54 'yes'