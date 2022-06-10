fx_version 'cerulean'

game 'gta5'
lua54 'yes'
author '#A & K DEV'
description 'Blips Creator V1'

--Client Scripts-- 
client_scripts {
    'Client/*.lua'
}

--Server Scripts-- 
server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'Server/*.lua'
}

shared_scripts {
    'Shared.lua'
}
--UI Part-- 
ui_page {
    'html/index.html', 
}

--File Part-- 
files {
    'html/index.html',
    'html/app.js', 
    'html/style.css'
} 
