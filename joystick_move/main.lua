
local shaders = require "shaders"
local utils = require "utils"
local draw = require "draw"

local data = {
}

function lovr.conf(t)
end

function lovr.load()
end

function lovr.update(dt)
end

function lovr.draw()	

	draw.floor_grid()

	draw.marker(vec3(4,0,4), 0xff0000, 0.5)
	draw.marker(vec3(-4,0,-4), 0x00ff00, 0.5)
	draw.marker(vec3(-4,0,4), 0x0000ff, 0.5)
	draw.marker(vec3(4,0,-4), 0xff00ff, 0.5)

	draw.axis(vec3(0,0,0))

end
