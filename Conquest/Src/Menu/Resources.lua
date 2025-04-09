-------------------
-- TABLE SPRITES --
-------------------
sprites = {}

--------------------------
-- TABLE SPRITES PLAYER --
--------------------------
sprites.player = love.graphics.newImage("Assets/Players/Players0.png")

--------------------------
-- TABLE SPRITES PLAYER --
--------------------------
sprites.effects = {}

---------------------------
-- TABLE SPRITES ENEMIES --
---------------------------
sprites.enemies = {}

--------------------------
-- TABLE SPRITES EVIRONEMENT --
--------------------------
sprites.environments = {}

-------------------------
-- TABLE SPRITES ITEMS --
-------------------------
sprites.items = {}

-----------------------
-- TABLE SPRITES HUD --
-----------------------
sprites.hud = {}

-------------------
-- TABLE SOUNDS  --
-------------------
sounds = {}

--------------------------
-- TABLE SOUNDS ENEMIES --
--------------------------
sounds.enemies = {}

-------------------------------
-- TABLE SOUNDS ENVIRONMENTS --
-------------------------------
sounds.environments = {}
-- SON A MODIFIER
sounds.environments.blip = love.audio.newSource("Sounds/FX/blip.wav", "static")
sounds.environments.music = love.audio.newSource("Sounds/Theme/music.mp3", "stream")

------------------------
-- TABLE SOUNDS ITEMS --
------------------------
sounds.items = {}

-------------------------
-- TABLE SOUNDS PLAYER --
-------------------------
sounds.player = {}

----------------------
-- TABLE SOUNDS HUD --
----------------------
sounds.hud = {}