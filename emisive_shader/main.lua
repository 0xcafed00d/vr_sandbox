
local shaders = require "shaders"
local utils = require "utils"
local draw = require "draw"

local data = {
}

function lovr.conf(t)
end

function lovr.load()
	data.time = 0

	lovr.graphics.setCullingEnabled(true)

	shaders.emissive_shader:send('liteColor', {0.9, 0.9, 0.9, 1.0})
    shaders.emissive_shader:send('ambience', {0.02, 0.02, 0.02, 1.0})
    shaders.emissive_shader:send('specularStrength', 1.0)
    shaders.emissive_shader:send('metallic', 64.0)
	shaders.emissive_shader:send('lightPos', {0.0, 5.0, 0.0})

	data.drone = lovr.graphics.newModel("assets/drone.obj")
	-- obj loader doesnt only loads diffuse texture so emissive texture needs to be added to the
	-- material manually.
	local emisive_texture = lovr.graphics.newTexture("assets/PolygonSciFiSpace_Emissive_01.png")
	data.drone:getMaterial(1):setTexture("emissive", emisive_texture)
end



function lovr.update(dt)
	data.time = data.time + dt

	local color = math.sin(data.time*4) / 4.0 + 0.75
    shaders.emissive_shader:send('emissiveColor', {color, color, color, 1.0})

	-- Adjust head position (for shaders)
	if lovr.headset then 
		local hx, hy, hz = lovr.headset.getPosition()
		shaders.emissive_shader:send('viewPos', { hx, hy, hz } )
		shaders.glow_shader:send('viewPos', { hx, hy, hz } )
	end
end

function lovr.draw()	

	draw.floor_grid()

	draw.marker(vec3(4,0,4), 0xff0000, 0.5)
	draw.marker(vec3(-4,0,-4), 0x00ff00, 0.5)
	draw.marker(vec3(-4,0,4), 0x0000ff, 0.5)
	draw.marker(vec3(4,0,-4), 0xff00ff, 0.5)

	draw.axis(vec3(0,0,0))

	lovr.graphics.setShader(shaders.emissive_shader)
	lovr.graphics.setColor(0xffffff)
	data.drone:draw(mat4():translate(0, 1, 0):scale(0.5))
	lovr.graphics.setShader()

end
