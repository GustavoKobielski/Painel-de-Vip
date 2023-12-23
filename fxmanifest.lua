fx_version "bodacious"
game 'gta5'

author 'LK Store - Lakxiwn#6388'
description 'Painel de Vip'
version '1.0.0'

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server.lua"
}

files {
	"nui/index.html",
	"nui/script.js",
	"nui/style.css",
	"nui/images/*"
}