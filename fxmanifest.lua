fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'xThrasherrr : xt-cooking'

version '1.0.0'

client_script {
	'client/*.lua'
}

server_script {
	'server/server.lua'
}

shared_script 'config.lua'
lua54 'yes'