anim8 = require("Libs/anim8")
camera = require("Libs/camera")

------------------
-- TABLE PLAYER --
------------------
local player = {
    name = "Grimm",
    heal = 100,
    mana = 250,
    hungry = 500,
    shield = 10,
    speed = 0.2,
    spriteSheet = love.graphics.newImage("Assets/Players/Players0.png"),
    x = 400,
    y = 200
}

-----------------
-- LOAD PLAYER --
-----------------
function player:load()
    cam = camera(self.x, self.y, 2)

    self.spriteSheet = love.graphics.newImage("Assets/Players/Players0.png")

    self.grid32 = anim8.newGrid(32, 32, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())

    self.animations = {}
    self.animations.stop = anim8.newAnimation(self.grid32("1-13", 1), 0.15)
    self.animations.run = anim8.newAnimation(self.grid32("1-7", 2), 0.1)
    self.animations.jump = anim8.newAnimation(self.grid32("2-6", 6), 0.1)
    self.animations.spell = anim8.newAnimation(self.grid32("1-6", 11), 0.1)
    self.animations.roulade = anim8.newAnimation(self.grid32("2-5", 13), 0.1)

    self.animations.freeze = anim8.newAnimation(self.grid32("2-2", 15), 0.1)

    self.anim = self.animations.run

    cam = camera(self.x, self.y, 2)
end

-------------------
-- UPDATE PLAYER --
-------------------
function player:update(dt)
    player:move(dt)
end

-----------------
-- DRAW PLAYER --
-----------------
function player:draw()
    self.anim:draw(self.spriteSheet, self.x, self.y, nil, 1.5, nil, 10, 10)
end

--------------------------
-- PLAYER FUNCTION LIST --
--------------------------

------------------------------------
-- DEPLACEMENT PLAYER + ANIMATION --
------------------------------------
function player:move(dt)
    local isMoving = false

    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed
        player.anim = player.animations.run
        isMoving = true
    end

    if love.keyboard.isDown("q") then
        self.x = self.x - self.speed
        self.anim = self.animations.run
        isMoving = true
    end

    if love.keyboard.isDown("s") then
        self.y = self.y + self.speed
        self.anim = self.animations.run
        isMoving = true
    end

    if love.keyboard.isDown("z") then
        self.y = self.y - self.speed
        self.anim = self.animations.run
        isMoving = true
    end

    if love.keyboard.isDown("space") then
        self.anim = self.animations.jump
        isMoving = true
    end

    if love.keyboard.isDown("lshift") then
        self.anim = self.animations.roulade
        isMoving = true
    end

    if love.keyboard.isDown("e") or love.keyboard.isDown("a") then
        self.anim = self.animations.spell
        sounds.blip:setVolume(0.1)
        sounds.blip:play()
        isMoving = true
    end
    if love.keyboard.isDown(("escape")) then
        love.event.quit()
    end
    -- ZOOM EN COURS
    if love.keyboard.isDown("c") then
        love.graphics.print("TEST", self.x, self.y)
    end

    if isMoving == false then
        player.anim = player.animations.stop
    end
    player.anim:update(dt)
end

return player
