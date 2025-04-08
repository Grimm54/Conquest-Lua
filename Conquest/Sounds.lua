sounds = {
    blip = love.audio.newSource("Assets/Sounds/FX/blip.wav", "static"),
    music = love.audio.newSource("Assets/Sounds/Theme/music.mp3", "stream")
}

return sounds.music:setLooping(true)
