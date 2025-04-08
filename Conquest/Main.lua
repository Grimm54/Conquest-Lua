-- Fichier LUA --
player = require("Src/Player")
sounds = require("Sounds")

-- LIBRARY [ANIM8 = Animation | Sti = TiledMapLoader | HUMP -> [Camera | ? ]] --
anim8 = require("Libs/anim8")
sti = require("Libs/sti")
camera = require("Libs/camera")
gameMap = sti("Src/Levels/map.lua")

-- Fixe Filtre --
cam = camera(player.x, player.y, 2)
love.graphics.setDefaultFilter("nearest", "nearest")
-- MAIN MENU

--------------------------------------------------------------
function love.load()
    -- MAIN MENU -------------------------------------

    --FPS COUNT & FullScreen
    love.window.setFullscreen(true, "desktop")
    --fps = love.timer.getFPS()
    player.spriteSheet = love.graphics.newImage("Assets/Players/Players0.png")
    --player.spriteItem = love.graphics.newImage("Assets/Item/Item0.png")
    -- Grid Pour le 32x32
    player.grid32 = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())
    -- Grid Pour le 16x16
    --player.grid16 = anim8.newGrid(16, 16, player.spriteItem:getWidth(), player.spriteItem:getHeight())

    player.animations = {}
    player.animations.stop = anim8.newAnimation(player.grid32("1-13", 1), 0.15)
    player.animations.run = anim8.newAnimation(player.grid32("1-7", 2), 0.1)
    player.animations.jump = anim8.newAnimation(player.grid32("2-6", 6), 0.1)
    player.animations.spell = anim8.newAnimation(player.grid32("1-6", 11), 0.1)
    player.animations.roulade = anim8.newAnimation(player.grid32("2-5", 13), 0.1)

    player.animations.freeze = anim8.newAnimation(player.grid32("2-2", 15), 0.1)

    player.anim = player.animations.run

    --MUSIQUE PLAY THEME
    sounds.music:setVolume(0.1)
    sounds.music:play()
    sounds.music:setLooping(true)
end

function love.update(dt)
    -- Settings Joueurs Deplacements -> A Deplacer dans player.lua
    local isMoving = false

    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed
        player.anim = player.animations.run
        isMoving = true
    end

    if love.keyboard.isDown("q") then
        player.x = player.x - player.speed
        player.anim = player.animations.run
        isMoving = true
    end

    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed
        player.anim = player.animations.run
        isMoving = true
    end

    if love.keyboard.isDown("z") then
        player.y = player.y - player.speed
        player.anim = player.animations.run
        isMoving = true
    end

    if love.keyboard.isDown("space") then
        player.anim = player.animations.jump
        isMoving = true
    end

    if love.keyboard.isDown("lshift") then
        player.anim = player.animations.roulade
        isMoving = true
    end
    -- Settings Joueurs Attaque -> A Deplacer dans player.lua

    if love.keyboard.isDown("e") or love.keyboard.isDown("a") then
        player.anim = player.animations.spell
        sounds.blip:setVolume(0.1)
        sounds.blip:play()
        isMoving = true
    end
    if love.keyboard.isDown(("escape")) then
        love.event.quit()
    end
    -- Settings Joueurs Zoom
    if love.keyboard.isDown("c") then
        love.graphics.print("TEST", player.x, player.y)
    end
    -- Verification Action Joueurs False -> Jouer Animations Stop

    if isMoving == false then
        player.anim = player.animations.stop
    end

    player.anim:update(dt)

    cam:lookAt(player.x, player.y)

    -- BLOCK LA CAM Bordure HAUT & GAUCHE
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    -- BLOCK LA CAM Bordure BAS & DROITE
    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight
    -- HAUT
    if cam.x < (w / 2) / 2 then
        cam.x = (w / 2) / 2
    end
    -- GAUCHE
    if cam.y < (h / 2) / 2 then
        cam.y = (h / 2) / 2
    end
    -- DROITE
    if cam.x > (mapW - w / 4) then
        cam.x = (mapW - w / 4)
    end
    -- BAS
    if cam.y > (mapH - h / 4) then
        cam.y = (mapH - h / 4)
    end
end

function love.draw()
    --MAIN MENU
    --FPS AFFCIHAGE

    --CAMERA ATTACHEMENTS

    cam:attach()
    gameMap:drawLayer(gameMap.layers["Sol"])
    gameMap:drawLayer(gameMap.layers["Players"])
    gameMap:drawLayer(gameMap.layers["Plant"])
    gameMap:drawLayer(gameMap.layers["Mur"])
    gameMap:drawLayer(gameMap.layers["Tree"])
    player.anim:draw(player.spriteSheet, player.x, player.y, nil, 1.5, nil, 10, 10)
    cam:detach()
end
