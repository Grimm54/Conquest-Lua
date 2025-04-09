------------------------
-- Fichier LUA | LIBS --
------------------------
require("Src/Menu/require")
requireAll()

---------------------
-- SETTINGS SCREEN --
---------------------
love.window.setFullscreen(true, "desktop")
love.graphics.setDefaultFilter("nearest", "nearest")

---------------
-- LOVE LOAD --
---------------
function love.load()
    player:load()

    -- MUSIQUE PLAY THEME --
    sounds.music:setVolume(0.1)
    sounds.music:play()
    sounds.music:setLooping(true)
end

-----------------
-- LOVE UPDATE --
-----------------
function love.update(dt)
    UpdateAll(dt)

    cam:lookAt(player.x, player.y)

    -- BLOCK CAM Bordure HAUT & GAUCHE --
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    -- BLOCK CAM Bordure BAS & DROITE --
    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight
    -- HAUT --
    if cam.x < (w / 2) / 2 then
        cam.x = (w / 2) / 2
    end
    -- GAUCHE --
    if cam.y < (h / 2) / 2 then
        cam.y = (h / 2) / 2
    end
    -- DROITE --
    if cam.x > (mapW - w / 4) then
        cam.x = (mapW - w / 4)
    end
    -- BAS --
    if cam.y > (mapH - h / 4) then
        cam.y = (mapH - h / 4)
    end
end

---------------
-- LOVE DRAW --
---------------
function love.draw()
    cam:attach()
    gameMap:drawLayer(gameMap.layers["Sol"])
    gameMap:drawLayer(gameMap.layers["Players"])
    gameMap:drawLayer(gameMap.layers["Plant"])
    gameMap:drawLayer(gameMap.layers["Mur"])
    gameMap:drawLayer(gameMap.layers["Tree"])
    player:draw()
    cam:detach()
end
