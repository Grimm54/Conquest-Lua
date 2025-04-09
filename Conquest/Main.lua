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
    --love.graphics.setDefaultFilter("nearest", "nearest")
    player:load()

    -- MUSIQUE PLAY THEME --
    sounds.environments.music:setVolume(0.1)
    sounds.environments.music:play()
    sounds.environments.music:setLooping(true)
end

-----------------
-- LOVE UPDATE --
-----------------
function love.update(dt)
    if love.keyboard.isDown(("escape")) then
        love.event.quit()
    end
    UpdateAll(dt)

    cam:lookAt(player.x, player.y, 0.1)

    -- BLOCK CAM Bordure HAUT & GAUCHE --
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    -- BLOCK CAM Bordure BAS & DROITE --
    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight
    -- GAUCHE --
    if cam.x < (w / 3) / 2 then
        cam.x = (w / 3) / 2
    end
    -- HAUT --
    if cam.y < (h / 3) / 2 then
        cam.y = (h / 3) / 2
    end
    -- DROITE --
    if cam.x > (mapW - w / 6) then
        cam.x = (mapW - w / 6)
    end
    -- BAS --
    if cam.y > (mapH - h / 6) then
        cam.y = (mapH - h / 6)
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
