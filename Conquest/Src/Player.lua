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
    x = 400,
    y = 200,

}
-----------------
-- LOAD PLAYER --
-----------------
function player:load()
    cam = camera(self.x, self.y, 3)

    self.grid32 = anim8.newGrid(32, 32, sprites.player:getWidth(), sprites.player:getHeight())

    self.animations = {}
    self.animations.stop = anim8.newAnimation(self.grid32("1-13", 1), 0.15)
    self.animations.runL = anim8.newAnimation(self.grid32("1-7", 2), 0.1)
    self.animations.runR = anim8.newAnimation(self.grid32("9-15", 2), 0.1)
    self.animations.runT = anim8.newAnimation(self.grid32("1-8", 12), 0.1)
    self.animations.jump = anim8.newAnimation(self.grid32("2-6", 6), 0.1)
    self.animations.spell = anim8.newAnimation(self.grid32("1-6", 11), 0.1)
    self.animations.roulade = anim8.newAnimation(self.grid32("2-5", 13), 0.1)

    self.animations.freeze = anim8.newAnimation(self.grid32("2-2", 15), 0.1)

    self.anim = self.animations.run
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
    self.anim:draw(sprites.player, self.x, self.y, nil, 1.5, nil, 10, 10)
end

--------------------------
-- PLAYER FUNCTION LIST --
--------------------------

------------------------------------
-- DEPLACEMENT PLAYER + ANIMATION --
------------------------------------
function player:getX(X)
    X = self.x
end
function player:setY(Y)
    Y = self.y
end
function player:getPosition()
    return {x = self.x, y = self.y}
end

function player:move(dt)
    local isMoving = false
    local K = love.keyboard

    if K.isDown("q") then
        self.x = self.x - self.speed
        self.anim = self.animations.runR
        isMoving = true
    end
    if K.isDown("d") then
        self.x = self.x + self.speed
        self.anim = self.animations.runL
        isMoving = true
    end

    if K.isDown("z") then
        self.y = self.y - self.speed
        self.anim = self.animations.runT
        isMoving = true
    end

    if K.isDown("s") then
        self.y = self.y + self.speed
        self.anim = self.animations.runR
        isMoving = true
    end

    if K.isDown("space") then
        self.anim = self.animations.jump
        isMoving = true
    end

    if K.isDown("lshift") then
        self.anim = self.animations.roulade
        isMoving = true
    end

    if isMoving == false then
        self.anim = self.animations.stop
    end
    if K.isDown("q") and K.isDown("d") then
        self.anim = self.animations.stop
    end
    if K.isDown("z") and K.isDown("s") then
        self.anim = self.animations.stop
    end

    if K.isDown("e") or K.isDown("a") then
        self.anim = self.animations.spell
        sounds.environments.blip:setVolume(0.1)
        sounds.environments.blip:play()
        isMoving = true
    end
    self.anim:update(dt)
end

return player
