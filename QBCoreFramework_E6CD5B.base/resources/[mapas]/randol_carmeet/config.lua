return {
    EnableTeleport = true, -- Set to false if you don't want the teleport into the ipl.
    Teleports = {
        {label = '**E** - Enter', zone = vec4(780.01, -1867.64, 29.29, 90.3), set = vec4(-2203.87, 1146.48, -23.26, 177.79)},
        {label = '**E** - Leave', zone = vec4(-2220.27, 1158.77, -23.26, 3.76), set = vec4(779.89, -1875.91, 29.27, 264.22)},
    },
    CenterZone = vec3(-2171.14, 1104.69, -24.36),
    Prize = {
        slamtruck = {model = `slamtruck`, coords = vec4(-2160.87, 1136.63, -24.37, 315.29)},
        zr350 = {model = `zr350`, coords = vec4(-2160.87, 1136.63, -24.37, 315.29)},
    },
    Mimi = {
        models = {`IG_Mimi`, `prop_npc_phone`},
        coords = vec4(-2178.1646, 1107.623, -24.6636, 96.4826),
        rot = vec3(0.0, 0.0, 116.4826)
    },
    RaceOrg = {
        model = `s_m_m_raceorg_01`,
        coords = vec4(-2207.873, 1132.7607, -23.6449, 74.7026),
        rot = vec3(0.0, 0.0, 74.7026)
    },
    Vehicles = {
        {
            model = `minivan2`, coords = vec4(-2178.1646, 1107.623, -25.3636, 116.4826),
            colors = {145, 1}, extraColors = {70, 145}, livery = 8, intColor = 1,
            modKits = { [4] = 1, [6] = 1, [10] = 2, [22] = 1, [23] = 67, [24] = 4, [27] = 4, [30] = 1, [31] = 2, [32] = 1, [33] = 2, [34] = 12, [35] = 22, [37] = 3, [38] = 3, [39] = 4, [40] = 1, [48] = 3, },
            door = 5,
        },
        {
            model = `zr350`, coords = vec4(-2207.873, 1132.7607, -23.934, 74.7026),
            colors = {73, 0}, extraColors = {73, 0}, livery = 12, intColor = 1,
            modKits = { [0] = 10, [1] = 5, [2] = 2, [3] = 1, [4] = 2, [5] = 1, [6] = 5, [7] = 9, [9] = 3, [10] = 1, [23] = 54, [26] = 4, [29] = 3, [30] = 3, [31] = 8, [32] = 5, [33] = 3, [40] = 7, [41] = 11, [43] = 4, [47] = 1, [48] = 11, },
            door = 5,
        },
        {
            model = `asbo`, coords = vec4(-2207.98, 1086.283, -23.821, 89.2257),
            colors = {30, 89}, extraColors = {36, 89}, livery = 3, intColor = 1,
            modKits = {[0] = 7, [1] = 4, [3] = 4, [4] = 4, [5] = 3, [7] = 6, [8] = 1, [9] = 3, [10] = 3, [15] = 4, [23] = 4, [48] = 3,},
            door = 4,
        },
        {
            model = `sultan2`, coords = vec4(-2207.7542, 1089.482, -23.6248, 269.1232),
            colors = {159, 0}, extraColors = {160, 37}, livery = 2, intColor = 1,
            modKits = {[0] = 10, [1] = 3, [2] = 2, [3] = 3, [4] = 7, [5] = 5, [6] = 2, [7] = 12, [8] = 2, [9] = 5, [10] = 2, [15] = 4, [23] = 19, [48] = 2,},
            door = 4,
        },
        {
            model = `banshee2`, coords = vec4(-2207.281, 1115.8967, -23.997, 90.0392),
            colors = {64, 112}, extraColors = {70, 156}, livery = 2, intColor = 1,
            neons = {2, 21, 255},
            modKits = {[0] = 1, [1] = 4, [3] = 4, [4] = 4, [6] = 2, [7] = 8, [8] = 1, [15] = 3, [22] = 1, [23] = 36, [29] = 2, [31] = 3, [32] = 12, [33] = 6, [48] = 2,},
            door = 4,
        },
        {
            model = `sultanrs`, coords = vec4(-2199.385, 1117.9756, -23.7819, 116.4836),
            colors = {138, 138}, extraColors = {88, 88}, livery = 3, intColor = 1,
            modKits = {[0] = 10, [1] = 12, [2] = 5, [3] = 3, [4] = 5, [5] = 4, [6] = 4, [7] = 10, [8] = 2, [10] = 5, [15] = 4, [23] = 17, [27] = 1, [29] = 4, [30] = 5, [31] = 7, [32] = 6, [33] = 16, [48] = 3,},
            door = 4,
        },
        {
            model = `jester3`, coords = vec4(-2186.736, 1105.177, -23.608, 150.1042),
            colors = {38, 12}, extraColors = {0, 156}, livery = 10, intColor = 1,
            neons = {255, 262, 0},
            modKits = {[0] = 8, [1] = 11, [2] = 2, [3] = 2, [4] = 4, [5] = 3, [6] = 2, [7] = 5, [8] = 1, [15] = 5, [22] = 1, [23] = 26, [48] = 10,},
            door = 4,
        },
        {
            model = `buccaneer2`, coords = vec4(-2186.757, 1090.0436, -23.9985, 270.5697),
            colors = {147, 10}, extraColors = {4, 156}, livery = 7, intColor = 1,
            modKits = {[4] = 1, [6] = 1, [7] = 1, [23] = 16, [24] = 4, [25] = 3, [27] = 1, [28] = 9, [30] = 4, [33] = 3, [34] = 1, [36] = 2, [37] = 3, [38] = 4, [39] = 3, [40] = 1, [45] = 2, [48] = 7,},
            door = 4,
        },
        {
            model = `peyote2`, coords = vec4(-2186.8542, 1093.0175, -23.7006, 92.3375),
            colors = {73, 0}, extraColors = {73, 156}, livery = 1, intColor = 1,
            modKits = {[4] = 11, [5] = 5, [6] = 5, [7] = 3, [14] = 1, [15] = 4, [23] = 31, [48] = 1,},
            door = 4,
        },
        {
            model = `cheburek`, coords = vec4(-2165.5908, 1096.1431, -25.0151, 90.9944),
            colors = {42, 42}, extraColors = {0, 122}, livery = 4, intColor = 1,
            modKits = {[0] = 2, [1] = 5, [2] = 4, [6] = 2, [7] = 3, [10] = 2, [22] = 1, [23] = 28, [48] = 4,},
            door = 4,
        },
        {
            model = `cheetah2`, coords = vec4(-2165.7937, 1089.5665, -25.0063, 92.741),
            colors = {92, 12}, extraColors = {92, 0}, livery = 0, intColor = 1,
            modKits = {[0] = 1, [1] = 2, [2] = 1, [3] = 2, [4] = 3, [7] = 3, [8] = 2, [9] = 3, [15] = 3, [22] = 1, [23] = 21,},
            door = 4,
        },
        {
            model = `club`, coords = vec4(-2187.2397, 1116.9534, -23.9684, 264.4242),
            colors = {70, 120}, extraColors = {70, 156}, livery = 0, intColor = 1,
            neons = {3, 83, 255},
            modKits = {[0] = 10, [1] = 5, [2] = 5, [3] = 2, [4] = 7, [5] = 5, [6] = 5, [7] = 7, [8] = 2, [9] = 4, [10] = 1, [15] = 4, [23] = 33,},
            door = 5,
        },
        {
            model = `comet5`, coords = vec4(-2199.1458, 1089.305, -23.9967, 267.0066),
            colors = {38, 1}, extraColors = {0, 41}, livery = 0, intColor = 1,
            modKits = {[0] = 3, [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 2, [10] = 1, [15] = 3, [23] = 1,},
            door = 5,
        },
        {
            model = `coquette4`, coords = vec4(-2207.5715, 1112.841, -23.6101, 85.856),
            colors = {49, 12}, extraColors = {52, 11}, livery = 0, intColor = 1,
            modKits = {[0] = 6, [1] = 4, [2] = 3, [3] = 3, [4] = 4, [5] = 2, [6] = 1, [15] = 4, [22] = 1, [23] = 21,},
            door = 4,
        },
        {
            model = `deviant`, coords = vec4(-2207.494, 1124.0216, -23.9006, 49.9012),
            colors = {33, 33}, extraColors = {47, 2}, livery = 0, intColor = 1,
            modKits = {[0] = 1, [1] = 7, [4] = 1, [6] = 7, [7] = 2, [10] = 1, [15] = 4, [23] = 1,},
            door = 4,
        },
        {
            model = `dominator3`, coords = vec4(-2207.4924, 1128.5042, -23.8219, 132.7019),
            colors = {53, 12}, extraColors = {89, 156}, livery = 0, intColor = 1,
            neons = {94, 255, 1},
            modKits = {[0] = 11, [1] = 3, [2] = 3, [3] = 3, [4] = 5, [6] = 5, [7] = 5, [8] = 1, [10] = 2, [15] = 2, [23] = 15,},
            door = 4,
        },
        {
            model = `elegy`, coords = vec4(-2157.5881, 1085.9642, -24.7143, 270.5836),
            colors = {0, 61}, extraColors = {67, 158}, livery = 0, intColor = 1,
            neons = {255, 255, 255},
            modKits = {[0] = 8, [4] = 7, [5] = 1, [6] = 2, [7] = 3, [10] = 1, [15] = 4, [22] = 1, [23] = 15, [25] = 2, [26] = 3, [27] = 1, [29] = 1, [30] = 3, [32] = 3, [33] = 5, [39] = 3, [40] = 8, [41] = 12, [43] = 4, [45] = 5, [46] = 2,},
            door = 4,
        },
        {
            model = `ellie`, coords = vec4(-2178.5085, 1138.2255, -24.722, 245.249),
            colors = {74, 111}, extraColors = {74, 0}, livery = 7, intColor = 1,
            neons = {255, 255, 255},
            modKits = {[10] = 2, [15] = 3, [22] = 1, [23] = 1, [48] = 7,},
            door = 4,
        },
        {
            model = `hustler`, coords = vec4(-2178.3352, 1134.1493, -24.739, 74.8831),
            colors = {143, 143}, extraColors = {31, 33}, livery = 1, intColor = 1,
            neons = {255, 0, 0},
            modKits = {[1] = 1, [2] = 1, [6] = 6, [10] = 1, [15] = 4, [22] = 1, [23] = 9, [48] = 1,},
            door = 4,
        },
        {
            model = `faction3`, coords = vec4(-2199.7878, 1126.0371, -23.9109, 92.9992),
            colors = {111, 135}, extraColors = {88, 1}, livery = 0, intColor = 1,
            neons = {222, 222, 255},
            modKits = {[4] = 1, [7] = 1, [22] = 1, [24] = 4, [27] = 5, [33] = 5, [34] = 1, [35] = 19, [36] = 2, [37] = 1, [39] = 3, [40] = 5,},
            door = 4,
        },
        {
            model = `kanjo`, coords = vec4(-2196.2087, 1139.156, -23.827, 278.2801),
            colors = {13, 13}, extraColors = {0 ,122}, livery = 5, intColor = 1,
            neons = {255, 0, 0},
            modKits = {[0] = 7, [1] = 5, [2] = 9, [3] = 4, [4] = 9, [5] = 6, [6] = 5, [7] = 1, [8] = 6, [9] = 1, [22] = 1, [23] = 16, [46] = 1, [48] = 5,},
            door = 4,
        },
        {
            model = `komoda`, coords = vec4(-2187.087, 1082.9451, -23.7004, 81.7416),
            colors = {112, 38}, extraColors = {30, 0}, livery = 2, intColor = 1,
            modKits = {[0] = 4, [1] = 7, [2] = 3, [3] = 4, [4] = 1, [7] = 3, [8] = 1, [9] = 1, [10] = 3, [48] = 2,},
            door = 4,
        },
        {
            model = `gauntlet5`, coords = vec4(-2199.93, 1073.3486, -23.8247, 250.0139),
            colors = {68, 42}, extraColors = {68, 122}, livery = 2, intColor = 1,
            modKits = {[0] = 9, [3] = 2, [4] = 8, [5] = 1, [6] = 6, [7] = 7, [10] = 3, [15] = 4, [23] = 33, [27] = 3, [28] = 6, [29] = 4, [30] = 4, [32] = 4, [33] = 12, [35] = 5, [39] = 5, [42] = 6, [43] = 1, [44] = 3, [45] = 3, [48] = 2,},
            door = 4,
        },
        {
            model = `gb200`, coords = vec4(-2186.9036, 1120.1157, -23.9684, 91.5535),
            colors = {53, 52}, extraColors = {59, 158}, livery = 4, intColor = 1,
            neons = {10, 107, 5},
            modKits = {[0] = 2, [1] = 3, [2] = 2, [3] = 1, [4] = 1, [5] = 4, [6] = 1, [7] = 7, [8] = 1, [10] = 1, [15] = 5, [48] = 4,},
            door = 4,
        },
        {
            model = `elegy2`, coords = vec4(-2186.9236, 1126.9691, -23.6264, 92.3546),
            colors = {5, 38}, extraColors = {111, 41}, livery = 0, intColor = 1,
            modKits = {[0] = 3, [1] = 2, [3] = 1, [4] = 2, [6] = 2, [7] = 1, [10] = 1, [15] = 1, [23] = 2},
            door = 4,
        },
        {
            model = `issi7`, coords = vec4(-2157.666, 1088.977, -25.0154, 269.282),
            colors = {0, 38}, extraColors = {10, 156}, livery = 5, intColor = 1,
            modKits = {[1] = 1, [2] = 2, [3] = 3, [4] = 2, [7] = 4, [8] = 3, [15] = 4, [22] = 1, [48] = 5,},
            door = 4,
        },
        {
            model = `italigto`, coords = vec4(-2165.556, 1122.993, -24.9359, 86.2415),
            colors = {147, 41}, extraColors = {4, 0}, livery = 0, intColor = 1,
            modKits = {[0] = 4, [2] = 2, [3] = 2, [4] = 3, [5] = 1, [6] = 1, [7] = 9, [8] = 2, [10] = 2, [15] = 4, [20] = 1, [23] = 8,},
            door = 4,
        },
        {
            model = `jester`, coords = vec4(-2177.7668, 1082.6068, -24.7161, 269.6463),
            colors = {0, 53}, extraColors = {93, 53}, livery = 0, intColor = 1,
            modKits = {[0] = 2, [1] = 2, [2] = 1, [5] = 1, [10] = 1, [23] = 18,},
            door = 4,
        },
        {
            model = `hellion`, coords = vec4(-2178.3313, 1095.953, -24.9317, 108.3571),
            colors = {132, 28}, extraColors = {18, 122}, livery = 5, intColor = 1,
            neons = {255, 0, 0},
            modKits = {[0] = 2, [1] = 4, [2] = 7, [3] = 5, [4] = 6, [5] = 2, [6] = 8, [8] = 3, [15] = 1, [23] = 6, [48] = 5,},
            door = 4,
        },
        {
            model = `lynx`, coords = vec4(-2177.4417, 1103.5594, -24.8084, 285.1019),
            colors = {88, 2}, extraColors = {5, 1}, livery = 0, intColor = 1,
            neons = {255, 150, 5},
            modKits = {[0] = 2, [1] = 3, [2] = 4, [3] = 1, [4] = 2, [7] = 2, [15] = 2, [23] = 2,},
            door = 4,
        },
        {
            model = `mamba`, coords = vec4(-2177.862, 1112.4559, -24.813, 279.0025),
            colors = {27, 111}, extraColors = {36, 122}, livery = 0, intColor = 1,
            modKits = {[4] = 1, [7] = 3, [15] = 1, [23] = 19,},
        },
        {
            model = `manana2`, coords = vec4(-2177.9956, 1115.811, -24.8131, 269.9982),
            colors = {0, 27}, extraColors = {10, 156}, livery = 8, intColor = 1,
            modKits = {[1] = 2, [23] = 64, [24] = 2, [25] = 13, [26] = 3, [27] = 14, [28] = 1, [33] = 2, [34] = 1, [37] = 3, [38] = 3, [39] = 2, [40] = 3, [42] = 1, [45] = 1, [48] = 8,},
            door = 4,
        },
        {
            model = `michelli`, coords = vec4(-2177.9092, 1126.1991, -24.5806, 270.496),
            colors = {73, 111}, extraColors = {73, 1}, livery = 1, intColor = 1,
            neons = {3, 83, 255},
            modKits = {[0] = 4, [1] = 4, [3] = 1, [4] = 4, [6] = 1, [7] = 1, [8] = 2, [10] = 1, [15] = 4, [22] = 1, [23] = 12,},
            door = 4,
        },
        {
            model = `moonbeam2`, coords = vec4(-2157.6177, 1122.9877, -24.9197, 294.5404),
            colors = {33, 107}, extraColors = {0, 33}, livery = 0, intColor = 1,
            neons = {15, 3, 255},
            modKits = {[0] = 1, [6] = 2, [10] = 2, [11] = 4, [12] = 3, [13] = 3, [14] = 35, [16] = 5, [18] = 1, [20] = 1, [23] = 92, [24] = 4, [25] = 7, [26] = 6, [27] = 2, [28] = 10, [30] = 8, [31] = 3, [32] = 1, [33] = 13, [34] = 5, [35] = 8, [37] = 3, [38] = 4, [39] = 3, [40] = 2, [48] = 4,},
            door = 5,
        },
        {
            model = `nightshade`, coords = vec4(-2165.869, 1082.9851, -25.1011, 89.8625),
            colors = {0, 0}, extraColors = {0, 156}, livery = 0, intColor = 1,
            modKits = {[0] = 3, [1] = 1, [2] = 1, [4] = 1, [6] = 2, [7] = 3, [23] = 132,},
        },
        {
            model = `penumbra2`, coords = vec4(-2165.858, 1099.1241, -25.0166, 90.3754),
            colors = {131, 2}, extraColors = {0, 156}, livery = 0, intColor = 1,
            modKits = {[0] = 3, [1] = 6, [2] = 3, [3] = 14, [4] = 4, [5] = 1, [6] = 1, [7] = 12, [8] = 1, [10] = 6, [15] = 2, [23] = 18, [48] = 10,},
            door = 4,
        },
        {
            model = `rapidgt3`, coords = vec4(-2165.7327, 1116.056, -24.7375, 92.4518),
            colors = {63, 122}, extraColors = {0, 156}, livery = 0, intColor = 1,
            neons = {3, 83, 255},
            modKits = {[1] = 1, [2] = 2, [3] = 1, [23] = 36,},
            door = 4,
        },
        {
            model = `retinue2`, coords = vec4(-2165.7139, 1113.0128, -24.7202, 84.7794),
            colors = {38, 28}, extraColors = {88, 1}, livery = 0, intColor = 1,
            modKits = {[0] = 6, [1] = 5, [5] = 1, [6] = 4, [7] = 6, [8] = 1, [9] = 1, [10] = 3, [15] = 1, [23] = 4,},
            door = 4,
        },
        {
            model = `sabregt2`, coords = vec4(-2157.4143, 1092.6615, -25.0158, 273.0755),
            colors = {137, 25}, extraColors = {0, 88}, livery = 1, intColor = 1,
            neons = {212, 42, 192},
            modKits = {[1] = 3, [4] = 2, [5] = 1, [6] = 1, [7] = 1, [22] = 1, [23] = 27, [24] = 3, [25] = 8, [26] = 13, [27] = 1, [28] = 21, [30] = 2, [33] = 13, [34] = 10, [35] = 9, [36] = 2, [37] = 4, [38] = 3, [39] = 3, [40] = 1, [48] = 1,},
            door = 4,
        },
        {
            model = `savestra`, coords = vec4(-2157.489, 1099.3881, -24.568, 269.7734),
            colors = {28, 0}, extraColors = {28, 0}, livery = 1, intColor = 1,
            modKits = {[0] = 5, [1] = 5, [2] = 6, [3] = 2, [4] = 3, [6] = 3, [7] = 3, [8] = 6, [22] = 1, [23] = 20,},
            door = 4,
        },
        {
            model = `schlagen`, coords = vec4(-2157.7695, 1119.5001, -24.7377, 87.7933),
            colors = {137, 38}, extraColors = {3, 12}, livery = 0, intColor = 1,
            modKits = {[0] = 9, [3] = 3, [4] = 3, [7] = 4, [9] = 2, [10] = 2, [22] = 1, [23] = 20,},
            door = 4,
        },
        {
            model = `sentinel3`, coords = vec4(-2153.2402, 1073.6912, -24.9994, 346.3212),
            colors = {83, 82}, extraColors = {0, 156}, livery = 3, intColor = 1,
            modKits = {[0] = 11, [1] = 9, [2] = 1, [5] = 1, [6] = 2, [7] = 6, [23] = 44,},
            door = 4,
        },
        {
            model = `slamvan3`, coords = vec4(-2144.7417, 1078.3011, -24.8055, 99.4436),
            colors = {141, 120}, extraColors = {37, 0}, livery = 2, intColor = 1,
            modKits = {[4] = 3, [6] = 5, [7] = 2, [22] = 1, [23] = 16, [24] = 2, [25] = 12, [28] = 1, [32] = 1, [35] = 4, [38] = 2, [39] = 1, [40] = 3, [45] = 1,},
            door = 4,
        },
        {
            model = `specter2`, coords = vec4(-2144.2424, 1146.9443, -24.9388, 282.9675),
            colors = {70, 3}, extraColors = {70, 0}, livery = 0, intColor = 1,
            neons = {222, 222, 255},
            modKits = {[0] = 10, [1] = 1, [2] = 5, [3] = 3, [4] = 4, [5] = 3, [8] = 4, [11] = 2, [12] = 2, [13] = 1, [14] = 1, [15] = 1, [16] = 2, [17] = 1, [18] = 1, [22] = 1, [23] = 11, [29] = 1, [30] = 7, [31] = 1, [32] = 6, [33] = 13, [48] = 1,},
        },
        {
            model = `sugoi`, coords = vec4(-2144.351, 1088.6233, -24.9323, 267.4824),
            colors = {111, 27}, extraColors = {0, 27}, livery = 3, intColor = 1,
            neons = {255, 0, 7},
            modKits = {[0] = 1, [1] = 4, [2] = 5, [3] = 3, [4] = 5, [6] = 1, [8] = 4, [13] = 2, [15] = 3, [18] = 1, [23] = 17,},
        },
        {
            model = `infernus2`, coords = vec4(-2144.5117, 1091.5623, -24.8513, 87.3259),
            colors = {50, 0}, extraColors = {92, 112}, livery = 0, intColor = 1,
            neons = {94, 255, 1},
            modKits = {[4] = 2, [5] = 4, [8] = 3, [10] = 4, [11] = 2, [13] = 1, [15] = 4, [18] = 1, [22] = 1,},
        },
        {
            model = `torero`, coords = vec4(-2178.015, 1092.9044, -24.9227, 90.0027),
            colors = {62, 0}, extraColors = {111, 0}, livery = 0, intColor = 1,
            neons = {3, 83, 255},
            modKits = {[0] = 3, [1] = 1, [2] = 3, [4] = 3, [9] = 4, [23] = 10,},
            door = 4,
        },
        {
            model = `yosemite3`, coords = vec4(-2154.1758, 1140.528, -25.0145, 353.2417),
            colors = {30, 112}, extraColors = {111, 112}, livery = 1, intColor = 1,
            modKits = {[0] = 1, [1] = 7, [2] = 5, [4] = 1, [6] = 7, [7] = 11, [10] = 2, [23] = 22, [30] = 8, [32] = 3, [33] = 10, [37] = 2, [39] = 1, [40] = 4, [42] = 2, [45] = 3,},
            door = 4,
        },
        {
            model = `turismo2`, coords = vec4(-2157.516, 1112.6079, -25.0091, 275.9479),
            colors = {51, 147}, extraColors = {92, 11}, livery = 1, intColor = 1,
            modKits = {[0] = 10, [1] = 6, [3] = 1, [4] = 2, [7] = 6, [8] = 1, [10] = 2, [11] = 4, [22] = 1, [23] = 23,},
            door = 4,
        },
        {
            model = `verlierer2`, coords = vec4(-2169.7104, 1073.6605, -25.0005, 12.1427),
            colors = {38, 3}, extraColors = {89, 156}, livery = 6, intColor = 1,
            modKits = {[3] = 1, [7] = 4, [23] = 27,},
            door = 4,
        },
        {
            model = `viseris`, coords = vec4(-2199.05, 1086.27, -23.26, 266.78),
            colors = {8, 52}, extraColors = {134, 156}, livery = 0, intColor = 1,
            modKits = {[0] = 3, [1] = 2, [4] = 6, [6] = 5, [7] = 3, [8] = 2, [12] = 1, [13] = 2, [15] = 3, [16] = 3, [18] = 1, [20] = 1, [22] = 1, [23] = 199,},
            door = 4,
        },
        {
            model = `flashgt`, coords = vec4(-2186.992, 1130.1017, -23.4614, 93.528),
            colors = {111, 111}, extraColors = {111, 122}, livery = 10, intColor = 1,
            modKits = {[0] = 1, [1] = 4, [3] = 4, [4] = 1, [5] = 2, [10] = 1, [15] = 5, [22] = 1, [23] = 11, [48] = 10,},
            door = 4,
        },
    },
    Peds = {
        {model = `A_M_Y_ClubCust_01`, dict = 'amb@world_human_window_shop@male@idle_a', anim = 'browse_a', flag = 49, coords = vec4(-2196.89, 1116.86, -23.26, 55.92)},
        {model = `a_m_m_paparazzi_01`, scenario = 'WORLD_HUMAN_PAPARAZZI', coords = vec4(-2159.93, 1132.75, -24.37, 24.71), default = true},
        {model = `S_M_Y_XMech_01`, scenario = 'WORLD_HUMAN_STAND_MOBILE', coords = vec4(-2162.2, 1130.58, -24.37, 359.48), default = true},
        {model = `A_F_Y_CarClub_01`, scenario = 'WORLD_HUMAN_STAND_MOBILE', coords = vec4(-2167.84, 1137.38, -24.37, 270.11)},
        {model = `A_F_Y_CarClub_01`, dict = 'amb@world_human_leaning@female@wall@back@hand_up@idle_a', anim = 'idle_a', flag = 49, coords = vec4(-2174.05, 1108.49, -24.37, 73.72)},
        {model = `A_M_Y_ClubCust_01`, dict = 'anim@amb@business@bgen@bgen_no_work@', anim = 'stand_phone_phoneputdown_idle_nowork', flag = 49, coords = vec4(-2174.24, 1107.82, -24.37, 66.27)},
        {model = `A_M_Y_ClubCust_04`, dict = 'ANIM@AMB@INSPECT@CROUCH@MALE_A@IDLES', anim = 'idle_a', flag = 01, coords = vec4(-2201.39, 1127.39, -23.26, 184.97)},
        {model = `A_F_Y_CarClub_01`, dict = 'amb@world_human_leaning@female@wall@back@hand_up@idle_a', anim = 'idle_a', flag = 49, coords = vec4(-2206.96, 1135.0, -23.26, 130.87)},
        {model = `A_M_Y_ClubCust_01`, dict = 'anim@amb@business@bgen@bgen_no_work@', anim = 'stand_phone_phoneputdown_idle_nowork', flag = 49, coords = vec4(-2206.66, 1134.14, -23.26, 87.53)},
        {model = `A_M_Y_CarClub_01`, dict = 'mini@repair', anim = 'fixing_a_player', flag = 01, coords = vec4(-2193.72, 1139.57, -23.26, 99.02), default = true},
        {model = `S_M_M_Tattoo_01`, dict = 'timetable@ron@ig_3_couch', anim = 'base', flag = 01, coords = vec4(-2161.46, 1073.97, -24.36, 3.27), default = true},
        {model = `A_M_Y_Latino_01`, dict = 'anim@amb@carmeet@checkout_car@male_c@idles', anim = 'idle_b', flag = 01, coords = vec4(-2160.74, 1078.58, -24.36, 167.2)},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_engine@male_a@idles', anim = 'idle_a', flag = 01, coords = vec4(-2186.38, 1103.37, -23.26, 57.18)},
        {model = `A_M_Y_ClubCust_02`, dict = 'anim@amb@carmeet@take_photos@male_a@idles', anim = 'idle_a', flag = 01, coords = vec4(-2165.49, 1141.41, -24.37, 209.19), animType = 'phone'},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_car@smoke@male_a@idles', anim = 'idle_b', flag = 01, coords = vec4(-2161.18, 1141.56, -24.37, 181.34), animType = 'smoke'},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@take_photos@male_a@base', anim = 'base', flag = 01, coords = vec4(-2175.61, 1137.84, -24.37, 96.07), animType = 'phone'},
        {model = `A_f_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_engine@female_a@idles', anim = 'idle_c', flag = 01, coords = vec4(-2176.11, 1136.59, -24.37, 54.72)},
        {model = `A_f_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_car@smoke@female_a@idles', anim = 'idle_c', flag = 01, coords = vec4(-2200.98, 1115.37, -23.26, 340.11), animType = 'smoke'},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_engine@male_c@idles', anim = 'idle_a', flag = 01, coords = vec4(-2208.36, 1117.4, -23.26, 183.19)},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_engine@male_b@idles', anim = 'idle_b', flag = 01, coords = vec4(-2209.18, 1117.39, -23.26, 212.18)},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_engine@male_d@idles', anim = 'idle_c', flag = 01, coords = vec4(-2189.89, 1127.0, -23.26, 265.56)},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_car@drink@male_a@idles', anim = 'idle_b', flag = 01, coords = vec4(-2189.42, 1125.78, -23.26, 321.37), animType = 'drink'},
        {model = `A_f_Y_CarClub_01`, dict = 'anim@amb@carmeet@take_photos@female_a@idles', anim = 'idle_d', flag = 01, coords = vec4(-2184.37, 1120.21, -23.26, 93.03), animType = 'phone'},
        {model = `A_f_Y_CarClub_01`, dict = 'anim@amb@carmeet@take_photos@female_a@idles', anim = 'idle_a', flag = 01, coords = vec4(-2185.37, 1118.68, -23.26, 4.53), animType = 'phone'},
        {model = `A_M_Y_ClubCust_02`, dict = 'ANIM@AMB@INSPECT@CROUCH@MALE_A@IDLES', anim = 'idle_a', flag = 01, coords = vec4(-2188.46, 1115.67, -23.26, 358.47)},
        {model = `A_M_Y_ClubCust_01`, dict = 'anim@amb@carmeet@take_photos@male_a@idles', anim = 'idle_b', flag = 01, coords = vec4(-2187.95, 1102.73, -23.26, 336.59), animType = 'phone'},
        {model = `a_m_m_paparazzi_01`, scenario = 'WORLD_HUMAN_PAPARAZZI', coords = vec4(-2189.81, 1086.0, -23.26, 223.53)},
        {model = `A_F_Y_CarClub_01`, dict = 'amb@world_human_leaning@female@wall@back@hand_up@idle_a', anim = 'idle_a', flag = 49, coords = vec4(-2210.49, 1087.01, -23.26, 254.8)},
        {model = `A_M_Y_ClubCust_01`, dict = 'amb@world_human_window_shop@male@idle_a', anim = 'browse_a', flag = 49, coords = vec4(-2205.2, 1089.15, -23.26, 78.27)},
        {model = `A_F_Y_CarClub_01`, dict = 'anim@amb@carmeet@take_photos@female_a@idles', anim = 'idle_b', flag = 01, coords = vec4(-2201.12, 1087.97, -23.26, 100.49), animType = 'phone'},
        {model = `A_F_Y_ClubCust_02`, dict = 'anim@amb@carmeet@take_photos@female_a@idles', anim = 'idle_c', flag = 01, coords = vec4(-2148.16, 1079.66, -24.36, 222.05), animType = 'phone'},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_engine@male_c@idles', anim = 'idle_a', flag = 01, coords = vec4(-2147.19, 1077.0, -24.36, 316.21)},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_engine@male_b@idles', anim = 'idle_b', flag = 01, coords = vec4(-2147.79, 1078.26, -24.36, 274.82)},
        {model = `A_M_Y_CarClub_01`, dict = 'amb@world_human_leaning@male@wall@back@foot_up@idle_a', anim = 'idle_a', flag = 01, coords = vec4(-2151.92, 1074.44, -24.36, 253.7)},
        {model = `A_M_Y_CarClub_01`, dict = 'mini@repair', anim = 'fixing_a_player', flag = 01, coords = vec4(-2168.41, 1099.02, -24.36, 274.13)},
        {model = `A_M_Y_CarClub_01`, dict = 'mini@repair', anim = 'fixing_a_player', flag = 01, coords = vec4(-2163.37, 1090.21, -24.36, 113.61)},
        {model = `A_F_Y_CarClub_01`, scenario = 'WORLD_HUMAN_SEAT_LEDGE_EATING', coords = vec4(-2176.05, 1092.93, -24.28, 265.55)},
        {model = `A_M_Y_CarClub_01`, scenario = 'WORLD_HUMAN_SEAT_WALL', coords = vec4(-2177.51, 1096.84, -23.39, 32.52)},
        {model = `A_f_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_car@smoke@female_a@idles', anim = 'idle_a', flag = 01, coords = vec4(-2168.52, 1116.79, -24.37, 244.21), animType = 'smoke'},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@checkout_car@drink@male_a@idles', anim = 'idle_d', flag = 01, coords = vec4(-2166.32, 1114.48, -24.37, 138.64), animType = 'drink'},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@listen_music@male_a@base', anim = 'base', flag = 01, coords = vec4(-2176.33, 1124.74, -24.37, 35.82)},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@listen_music@male_a@idles', anim = 'idle_b', flag = 01, coords = vec4(-2161.24, 1123.0, -24.37, 149.28)},
        {model = `A_F_Y_CarClub_01`, dict = 'anim@amb@carmeet@listen_music@female_a@idles', anim = 'idle_a', flag = 01, coords = vec4(-2160.37, 1121.02, -24.37, 328.88)},
        {model = `A_f_Y_CarClub_01`, dict = 'anim@amb@carmeet@take_photos@female_a@idles', anim = 'idle_d', flag = 01, coords = vec4(-2154.79, 1093.02, -24.36, 121.59), animType = 'phone'},
        {model = `A_M_Y_CarClub_01`, dict = 'anim@amb@carmeet@take_photos@male_a@idles', anim = 'idle_b', flag = 01, coords = vec4(-2155.09, 1087.43, -24.36, 141.39), animType = 'phone'},
    }
}