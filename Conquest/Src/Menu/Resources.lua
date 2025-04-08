sprites = {}
--sprites.playerSheet = love.graphics.newImage('sprites/player/playerSheet1.png')
--sprites.playerShadow = love.graphics.newImage('sprites/player/playerShadow.png')
sprites.effects = {}
--sprites.effects.darkness = love.graphics.newImage('sprites/effects/darkness-wide.png')
--sprites.effects.explosion = love.graphics.newImage('sprites/effects/explosion.png')
--sprites.effects.rock = love.graphics.newImage('sprites/effects/rock.png')
--sprites.effects.death = love.graphics.newImage('sprites/effects/death.png')
--sprites.effects.fireball = love.graphics.newImage('sprites/effects/fireball.png')
sprites.effects.blobs = {}
--sprites.effects.blobs.blob1 = love.graphics.newImage('sprites/effects/blobs/blob1.png')
--sprites.effects.blobs.blob2 = love.graphics.newImage('sprites/effects/blobs/blob2.png')
--sprites.effects.blobs.blob3 = love.graphics.newImage('sprites/effects/blobs/blob3.png')
--sprites.effects.blobs.blob4 = love.graphics.newImage('sprites/effects/blobs/blob4.png')
sprites.environment = {}
--sprites.environment.breakableRock = love.graphics.newImage('sprites/environment/breakableRock.png')
--sprites.environment.breakableWall = love.graphics.newImage('sprites/environment/breakableWall.png')
--sprites.environment.lockedDoor = love.graphics.newImage('sprites/environment/lockedDoor.png')
--sprites.environment.tree = love.graphics.newImage('sprites/environment/tree.png')
--sprites.environment.wave = love.graphics.newImage('sprites/environment/wave.png')
sprites.enemies = {}
--sprites.enemies.alert = love.graphics.newImage('sprites/enemies/alert.png')
--sprites.enemies.shadow = love.graphics.newImage('sprites/enemies/shadow.png')
--sprites.enemies.bat = love.graphics.newImage('sprites/enemies/bat.png')
--sprites.enemies.batDead = love.graphics.newImage('sprites/enemies/batDead.png')
--sprites.enemies.skeletonKnife = love.graphics.newImage('sprites/enemies/skeleton/knife2.png')
--sprites.enemies.skeletonMage = love.graphics.newImage('sprites/enemies/skeleton/mage.png')
--sprites.enemies.skeletonDead = love.graphics.newImage('sprites/enemies/skeleton/skeletonStun.png')
sprites.items = {}
--sprites.items.sword = love.graphics.newImage('sprites/items/sword.png')
--sprites.items.boomerang = love.graphics.newImage('sprites/items/boomerang.png')
--sprites.items.fire = love.graphics.newImage('sprites/items/fire-icon.png')
--sprites.items.key = love.graphics.newImage('sprites/items/key.png')
--sprites.items.coin = love.graphics.newImage('sprites/items/coin.png')
sprites.hud = {}
--sprites.hud.heart = love.graphics.newImage('sprites/ui/heart.png')
sprites.pause = {}
--sprites.pause.equipBox = love.graphics.newImage('sprites/ui/pause/equipBox.png')
--sprites.pause.itemPanel = love.graphics.newImage('sprites/ui/pause/itemPanel.png')
--sprites.pause.mouse = love.graphics.newImage('sprites/ui/pause/mouse.png')
--sprites.pause.cursor = love.graphics.newImage('sprites/ui/pause/cursor.png')
sprites.npc = {}
--sprites.npc.merchant = love.graphics.newImage('sprites/npc/merchant.png')

-- since fonts are influenced by scale, they need to be re-initialized when the scale changes
function initFonts()
    fonts = {}
    fonts.debug = love.graphics.newFont("fonts/vt323/VT323-Regular.ttf", 15 * scale)
    fonts.debug2 = love.graphics.newFont(10 * scale)
    fonts.debugSmall = love.graphics.newFont("fonts/vt323/VT323-Regular.ttf", 10 * scale)
    fonts.ammo = love.graphics.newFont("fonts/kenney-pixel-square/Kenney-Pixel-Square.ttf", 4.5 * scale)
    fonts.coins = love.graphics.newFont("fonts/kenney-pixel-square/Kenney-Pixel-Square.ttf", 6.5 * scale)
    fonts.shop = love.graphics.newFont("fonts/kenney-pixel-square/Kenney-Pixel-Square.ttf", 8)

    fonts.pause1 = love.graphics.newFont("fonts/vt323/VT323-Regular.ttf", 12 * scale)
    fonts.pause2 = love.graphics.newFont("fonts/vt323/VT323-Regular.ttf", 9 * scale)
    fonts.pauseTop = love.graphics.newFont("fonts/vt323/VT323-Regular.ttf", 10 * scale)
end
initFonts()

sounds = {}
sounds.enemies.hurt = "sounds/enemies/enemyHurt.wav"
sounds.enemies.projectile = "sounds/enemies/projectile.wav"
sounds.items = {}
sounds.player = {}
sounds.ui = {}
