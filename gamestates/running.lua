local bump = require 'libs.bump.bump'
local Gamestate = require 'libs.hump.gamestate'
local Class = require 'libs.hump.class'
local sti = require 'libs.sti.sti'
local Entities = require 'entities.Entities'

local GameLoop = Class{
  __includes = Gamestate,
  init = function(self)
    self.world = bump.newWorld(32)
  end;
  Entities = Entities;
}
    

function GameLoop:keypressed(key)
  if Gamestate.current() ~= pause and key == 'p' then
    Gamestate.push(pause)
  end
end

function GameLoop:loadLevel(mapFile)
    self.map = sti(mapFile, { 'bump' })
	self.map:resize(love.graphics.getWidth(), love.graphics.getHeight())
    self.map:bump_init(self.world)
    self.Entities:enter()
end

return GameLoop

