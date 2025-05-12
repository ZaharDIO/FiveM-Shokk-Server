

const store = Vuex.createStore({
    state: {},
    mutations: {},
    actions: {}
});

const app = Vue.createApp({
    data: () => ({
        Show: false,
        time: localStorage.getItem('ScreenMode') ||'dark',
        carPlayPosition : {
            left : null,
            top : null,
        },
        CurrentPageData : {
            'DefaultApp' : false,
            'AutoPilotApp' : true,
            'DoorApp' : false,
            'NeonApp' : false,
            'MusicApp' : false ,
            'KonumApp' : false,
            'SettingsApp' : false,
        },
        PlayerPlaylist : [
            {title : 'Liked Songs', song : [{
                name : 'Alone In Nature',
                artistname : 'Omer',
                url : 'https://www.youtube.com/watch?v=t7jV5sSLWPc8',
                kapakPictures : 'https://i.scdn.co/image/ab67616d0000b27346d5ded1ce42d243b6b9321e',
                songimage : 'https://i.scdn.co/image/ab67616d00001e0246d5ded1ce42d243b6b9321e',
                image : 'https://i.scdn.co/image/ab67616d0000485146d5ded1ce42d243b6b9321e',
                liked : true,
                playing : true,
            },], image : 'https://i.scdn.co/image/ab67616d00001e0226f7f19c7f0381e56156c94a',  liked : true, playing : true}, 
        ],
        currentPlaylist : null,
        notifyData : {
            bool : true,
            text : 'Notification'
        },
        Playlist : {
            timer : null,
            DeletePlaylist : true,
            ShowPlaylistData : false,
            OtherPlayer : false,
            OtherPlayerID : null,
            PauseMusic : true,
            AddPlaylistSucces : false,
            DeletePlaylistSucces : false,
            NewPlaylistName : 'Playlist Name',
            EditButton : false,
            CoverUrlvmodel : 'Cover Image URL...',
            SongURLvmodel : 'Song URL...',
            Playingsong : {
                currentTime : '80',
                maxDuration : '186',
                name : 'I am Your Father',
                artistname : 'tahacftc',
                url : 'https://www.youtube.com/watch?v=t7jV5sSLWPc8',
                kapakPictures : 'https://i.scdn.co/image/ab67616d0000b27346d5ded1ce42d243b6b9321e',
                songimage : 'https://i.scdn.co/image/ab67616d00001e0246d5ded1ce42d243b6b9321e',
                image : 'https://i.scdn.co/image/ab67616d0000485146d5ded1ce42d243b6b9321e',
                liked : false,
                playing : false,
            }
        },
       
        playerdata: { 
            name: 'TURKYUSUFFFFFF',
            soundlevel: localStorage.getItem('soundlevel') || 25, 
            avatar: './img/profilepicture.png'
        },
        NewCreatePlaylist : false,
        defaultapp: false,
        scriptname : 'CarPlay',
        currentTime: '',
        SecilenMode : localStorage.getItem('vmodelScreen') || 'dark',
        screenSize: 100,
        Locales: {
            MCARCONTROL: "mCarcontrol",
            ENGINE_FAILURE: "Engine Failure",
            SPEEDTYPE: "km/h",
            RPMTYPE: "x1000/rpm",
            HELLO: "Hello",
            ACTIVE: "Activate",
            DEACTIVE: "Autopilot Activated",
            WELCOME_TO: "Welcome To",
            AUTOPILOT: "Autopilot",
            SET_WAYPOINT: "Please set a waypoint first.",
            VEHICLE_DOORS: "Vehicle Doors",
            BONNET: "Bonnet",
            TRUNK: "Trunk",
            LEFT_FRONT: "Left Front",
            RIGHT_FRONT: "Right Front",
            LEFT_BACK: "Left Back",
            RIGHT_BACK: "Right Back",
            VEHICLE_WINDOWS: "Vehicle Windows",
            ALL_WINDOWS: "All Windows",
            AMBIENCE: "Ambience",
            PROXIMA: "Proxima",
            SKY: "Sky",
            SNOW: "Snow",
            IGNITE: "Ignite",
            FOREST: "Forest",
            CUSTOM: "Custom",
            NEON_CONTROL: "Neon Control",
            ALL: "All",
            PARTY: "Party",
            FRONT: "Front",
            REAR: "Rear",
            LEFT_SIDE: "Left Side",
            RIGHT_SIDE: "Right Side",
            PLAYLIST: "Playlist",
            LIKED_SONGS: "Liked Songs",
            QUICK_PLAY: "Quick Play",
            YOUTUBE_LINK: "Put the YouTube link into input.",
            PLAY: "Play",
            ATM: "ATM",
            CLICK_WAYPOINT: "click to set waypoint",
            GAS_STATION: "Gas Station",
            MARKET: "Market",
            QUICK_NAVIGATION: "Quick Navigation",
            CLOTHING_STORE: "Clothing Store",
            BARBERSHOP: "Barbershop",
            TATTOO_PARLOR: "Tattoo Parlor",
            DISPLAY: "Display",
            THEMES: "Themes",
            SETTINGS: "Settings",
            ADJUST_SETTINGS: "Adjust the settings as you like.",
            SCREEN_SIZE: "Screen Size",
            FREEFORM_DRAG: "Freeform Drag",
            RESTORE: "Restore",
            MOVE: "Move",
            OPTIONS: "Options",
            USE_SAME_COLOR: "Use same color in each apps.",
            PLAY_MENU_SOUND: "Play menu sound effects.",
            MINIMIZE_MCARCONTROL: "Minimize the mCarcontrol.",
            PASSENGER_ACCESS: "Passenger access.",
            FLASHING_LIGHTS: "Flashing Lights",
            PLAYING_CARCONTROL: "Playing from Carcontrol...",
            NOT_SUPORTED_NEON: "Neon is not installed on this vehicle.",
            VINEWOOD : "Vinewood",
            STREET : "Vinewood Boulevard",
            CREATE_NEW_PLAYLIST : "Create New Playlist",
            GIVE_PLAYLIST_NAME : "Give your playlist a name",
        },

        soundOpen: "",
        menuBackGround : localStorage.getItem('menuBackGround') || false,
        passengerAccess: localStorage.getItem('passengerAccess') || false,
        MiniShow : localStorage.getItem('MiniShow') || false,
        LastPlaylistUrl : '',
        lastPlaylistName : '',
        lastPlaylistSong : '',
        VehicleData : {
            speed : 180,
            fuel : 70,
            nosLevel: 20,
            gearN : 2,  
            broken : false,
            gear : 'D',
            light : true,
            belt : false,
            image : './img/vehicle/0.png',
            NeonBool : true,
            LeftSignal : false,
            RightSignal : true,
            LongLight : false,
            ShortLight : true,
            autoPilotStatus: false,
            Zone : 'WINEWOOD',
            Street : 'WINEWOOD BOULEVARD',
            neon : {
                'all' : false,
                'party' : false,
                'front' : false,
                'rear' : false,
                'l-side' : false,
                'r-side' : false,
                color : 'purple',
            },

            
            windows: {
                0: false, // Sol ön cam
                1: false, // Sağ ön cam
                2: false, // Sol arka cam
                3: false, // Sağ arka cam
                4: false, // bütün camlar
            },

            doors: {
                0: false, // Sol ön kapı
                1: false, // Sağ ön kapı
                2: false, // Sol arka kapı
                3: false, // Sağ arka kapı
                4: false, // Kaput
                5: false, // Bagaj
            },

        },
        isDragging: false,
        offsetX: 0,
        offsetY: 0,
    }),

    methods: {
        MouseDown() {
        },
        MouseUp() {

        },

        MakeElementDraggable(classname, type) {
            let started = false
            $(classname).draggable({
                helper: "clone",
                revertDuration: 0,
                revert: false,
                containment: "body",
                scroll: false,
                start: (event, ui) => {
                    if (document.elementFromPoint(event.clientX, event.clientY).firstChild == null) {
                        return false
                    } else {
                        if (document.elementFromPoint(event.clientX, event.clientY).firstChild.textContent.length <= 0  && document.body.contains(document.elementFromPoint(event.clientX, event.clientY).firstChild) && document.elementFromPoint(event.clientX, event.clientY).firstChild.classList.contains('tablet-cover')) {
                            return true
                        }
                        return false
                    }

                },
                drag: (event, ui) => {

                },
                stop: (event, ui) => {
                    let left = ui.position.left;
                    let top = ui.position.top;
                    this.carPlayPosition.left = left
                    this.carPlayPosition.top = top

                    localStorage.setItem('CarPlayPoss', JSON.stringify({
                        left,
                        top
                    }));
                   
                    // let type = $(event.target).attr('data-type');
                    // this.positionsData[type] = { left: `${left}px`, top: `${top}px`, position: `absolute` };
                    // this.setHudSettings({
                    //     type,
                    //     value: {
                    //         left,
                    //         top,
                    //     },
                    // })

                }
            });
        },
        playAudio() {
            const audio = document.getElementById('music');
            if (audio) {
              audio.play();
            }
        },
        CreatePlaylist()  {
            this.playAudio();
            this.NewCreatePlaylist = false;
        },
        sendNotify(bool, text) {
            if (this.notifyData.bool) {
                this.notifyData.bool = false
                    
            } else {
                this.notifyData.bool = bool
                this.notifyData.text = text
    
                setTimeout(() => {
                    this.notifyData.bool = false
                }, 2000)
            }
        },
        ChangePage(page) {
            if (this.CurrentPageData[page] === true) {
              for (const key in this.CurrentPageData) {
                this.CurrentPageData[key] = false;
              }
              this.CurrentPageData['DefaultApp'] = true;
              this.playAudio();
            } else {
              for (const key in this.CurrentPageData) {
                this.CurrentPageData[key] = false;
              }
              this.CurrentPageData[page] = true;
              this.playAudio();
            }
        },
        DoorOpen(index) {
            if (this.Playlist.OtherPlayer) {
                this.playAudio();
                this.sendNotify(true, "Only the driver can control")
            } else {
                this.playAudio();
                this.VehicleData.doors[index] = !this.VehicleData.doors[index];
                postNUI('EDIT_VEHICLE',{
                    page : "DoorPart",
                    i : index
                    }
                )
            }

        },
        DoorWindows(index) {
            if (this.Playlist.OtherPlayer) {
                this.playAudio();
                this.sendNotify(true, "Only the driver can control")
            } else {
                this.playAudio();
                if (index === 'all') {
                    this.VehicleData.windows[0] = !this.VehicleData.windows[0];
                    this.VehicleData.windows[1] = !this.VehicleData.windows[1];
                    this.VehicleData.windows[2] = !this.VehicleData.windows[2];
                    this.VehicleData.windows[3] = !this.VehicleData.windows[3];
                    this.VehicleData.windows[4] = !this.VehicleData.windows[4];
                } else {
                    this.VehicleData.windows[index] = !this.VehicleData.windows[index];
                }
                postNUI('EDIT_VEHICLE',{
                    page : "WindowsPart",
                    i : index
                    }
                )
            }

        },
        NeonPart(index, bool) {
            console.log(this.Playlist.OtherPlayer)
            console.log(this.Playlist.OtherPlayerID)
            if (this.Playlist.OtherPlayer) {
                this.playAudio();
                this.sendNotify(true, "Only the driver can control")
            } else {
                this.playAudio();
                if (bool == true) {
                    this.VehicleData.neon[index] = !this.VehicleData.neon[index];
                    if (index == 'all') {
                        this.VehicleData.neon['party'] = false;
                        this.VehicleData.neon['front'] = !this.VehicleData.neon['front'];
                        this.VehicleData.neon['rear'] = !this.VehicleData.neon['rear'];
                        this.VehicleData.neon['l-side'] = !this.VehicleData.neon['l-side'];
                        this.VehicleData.neon['r-side'] = !this.VehicleData.neon['r-side'];
                    }
                    postNUI('EDIT_VEHICLE',{
                        page : "NeonPosition",
                        i : index,
                        }
                    )
                }else {
                    this.VehicleData.neon.color = index;
                    postNUI('EDIT_VEHICLE',{
                        page : "NeonColor",
                        i : this.VehicleData.neon.color,
                        }
                    )
                }
            }

        },
        SelectLocation(index) {
            this.playAudio();
            postNUI('MARK_NEAREST',{
                location : index
                }
            )
        },
        ClickMusic(index, data) {
            this.playAudio();
            if (index == 'NewCreate') {
                this.NewCreatePlaylist = !this.NewCreatePlaylist;
            } else if (index == 'ShowPlaylist') {
                this.Playlist.ShowPlaylistData = data;
                if (this.Playlist.ShowPlaylistData.title !== 'Liked Songs') {
                    this.LastPlaylistUrl = this.Playlist.ShowPlaylistData.image;
                    this.lastPlaylistName = this.Playlist.ShowPlaylistData.title;
                    this.lastPlaylistSong = this.Playlist.ShowPlaylistData.song;
                }
            } else if (index == 'CancelPlaylistCreate') {
                this.NewCreatePlaylist = !this.NewCreatePlaylist;
                
            } else if (index == 'BackPlaylist') {
                if (this.Playlist.ShowPlaylistData.title !== 'Liked Songs') {
                    this.Playlist.ShowPlaylistData.title = this.lastPlaylistName;
                    this.Playlist.ShowPlaylistData.image = this.LastPlaylistUrl;
                    this.Playlist.ShowPlaylistData.song = this.lastPlaylistSong;
                } 
                this.Playlist.EditButton = false;
                this.Playlist.ShowPlaylistData = false;
            } else if (index == 'EditPlaylist') {

            if (this.Playlist.ShowPlaylistData.title !== 'Liked Songs' &&
              this.Playlist.ShowPlaylistData.title.length >= 2) {
              const previousUrl = this.LastPlaylistUrl; 
              const previousName = this.lastPlaylistName;
              const previousSong = this.lastPlaylistSong; 
          
              fetch(this.Playlist.ShowPlaylistData.image)
                .then(response => {
                  if (response.status === 200) {
                    this.LastPlaylistUrl = this.Playlist.ShowPlaylistData.image;
                    this.lastPlaylistName = this.Playlist.ShowPlaylistData.title;
                    this.lastPlaylistSong = this.Playlist.ShowPlaylistData.song;
                    this.Playlist.EditButton = !this.Playlist.EditButton;
          
                    const musicData = this.PlayerPlaylist;
                    postNUI('MUSIC_VEHICLE', {
                      page: "CreatePlaylist",
                      musicData: musicData,
                    });
                  } else {
                    this.LastPlaylistUrl = previousUrl;
                    this.lastPlaylistName = previousName;
                    this.lastPlaylistSong = previousSong;
                    console.error('URL çalışmıyor');
                  }
                })
                .catch(error => {
                  this.LastPlaylistUrl = previousUrl;
                  this.lastPlaylistName = previousName;
                  this.lastPlaylistSong = previousSong;
                  console.error('URL çalışmıyor', error);
                });
            } else {
              console.warn('isim 2 harfden kısa.');
            }
            } else if (index == 'RemoveMusic') {
                if (this.Playlist.ShowPlaylistData) {
                    const songIndex = data;
                    if (songIndex >= 0 && songIndex < this.Playlist.ShowPlaylistData.song.length) {
                        this.Playlist.ShowPlaylistData.song.splice(songIndex, 1);
                    }
                    const musicData = this.PlayerPlaylist;
                    postNUI('MUSIC_VEHICLE',{
                        page : "CreatePlaylist",
                        musicData : musicData,
                        }
                    )
                }
            } else if (index == 'Like') {
                if (this.Playlist.Playingsong) {
                    this.Playlist.Playingsong.liked = !this.Playlist.Playingsong.liked;

                    const newSong = {
                      name: this.Playlist.Playingsong.name,
                      artistname: this.Playlist.Playingsong.artistname,
                      url: this.Playlist.Playingsong.url,
                      kapakPictures: this.Playlist.Playingsong.kapakPictures,
                      songimage: this.Playlist.Playingsong.songimage,
                      image: this.Playlist.Playingsong.image,
                      liked: this.Playlist.Playingsong.liked,
                    };
                
                    const likedSongsPlaylist = this.PlayerPlaylist.find(
                      (playlist) => playlist.title === 'Liked Songs'
                    );
                
                    if (likedSongsPlaylist) {
                      if (this.Playlist.Playingsong.liked) {
                        likedSongsPlaylist.song.push(newSong);
                        
                      } else {
                        const songIndex = likedSongsPlaylist.song.findIndex(
                          (song) => song.url === this.Playlist.Playingsong.url
                        );
                        if (songIndex !== -1) {
                          likedSongsPlaylist.song.splice(songIndex, 1);
                        }
                      }
                    }
                    const musicData = this.PlayerPlaylist;
                    postNUI('MUSIC_VEHICLE',{
                        page : "CreatePlaylist",
                        musicData : musicData,
                        }
                    )
                  }
            } else if (index == 'addMusic') {
                const newSong = {
                    name: this.Playlist.Playingsong.name,
                    artistname: this.Playlist.Playingsong.artistname,
                    url: this.Playlist.Playingsong.url,
                    kapakPictures : this.Playlist.Playingsong.kapakPictures,
                    songimage : this.Playlist.Playingsong.songimage,
                    image : this.Playlist.Playingsong.image,
                    liked: this.Playlist.Playingsong.liked,
                };
                this.PlayerPlaylist.forEach((playlist) => {
                    if (playlist.title === data) {
                        if (playlist.image == 'https://www.afrocharts.com/images/song_cover.png') {
                            playlist.image = this.Playlist.Playingsong.image;
                        }
                        playlist.song.push(newSong);
                    }
                    const musicData = this.PlayerPlaylist;
                    postNUI('MUSIC_VEHICLE',{
                        page : "CreatePlaylist",
                        musicData : musicData,
                        }
                    )
                });
            } else if (index == 'PlayMusic') {
                if (this.Playlist.OtherPlayer == true) {
                    this.Playlist.PauseMusic = true;
                    postNUI('MUSIC_VEHICLE',{
                        page : "PlayMusic",
                        url : this.Playlist.SongURLvmodel,
                        musicOwner : this.Playlist.OtherPlayerID
                        }
                    )
                } else {
                    this.Playlist.PauseMusic = true;
                    $.getJSON('https://noembed.com/embed?url=', { format: 'json', url: this.Playlist.SongURLvmodel }, (data) => {
                        this.Playlist.SongURLvmodel = 'Song URL...';
                    
                        this.Playlist.Playingsong.url = data.url;
                        const likedSongsPlaylist = this.PlayerPlaylist.find(
                          (playlist) => playlist.title === 'Liked Songs'
                        );
                    
                        if (likedSongsPlaylist) {
                          const isLiked = likedSongsPlaylist.song.some(
                            (song) => song.url === this.Playlist.Playingsong.url
                          );
                          this.Playlist.Playingsong.liked = isLiked;
                        }
    
                        postNUI('MUSIC_VEHICLE',{
                            page : "PlayMusic",
                            url : this.Playlist.Playingsong.url,
                            }
                        )
                        this.getSpotifyCover(data.title + ' ' + data.author_name);
                      });
                }
            } else if (index == 'CreatePlaylist') {
                let isDuplicate = false;
                this.PlayerPlaylist.forEach((playlist) => {
                    if (playlist.title === this.Playlist.NewPlaylistName) {
                        isDuplicate = true;
                        this.sendNotify(true, "There is a playlist with this name")
                    }
                });
            
                if (!isDuplicate) {
                    const newPlaylist = {
                        title: this.Playlist.NewPlaylistName,
                        song: [], 
                        image: 'https://www.afrocharts.com/images/song_cover.png', 
                        kapakPictures: null, 
                        BigPictures: null, 
                        playing: false,
                    };
                    this.PlayerPlaylist.push(newPlaylist);
                    this.Playlist.NewPlaylistName = "Playlist Name";
                    this.NewCreatePlaylist = !this.NewCreatePlaylist;
                    const musicData = this.PlayerPlaylist;
                    postNUI('MUSIC_VEHICLE',{
                        page : "CreatePlaylist",
                        musicData : musicData,
                    });
                }
            } else if (index == 'AddPlaylistSucces') {
                console.log(this.Playlist.DeletePlaylistSucces)
                if (this.Playlist.DeletePlaylistSucces){
                    this.sendNotify(true, 'kapat')
                } else {
                    this.Playlist.AddPlaylistSucces = !this.Playlist.AddPlaylistSucces;
                }
               
            } else if (index == 'DeletePlaylistSucces') {
                if (this.Playlist.AddPlaylistSucces){
                    this.sendNotify(true, 'kapat')
                } else {
                    this.Playlist.DeletePlaylistSucces = !this.Playlist.DeletePlaylistSucces;
                }
            } else if (index == 'RemovePlaylist') {

                const playingSongUrl = this.Playlist.Playingsong.url;
                const playlist = this.PlayerPlaylist.find(item => item.title === data.title);
                
                
                for (const song of playlist.song) {
                    if (song.url === playingSongUrl) {
                        this.PlayerPlaylist.forEach((playlist) => {
                            playlist.playing = false; 
                            playlist.song.forEach((song) => {
                                song.playing = false;
                            });
                        });
                        this.Playlist.PauseMusic = true;
                        postNUI('MUSIC_VEHICLE',{
                            page : "PauseMusic",
                            }
                        )
                    }
                }
                const indexToRemove = this.PlayerPlaylist.findIndex(playlist => {
                    return playlist.title === data.title;
                  });
                
                  if (indexToRemove !== -1) {
                    this.PlayerPlaylist.splice(indexToRemove, 1);
                    this.sendNotify(true, 'Playlist named ' + data.title + ' DELETED')
                  } else {
                    this.sendNotify(true, 'Playlist not found')
                  }

                  this.PlayerPlaylist.forEach((playlist) => {
                    playlist.playing = false; 
                    playlist.song.forEach((song) => {
                        if (song.url === this.Playlist.Playingsong.url) {
                            song.playing = true;
                            playlist.playing = true; 
                            this.currentPlaylist = playlist; 
                            found = true; 
                        } else {
                            song.playing = false;
                        }
                    });
                });

            } else if (index == 'PauseMusic') {
                if (this.Playlist.OtherPlayer == true) {
                    this.Playlist.PauseMusic = true;
                    postNUI('MUSIC_VEHICLE',{
                        page : "PauseMusic",
                        musicOwner : this.Playlist.OtherPlayerID
                        }
                    )
                } else {
                    this.PlayerPlaylist.forEach((playlist) => {
                        playlist.playing = false; 
                        playlist.song.forEach((song) => {
                            song.playing = false;
                        });
                    });
                    this.Playlist.PauseMusic = true;
                    postNUI('MUSIC_VEHICLE',{
                        page : "PauseMusic",
                        }
                    )
                }

            } else if (index == 'ResumeMusic') {
                if (this.Playlist.OtherPlayer == true) {
                    this.Playlist.PauseMusic = false;
                    postNUI('MUSIC_VEHICLE',{
                        page : "ResumeMusic",
                        musicOwner : this.Playlist.OtherPlayerID
                        }
                    )
                } else {
                    this.Playlist.PauseMusic = false;
                    postNUI('MUSIC_VEHICLE',{
                        page : "ResumeMusic",
                        }
                    )
                    this.PlayerPlaylist.forEach((playlist) => {
                        playlist.playing = false; 
                        playlist.song.forEach((song) => {
                            if (song.url === this.Playlist.Playingsong.url) {
                                song.playing = true;
                                playlist.playing = true; 
                                this.currentPlaylist = playlist; 
                                found = true; 
                            } else {
                                song.playing = false;
                            }
                        });
                    });
                }

            } else if (index == 'ClickMusicandPlay') {

                if (this.Playlist.OtherPlayer == true) {

                    this.Playlist.PauseMusic = false;
                    let found = false; 
                    this.PlayerPlaylist.forEach((playlist) => {
                        playlist.playing = false; 
                        playlist.song.forEach((song) => {
                            if (song.url === data.url) {
                                song.playing = true;
                                playlist.playing = true; 
                                this.currentPlaylist = playlist; 
                                found = true; 
                            } else {
                                song.playing = false;
                            }
                        });
                    });
                  
                    if (!found) {
                        this.sendNotify(true, "The song was not found in any playlist.")
                    }
                    this.Playlist.Playingsong.url = data.url;
                    this.Playlist.Playingsong.name = data.name;
                    this.Playlist.Playingsong.artistname = data.artistname;
                    this.Playlist.Playingsong.kapakPictures = data.kapakPictures;
                    this.Playlist.Playingsong.songimage = data.songimage;
                    this.Playlist.Playingsong.image = data.image;
                    this.Playlist.Playingsong.liked = data.liked;
                    this.Playlist.Playingsong.playing = true;
                    postNUI('MUSIC_VEHICLE',{
                        page : "PlayMusic",
                        url : this.Playlist.Playingsong.url,
                        musicOwner : this.Playlist.OtherPlayerID
                        }
                    )

                } else {
                    this.Playlist.PauseMusic = false;
                    let found = false; 
                    this.PlayerPlaylist.forEach((playlist) => {
                        playlist.playing = false; 
                        playlist.song.forEach((song) => {
                            if (song.url === data.url) {
                                song.playing = true;
                                playlist.playing = true; 
                                this.currentPlaylist = playlist; 
                                found = true; 
                            } else {
                                song.playing = false;
                            }
                        });
                    });
                  
                    if (!found) {
                        this.sendNotify(true, "The song was not found in any playlist.")
                    }
                
                    this.Playlist.Playingsong.url = data.url;
                    this.Playlist.Playingsong.name = data.name;
                    this.Playlist.Playingsong.artistname = data.artistname;
                    this.Playlist.Playingsong.kapakPictures = data.kapakPictures;
                    this.Playlist.Playingsong.songimage = data.songimage;
                    this.Playlist.Playingsong.image = data.image;
                    this.Playlist.Playingsong.liked = data.liked;
                    this.Playlist.Playingsong.playing = true;
                    postNUI('MUSIC_VEHICLE',{
                        page : "PlayMusic",
                        url : this.Playlist.Playingsong.url,
                        }
                    )
                }

            }else if (index == 'backMusic') {
                let found = false; 
                this.PlayerPlaylist.forEach((playlist) => {
                    playlist.playing = false; 
                    playlist.song.forEach((song) => {
                        if (song.url === this.Playlist.Playingsong.url) {
                            this.currentPlaylist = playlist; 
                            found = true; 
                        }
                    });
                });
                const currentIndex = this.currentPlaylist.song.findIndex(song => song.playing);
                if (currentIndex > 0) {
                  this.setPlayingSong(this.currentPlaylist.song[currentIndex - 1]);
                }
            }else if (index == 'nextMusic') {
                let found = false;
                this.PlayerPlaylist.forEach((playlist) => {
                    playlist.playing = false;
                    playlist.song.forEach((song) => {
                        if (song.url === this.Playlist.Playingsong.url) {
                            this.currentPlaylist = playlist;
                            found = true;
                        }
                    });
                });
                
                if (found) {
                    const currentIndex = this.currentPlaylist.song.findIndex(song => song.playing);
                    if (currentIndex >= 0 && currentIndex < this.currentPlaylist.song.length - 1) {
                        this.setPlayingSong(this.currentPlaylist.song[currentIndex + 1]);
                    }
                }
            }
        },
        setPlayingSong(data) {
            this.Playlist.PauseMusic = false;
            let found = false; 
            this.PlayerPlaylist.forEach((playlist) => {
                playlist.playing = false; 
                playlist.song.forEach((song) => {
                    if (song.url === data.url) {
                        song.playing = true;
                        playlist.playing = true; 
                        this.currentPlaylist = playlist; 
                        found = true; 
                    } else {
                        song.playing = false;
                    }
                });
            });
          
            if (!found) {
                this.sendNotify(true, "The song was not found in any playlist.")
            }
        
            this.Playlist.Playingsong.url = data.url;
            this.Playlist.Playingsong.name = data.name;
            this.Playlist.Playingsong.artistname = data.artistname;
            this.Playlist.Playingsong.kapakPictures = data.kapakPictures;
            this.Playlist.Playingsong.songimage = data.songimage;
            this.Playlist.Playingsong.image = data.image;
            this.Playlist.Playingsong.liked = data.liked;
            this.Playlist.Playingsong.playing = true;
            postNUI('MUSIC_VEHICLE',{
                page : "PlayMusic",
                url : this.Playlist.Playingsong.url,
                }
            )
        },
        async getSpotifyCover(data) {
            try {
              const clientId = 'b048188eabdb4e7dbbc94da1b5293c3a';
              const clientSecret = '917d059e50fa41c79f1e73297df2cc9e';
              const authResponse = await fetch('https://accounts.spotify.com/api/token', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/x-www-form-urlencoded',
                  'Authorization': 'Basic ' + btoa(clientId + ':' + clientSecret),
                },
                body: 'grant_type=client_credentials',
              });
      
              const authData = await authResponse.json();
              const accessToken = authData.access_token;
              const searchResponse = await fetch(`https://api.spotify.com/v1/search?q=${encodeURIComponent(data)}&type=track&limit=1`, {
                headers: {
                  'Authorization': 'Bearer ' + accessToken,
                },
              });
      
              const searchData = await searchResponse.json();
    
              if (searchData.tracks.items.length === 0) {
                return;
              }
      
              const firstTrack = searchData.tracks.items[0];
              this.Playlist.Playingsong.name = firstTrack.name;
              this.Playlist.Playingsong.artistname = firstTrack.artists[0].name;
              this.Playlist.Playingsong.kapakPictures = firstTrack.album.images[0].url;
              this.Playlist.Playingsong.songimage = firstTrack.album.images[1].url;
              this.Playlist.Playingsong.image = firstTrack.album.images[2].url;
              this.Playlist.Playingsong.playing = true;


            } catch (error) {
                // Şarkı bulunmadı
            }
          },
        IsSongInPlaylist(dataname) {
            const playingSongUrl = this.Playlist.Playingsong.url;
            const playlist = this.PlayerPlaylist.find(item => item.title === dataname);
            
            if (!playlist) {
                return true;
            }
            
            for (const song of playlist.song) {
                if (song.url === playingSongUrl) {
                    return false;
                }
            }

            if (dataname === 'Liked Songs') {
                return false;
            }
            
            return true;
        },

        IsSongInPlaylistDelete(dataname) {

            const playingSongUrl = this.Playlist.Playingsong.url;
            const playlist = this.PlayerPlaylist.find(item => item.title === dataname);
            
            if (!playlist) {
                return true;
            }
            
            if (dataname === 'Liked Songs') {
                return false;
            }
            
            return true;
        },
        onSongEnded() {
            this.Playlist.timer = setTimeout(() => {
              this.ClickMusic('nextMusic'); 
            }, 1000); 
        },
        watchSongProgress() {
            if ( this.Playlist.Playingsong.currentTime == this.Playlist.Playingsong.maxDuration -3)  {
                this.onSongEnded();
            }
        },
        SetTimeStamp(e) {
            if (this.Playlist.OtherPlayer == true) {
                this.playAudio();
                if (this.Playlist.Playingsong.name && this.Playlist.Playingsong.maxDuration > 0) {
                    const pos = (e.pageX - this.$refs.musicbar.getClientRects()[0].x) / this.$refs.musicbar.getClientRects()[0].width;
                    postNUI('MUSIC_VEHICLE', {
                        page: 'timestamp',
                        payload: pos * this.Playlist.Playingsong.maxDuration,
                        musicOwner : this.Playlist.OtherPlayerID
                    })
                }
            } else {
                this.playAudio();
                if (this.Playlist.Playingsong.name && this.Playlist.Playingsong.maxDuration > 0) {
                    const pos = (e.pageX - this.$refs.musicbar.getClientRects()[0].x) / this.$refs.musicbar.getClientRects()[0].width;
                    postNUI('MUSIC_VEHICLE', {
                        page: 'timestamp',
                        payload: pos * this.Playlist.Playingsong.maxDuration,
                    })
                }
            }


        },
        toMMSS(val) {
            var sec_num = parseInt(val, 10);
            var hours = Math.floor(sec_num / 3600);
            var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
            var seconds = sec_num - (hours * 3600) - (minutes * 60);
      
            if (hours < 10) { hours = "0" + hours; }
            if (minutes < 10) { minutes = "0" + minutes; }
            if (seconds < 10) { seconds = "0" + seconds; }
            return minutes + ':' + seconds;
        },
        OtherPlayerPlaying(clientData) {
  

            this.Playlist.PauseMusic = clientData.paused;
            this.Playlist.Playingsong.currentTime = clientData.currentTime;
            this.Playlist.Playingsong.maxDuration = clientData.maxDuration;
            $.getJSON('https://noembed.com/embed?url=', { format: 'json', url: clientData.url }, (data) => {
            
                this.Playlist.Playingsong.url = data.url;
                const likedSongsPlaylist = this.PlayerPlaylist.find(
                  (playlist) => playlist.title === 'Liked Songs'
                );
            
                if (likedSongsPlaylist) {
                  const isLiked = likedSongsPlaylist.song.some(
                    (song) => song.url === this.Playlist.Playingsong.url
                  );
                  this.Playlist.Playingsong.liked = isLiked;
                }

                this.PlayerPlaylist.forEach((playlist) => {
                    playlist.playing = false; 
                    playlist.song.forEach((song) => {
                        if (song.url === this.Playlist.Playingsong.url) {
                            song.playing = true;
                            playlist.playing = true; 
                            this.currentPlaylist = playlist; 
                            found = true; 
                        } else {
                            song.playing = false;
                        }
                    });
                });

                this.getSpotifyCover(data.title + ' ' + data.author_name);
              });
        },
        PlayerPlayingEqualtle(otherData, otherUrl) {
            if (otherData == 'PauseMusic') {
                this.PlayerPlaylist.forEach((playlist) => {
                    playlist.playing = false; 
                    playlist.song.forEach((song) => {
                        song.playing = false;
                    });
                });
                this.Playlist.PauseMusic = true;
            } else if (otherData == 'ResumeMusic') {
                this.Playlist.PauseMusic = false;
                this.PlayerPlaylist.forEach((playlist) => {
                    playlist.playing = false; 
                    playlist.song.forEach((song) => {
                        if (song.url === this.Playlist.Playingsong.url) {
                            song.playing = true;
                            playlist.playing = true; 
                            this.currentPlaylist = playlist; 
                            found = true; 
                        } else {
                            song.playing = false;
                        }
                    });
                });
            } else if (otherData == 'PlayMusic') {
                this.Playlist.PauseMusic = false;
                this.Playlist.Playingsong.url = otherUrl;
                $.getJSON('https://noembed.com/embed?url=', { format: 'json', url: this.Playlist.Playingsong.url }, (data) => {
                this.Playlist.SongURLvmodel = 'Song URL...';
            
                this.PlayerPlaylist.forEach((playlist) => {
                    playlist.playing = false; 
                    playlist.song.forEach((song) => {
                        if (song.url === this.Playlist.Playingsong.url) {
                            song.playing = true;
                            playlist.playing = true; 
                            this.currentPlaylist = playlist; 
                            found = true; 
                        } else {
                            song.playing = false;
                        }
                    });
                });


                this.Playlist.Playingsong.url = otherUrl;
                const likedSongsPlaylist = this.PlayerPlaylist.find(
                  (playlist) => playlist.title === 'Liked Songs'
                );
            
                if (likedSongsPlaylist) {
                  const isLiked = likedSongsPlaylist.song.some(
                    (song) => song.url === this.Playlist.Playingsong.url
                  );
                  this.Playlist.Playingsong.liked = isLiked;
                }
                postNUI('MUSIC_VEHICLE',{
                    page : "PlayMusic",
                    url : this.Playlist.Playingsong.url,
                    }
                )
                this.getSpotifyCover(data.title + ' ' + data.author_name);
              });
            }
        },
        SettingPage(index) {
            this.playAudio();
            if (index == 'restore') {
              this.playAudio();

            } else if (index == 'move') {
            } else if (index == 'save') {
                this.screenSize = parseInt(this.screenSize);
                localStorage.setItem('screenSize', this.screenSize);
                this.playAudio();
            }
        },
        ThemeChange(mode) {
            this.playAudio();
            this.time = mode
          
            if (mode == 'dinamik') {
                localStorage.setItem('vmodelScreen', 'dinamik');
            }else {
                localStorage.setItem('ScreenMode', this.time);
                localStorage.setItem('vmodelScreen', mode);
            }
        },
        updateCurrentTime() {
            const now = new Date();
            const day = now.getDate();
            const month = now.toLocaleString('default', { month: 'long' });
            const hours = String(now.getHours()).padStart(2, '0');
            const minutes = String(now.getMinutes()).padStart(2, '0');
            this.currentTime = `${day} ${month} ${hours}:${minutes}`;
        },
        SoundChange(bool) {
            this.playAudio();
            if (bool == 1) {
                if (this.playerdata.soundlevel < 100) {
                    this.playerdata.soundlevel = this.playerdata.soundlevel + 5;
                }
            }else {
                if (this.playerdata.soundlevel > 0) {
                    this.playerdata.soundlevel = this.playerdata.soundlevel - 5;
                }
            }
            localStorage.setItem('soundlevel', this.playerdata.soundlevel);
            postNUI('MUSIC_VEHICLE',{
                page : "SoundLevel",
                volume : this.playerdata.soundlevel,
                }
            )
        },
        soundOpenStorage() {
            localStorage.setItem('soundOpen', JSON.stringify(this.soundOpen));
        },
        setMenuBackground() {
            this.playAudio();
            this.menuBackGround = !this.menuBackGround;
            localStorage.setItem('menuBackGround', this.menuBackGround);

        },
        SetpassengerAccess() {
            localStorage.setItem('passengerAccess', this.passengerAccess);
            this.playAudio();
            postNUI('SETTING_VEHICLE',{
                page : "passengerAccess",
                passengerAccess : this.passengerAccess,
            })
        },

        setMiniShow() {
            this.playAudio();
            console.log(this.MiniShow)
            localStorage.setItem('MiniShow', this.MiniShow);
        },
        AutoPilotStart() {
            this.playAudio();
            if (this.Playlist.OtherPlayer) {
                this.playAudio();
                this.sendNotify(true, "Only the driver can control")
            } else {
                this.VehicleData.autoPilotStatus = !this.VehicleData.autoPilotStatus;
                postNUI('AUTO_PILOT_START',{
                    status : this.VehicleData.autoPilotStatus
                    }
                )
            }
        },
        OnChangeColor(e) {
            let dataType = e.target.getAttribute("data-type");
            if (dataType == "neon") {

                this.VehicleData.neon.color = hexToRgb(e.target.value);
                postNUI('EDIT_VEHICLE',{
                    page : "NeonColor",
                    i : this.VehicleData.neon.color,
                    rgb : true
                    }
                )
            }
        },
        OpenUI() {
            this.Show = true;
            this.playAudio();
        },
        onKeyUp(event) {
            if (event.key === 'Escape') {
              this.Show  = false;
              postNUI("CLOSE_TABLET")
            }
        },
        
    },  
    computed: {
        getCarPlayPosition(){
            console.log(JSON.stringify(this.carPlayPosition))
            if (this.carPlayPosition.left) {
                return {
                    position : this.carPlayPosition.left ? 'absolute' : 'static', 
                    left : this.carPlayPosition.left+'px',
                    top : this.carPlayPosition.top+'px'
                }
            } else {
                return
            }

        },
        speedStyle() {
            if (this.VehicleData.speed.length === 3) {
              return {
                fontSize: "1.5vw"
              };
            }

            if (this.VehicleData.speed.length === 4) {
                return {
                    fontSize: "1.3vw"
                };
            }
            return {};
          },

          openColoris: function () {
            Coloris({
                theme: "polaroid",
                themeMode: "dark",
                alpha: false,
                formatToggle: false
            });
        },
    },

    watch: {
    
    },

    beforeDestroy() {
        if (this.Playlist.timer) {
          clearTimeout(this.Playlist.timer);
        }
      
        if (this.notifyData.bool) {
          setTimeout(() => {
            this.notifyData.bool = false;
            this.notifyData.text = 'Notification';
          }, 5000); 
        }
      
        window.removeEventListener('keyup', this.onKeyUp);
      },
      
    mounted() {
        this.MakeElementDraggable('.dragItem')
        if (this.notifyData.bool) {
          setTimeout(() => {
            this.notifyData.bool = false;
            this.notifyData.text = 'Notification';
          }, 5000);
        }
        this.watchSongProgress();
        this.VehicleData.speed = "180";
        const savedValue = localStorage.getItem('soundOpen');
        if (savedValue !== null) {
          this.soundOpen = JSON.parse(savedValue);
        }
        const savedPosValue = localStorage.getItem('CarPlayPoss');
        console.log(savedPosValue)
        if (savedPosValue !== null) {
            this.carPlayPosition = JSON.parse(savedPosValue);
        } else {
            const defaultPosition = {
                left: null,
                top: null,
            };
            localStorage.setItem('CarPlayPoss', JSON.stringify(defaultPosition));
        }
        
        this.updateCurrentTime();
        this.timer = setInterval(this.updateCurrentTime, 60000);
        window.addEventListener("message", event => {
            window.addEventListener('keyup', this.onKeyUp);
            switch (event.data.message) {
              
                case "OPEN_CARPLAY":
                   
                    this.Show = true;
                    console.log("geldi "+ this.Show)
                    this.VehicleData.gearN = event.data.VehicleData.gearN;
                    this.VehicleData.gear = event.data.VehicleData.gear;
                    this.VehicleData.speed = event.data.VehicleData.speed;
                    this.VehicleData.fuel = event.data.VehicleData.fuel;
                    this.VehicleData.nosLevel = event.data.VehicleData.nosLevel;
                    this.VehicleData.broken = !event.data.VehicleData.broken;
                    this.VehicleData.light = event.data.VehicleData.light;
                    this.VehicleData.belt = event.data.VehicleData.belt;
                    this.VehicleData.NeonBool = event.data.VehicleData.NeonBool;
                    this.VehicleData.LeftSignal = event.data.VehicleData.LeftSignal;
                    this.VehicleData.RightSignal = event.data.VehicleData.RightSignal;
                    this.VehicleData.LongLight = event.data.VehicleData.LongLight;
                    this.VehicleData.ShortLight = event.data.VehicleData.ShortLight;
                    this.VehicleData.doors = event.data.VehicleData.doors;
                    this.VehicleData.windows = event.data.VehicleData.windows;
                    this.VehicleData.Zone = event.data.VehicleData.Zone;
                    this.VehicleData.Street = event.data.VehicleData.Street;
                    this.Playlist.OtherPlayer = false
                    this.Playlist.OtherPlayerID = null
                    if (this.SecilenMode == 'dinamik') {
                        this.time = event.data.SetsecilenMode
                    }
            
                    this.playerdata.name = event.data.playerdata.name;
                    this.playerdata.avatar = event.data.playerdata.avatar || './img/profilepicture.png';
                    if (event.data.musicData) {
                        this.PlayerPlaylist = JSON.parse(event.data.musicData);
                    }

                    postNUI("SETTING_VEHICLE", {
                        page : "passengerAccess",
                        passengerAccess : this.passengerAccess,
                    });
                break;
                case "CLOSE_CARPLAY":
                    this.Show = false
                break;
                case "OPEN_CARPLAY_OTHER":
                    this.Show = true;
                    console.log("geldi "+ this.Show)
                    this.VehicleData.gearN = event.data.VehicleData.gearN;
                    this.VehicleData.gear = event.data.VehicleData.gear;
                    this.VehicleData.speed = event.data.VehicleData.speed;
                    this.VehicleData.fuel = event.data.VehicleData.fuel;
                    this.VehicleData.nosLevel = event.data.VehicleData.nosLevel;
                    this.VehicleData.broken = !event.data.VehicleData.broken;
                    this.VehicleData.light = event.data.VehicleData.light;
                    this.VehicleData.belt = event.data.VehicleData.belt;
                    this.VehicleData.NeonBool = event.data.VehicleData.NeonBool;
                    this.VehicleData.LeftSignal = event.data.VehicleData.LeftSignal;
                    this.VehicleData.RightSignal = event.data.VehicleData.RightSignal;
                    this.VehicleData.LongLight = event.data.VehicleData.LongLight;
                    this.VehicleData.ShortLight = event.data.VehicleData.ShortLight;
                    this.VehicleData.doors = event.data.VehicleData.doors;
                    this.VehicleData.windows = event.data.VehicleData.windows;
                    this.VehicleData.Zone = event.data.VehicleData.Zone;
                    this.VehicleData.Street = event.data.VehicleData.Street;
                    this.Playlist.OtherPlayer = false
                    this.Playlist.OtherPlayerID = null
                    if (this.SecilenMode == 'dinamik') {
                        this.time = event.data.SetsecilenMode
                    }
            
                    this.playerdata.name = event.data.playerdata.name;
                    this.playerdata.avatar = event.data.playerdata.avatar || './img/profilepicture.png';
                    if (event.data.musicData) {
                        this.PlayerPlaylist = JSON.parse(event.data.musicData);
                    }
                break
                case "Change_Vehicle_Image":
                    this.VehicleData.image = event.data.image
                break;
                case "SET_MUSIC_DATA":
                    this.Playlist.Playingsong.currentTime = event.data.musicData.currentTime;
                    this.Playlist.Playingsong.maxDuration = event.data.musicData.maxDuration
                    this.Playlist.Playingsong.nextSong = event.data.nextSong
                    if (event.data.nextSong) {
                        this.onSongEnded(); 
                    }
                break;
                case "SET_MUSIC_DATA_OTHER":
                    this.OtherPlayerPlaying(event.data.musicData)
                    this.Playlist.OtherPlayerID = event.data.musicOwner
                    console.log(event.data.musicOwner)
                    this.Playlist.OtherPlayer = true;
                break;
                case "SET_MUSIC_DATA_OTHERID":
                    console.log(event.data.musicOwner)
                    this.Playlist.OtherPlayerID = event.data.musicOwner
                    this.Playlist.OtherPlayer = true;
                break;
                case "SET_MUSIC_EQUALTLE":
                    this.PlayerPlayingEqualtle(event.data.data, event.data.url)
                break
                case "Change_Vehicle_Data" :
                    if (this.Show) {
                        this.VehicleData.gearN = event.data.VehicleData.gearN;
                        this.VehicleData.gear = event.data.VehicleData.gear;
                        this.VehicleData.speed = event.data.VehicleData.speed;
                        this.VehicleData.fuel = event.data.VehicleData.fuel;
                        this.VehicleData.nosLevel = event.data.VehicleData.nosLevel;
                        this.VehicleData.broken = !event.data.VehicleData.broken;
                        this.VehicleData.light = event.data.VehicleData.light;
                        this.VehicleData.belt = event.data.VehicleData.belt;
                        this.VehicleData.NeonBool = event.data.VehicleData.NeonBool;
                        this.VehicleData.LeftSignal = event.data.VehicleData.LeftSignal;
                        this.VehicleData.RightSignal = event.data.VehicleData.RightSignal;
                        this.VehicleData.LongLight = event.data.VehicleData.LongLight;
                        this.VehicleData.doors = event.data.VehicleData.doors;
                        this.VehicleData.windows = event.data.VehicleData.windows;
                        this.VehicleData.Zone = event.data.VehicleData.Zone;
                        this.VehicleData.Street = event.data.VehicleData.Street;

                        if (this.SecilenMode == 'dinamik') {
                            this.time = event.data.SetsecilenMode
                        }
                    }
                break;
            }   
        });
        
    },
    
    destroyed() {
        clearInterval(this.Playlist.timer);
    },
});

app.use(store).mount("#app");

const resourceName = window.GetParentResourceName ? window.GetParentResourceName() : "m-carplay";

window.postNUI = async (name, data) => {
    try {
        const response = await fetch(`https://${resourceName}/${name}`, {
            method: "POST",
            mode: "cors",
            cache: "no-cache",
            credentials: "same-origin",
            headers: {
                "Content-Type": "application/json"
            },
            redirect: "follow",
            referrerPolicy: "no-referrer",
            body: JSON.stringify(data)
        });
        return !response.ok ? null : response.json();
    } catch (error) {
        // console.log(error)
    }
};


function hexToRgb(hex) {
    hex = hex.replace(/^#/, "");

    // Parse r, g, b values
    let bigint = parseInt(hex, 16);
    let r = (bigint >> 16) & 255;
    let g = (bigint >> 8) & 255;
    let b = bigint & 255;

    return [r, g, b];
}
