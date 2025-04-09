------------------------
-- Fichier LUA | LIBS --
------------------------

function requireAll()
    -------------
    -- LIBRARY --
    -------------
    camera = require("Libs/camera")
    sti = require("Libs/sti")
    anim8 = require("Libs/anim8")
    gameMap = sti("Src/Levels/map.lua")
    -----------------
    -- FICHIER LUA --
    -----------------
    require("Src/Update")
    anim8 = require("Libs/anim8")
    sounds = require("Sounds")
    player = require("src/Player")
    gameMap = sti("Src/Levels/map.lua")
    require("Src/Menu/Resources")
end
