
local shaders = require "shaders"
local utils = require "utils"
local draw = require "draw"

local data = {
	pose = lovr.math.newMat4(),
	rotSpeed = 2 * math.pi / 6
}

function lovr.conf(t)
end

function lovr.load()
end

function lovr.update(dt)
	if lovr.headset.isTracked('right') then
		local x, y = lovr.headset.getAxis('right', 'thumbstick')
		data.pose:rotate(-x * data.rotSpeed * dt, 0, 1, 0)
	end
	if lovr.headset.isTracked('left') then
		local x, y = lovr.headset.getAxis('left', 'thumbstick')
	end
end

function lovr.draw()	

	lovr.graphics.transform(mat4(data.pose):invert())

	draw.floor_grid()

	draw.marker(vec3(4,0,4), 0xff0000, 0.5)
	draw.marker(vec3(-4,0,-4), 0x00ff00, 0.5)
	draw.marker(vec3(-4,0,4), 0x0000ff, 0.5)
	draw.marker(vec3(4,0,-4), 0xff00ff, 0.5)

	draw.axis(vec3(0,0,0))

end
