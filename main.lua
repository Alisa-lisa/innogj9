background = nil
clicked = true

function love.load()
	love.window.setMode(800, 600)
	bg1 = love.graphics.newImage("Background1.png")
	bg2 = love.graphics.newImage("Background2.png")
	smile = love.graphics.newImage("smile.png")
	love.graphics.setColor(255,255,255,255)
	background = bg1
end

function love.update(dt)
	-- test function implementing click events. Change background image on click event
	
end

function love.mousepressed(x,y,button)
	if button == 'l' and not clicked then
		background = bg2
		imgx = x
		imgy = y
		clicked = true
	elseif button == 'l' and clicked then
		background = bg1
		imgx = x
		imgy = y
		clicked = false
	end
end

function love.draw()
	love.graphics.draw(background)
	-- draw images in a row to present a choise lter on draw figure from a list to a position
	for i=0, 4, 1 do
		love.graphics.draw(smile, 120 + 120 * i, 450)
	end
	-- love.graphics.print(tostring(clicked), 100, 200)
end