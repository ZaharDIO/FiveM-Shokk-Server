fx_version "cerulean"
game "gta5"

files {
    "data/vehiclelayouts.meta",
    "data/vehicles.meta",
    "data/carvariations.meta",
    "data/carcols.meta",
    "data/handling.meta",
    "data/dlctext.meta",
}

data_file "VEHICLE_LAYOUTS_FILE"   "data/vehiclelayouts.meta"
data_file "HANDLING_FILE"          "data/handling.meta"
data_file "VEHICLE_METADATA_FILE"  "data/vehicles.meta"
data_file "VEHICLE_VARIATION_FILE" "data/carcols.meta"
data_file "VEHICLE_VARIATION_FILE" "data/carvariations.meta"
data_file "DLC_TEXT_FILE"          "data/dlctext.meta"

client_script "vehicle_names.lua" -- you need this for vMenu