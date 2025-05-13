resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

files {

'handling.meta',
'vehicles.meta',
'carvariations.meta',
'carcols.meta',
'audioconfig/aq07powerstroke67_game.dat151.rel',
'audioconfig/aq07powerstroke67_sounds.dat54.rel',
'sfx/dlc_aq07powerstroke67/aq07powerstroke67.awc',
'sfx/dlc_aq07powerstroke67/aq07powerstroke67_npc.awc',
	
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'AUDIO_GAMEDATA' 'audioconfig/aq07powerstroke67_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/aq07powerstroke67_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_aq07powerstroke67'

-- specfiy the names of the items being added within this (same as in the lang file in a dlc pack(kinda, the formatting is different))
client_script 'names.lua'