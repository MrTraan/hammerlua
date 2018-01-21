debug = true -- Add a quick flag to handle our development process.  Set to false before packaging

-- Pull in the Bump library
bump = require 'libs.bump.bump'

-- Pull in Gamestate from the HUMP library
Gamestate = require 'libs.hump.gamestate'

local GameLoop = require 'gamestates.running'

function love.load()
  GameLoop:loadLevel("./assets/background.png")
  Gamestate.registerEvents()
  Gamestate.switch(GameLoop)
  love.window.setMode(420, 520, {resizable=false, vsync=false})
end

function love.keypressed(key)
  if debug and key == "escape" then
		love.event.push("quit")
	end
end
