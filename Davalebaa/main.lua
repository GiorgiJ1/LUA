push = require 'push'
Class = require 'class'
Camera = require 'Camera'


require 'Player'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

gameState = "title"

PLAYER_SPEED = 8


function love.load()
	io.stdout:setvbuf("no")
	camera = Camera()
	
	medium_font = love.graphics.newFont('8bit_font.ttf', 8)
	love.graphics.setDefaultFilter('nearest', 'nearest')
	
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})
	
	love.graphics.setFont(medium_font)
	
	player = Player(20, 40)
	player1 = Player(80, 40)

	
end



function love.keypressed(key)
	
	if gameState == 'title' then
		if key == 'return' then
			gameState = "play"
		end
	end
	if key == 'return' then
		if key == 'return' then
			gameState = "play"
		end
	end
end

function love.update(dt)
	
	camera:update(dt)
	
	if gameState == "play" then
		if love.keyboard.isDown('w') then
			player.y = math.max(player.y - PLAYER_SPEED, 0)
		elseif  love.keyboard.isDown('s') then
			player.y = math.min(player.y + PLAYER_SPEED, VIRTUAL_HEIGHT - player.height)
		end
		
		if love.keyboard.isDown('d') then
			player.x = math.min(player.x + PLAYER_SPEED, VIRTUAL_WIDTH - player.width)
		elseif  love.keyboard.isDown('a') then
			player.x = math.max(player.x - PLAYER_SPEED, 0)
		end
		
		
		
		
		if love.keyboard.isDown('up') then
			player1.y = math.max(player1.y - PLAYER_SPEED, 0)
		elseif  love.keyboard.isDown('down') then
			player1.y = math.min(player1.y + PLAYER_SPEED, VIRTUAL_HEIGHT - player1.height)
		end
		
		if love.keyboard.isDown('right') then
			player1.x = math.min(player1.x + PLAYER_SPEED, VIRTUAL_WIDTH - player1.width)
		elseif  love.keyboard.isDown('left') then
			player1.x = math.max(player1.x - PLAYER_SPEED, 0)
		end
	end
end

function love.draw()
	push:start()
		
	love.graphics.clear(80/255, 0/255, 0/255, 255/255)
	
	if gameState == "title" then
		love.graphics.printf(
			'Press Enter to start',
			0,
			10,
			VIRTUAL_WIDTH,
			'center')
	end
	
	player:render()
	player1:render()
	
	push:finish()
end






