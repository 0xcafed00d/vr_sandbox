shaders = require("shaders")

return {

	floor_grid = function ()
		lovr.graphics.setShader(shaders.grid_shader)
		lovr.graphics.plane('fill', 0, 0, 0, 25, 25, -math.pi / 2, 1, 0, 0)
		lovr.graphics.setShader()	
	end,

	marker = function (pos_vec3, colour, diameter)	
		lovr.graphics.setColor(colour)
		lovr.graphics.sphere(pos_vec3, diameter);
	end,

	axis = function (pos)
		lovr.graphics.setColor(0xff0000)	
		lovr.graphics.box("fill", 0.5 + pos.x, 0 + pos.y, 0 + pos.z, 1, 0.01, 0.01, 0, 0, 1, 0)
		lovr.graphics.setColor(0x00ff00)	
		lovr.graphics.box("fill", 0 + pos.x, 0.5 + pos.y, 0 + pos.z, 0.01, 1, 0.01, 0, 0, 1, 0)
		lovr.graphics.setColor(0x0000ff)	
		lovr.graphics.box("fill", 0 + pos.x, 0 + pos.y, 0.5 + pos.z, 0.01, 0.01, 1, 0, 0, 1, 0)
		lovr.graphics.setColor(0xffffff)	
		lovr.graphics.cube("fill", 0 + pos.x, 0 + pos.y, 0 + pos.z, 0.1, 0, 0, 1, 0)
	end	
}
