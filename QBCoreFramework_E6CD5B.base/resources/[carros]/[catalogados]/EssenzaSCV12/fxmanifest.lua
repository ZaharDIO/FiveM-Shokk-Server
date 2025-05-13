fx_version 'cerulean'
game 'gta5'

files {

    'data/**/handling.meta',
    'data/**/vehiclelayouts.meta',
    'data/**/vehicles.meta',
    'data/**/carvariations.meta',
    'data/**/carcols.meta',
}

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'

files {
	"audioconfig/*.dat151.rel",
	"audioconfig/*.dat54.rel",
	"audioconfig/*.dat10.rel",
	"sfx/**/*.awc"
}

data_file "AUDIO_SYNTHDATA" "audioconfig/ta023l539_amp.dat"
data_file "AUDIO_GAMEDATA" "audioconfig/ta023l539_game.dat"
data_file "AUDIO_SOUNDDATA" "audioconfig/ta023l539_sounds.dat"
data_file "AUDIO_WAVEPACK" "sfx/dlc_ta023l539"