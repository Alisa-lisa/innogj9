background = nil
clicked = false
stage = 0
-- 1 - unicornism, 2-pastafarai,3-jedism,4-blackholism, 0 - clicking unsupported position
religions = {1,2,3,4}

local function onItem(x, y)
    if y >= 400 and y < 500 then
        if x >= 100 and x < 200 then
            item = 1
            clicked = true
        elseif x >= 300 and x < 400 then
            item = 2
            clicked = true
        elseif x >= 500 and x < 600 then
            item = 3
            clicked = true
        elseif x >= 700 and x < 800 then
            item = 4
            clicked = true
        end
    else
    	item = 0
    end
    return item
end

function love.load()
    love.window.setMode(900, 600)
    bg1 = love.graphics.newImage("Background1.png")
    bg2 = love.graphics.newImage("Background2.png")
    bgBirth = love.graphics.newImage("BirthBackground.png")
    bgSchool = love.graphics.newImage("SchoolBackground.png")
    bgUni = love.graphics.newImage("UniversityBackground.png")
    smile = love.graphics.newImage("smile.png")
    love.graphics.setColor(255,255,255,255)
    background = bg1
end

function love.update(dt)
	-- test function implementing click events. Change background image on click event
	
end

function love.mousepressed(x,y,button)
    if button == 'l' then
        -- satrt the game load the first background
        if stage == 0 then
            stage = 1
            background = bgBirth
        -- choose item for the first stage
        elseif stage == 1 and onItem(x,y) ~= 5 and clicked then
            stage = 2
            background = bgSchool
        elseif stage == 2 and onItem(x,y) ~= 5 and clicked then
            stage = 3
            background = bgUni
        -- elseif stage == 2 then
        --     background = bgSchool
        --     stage = 3
        end
    end
    -- if  and not clicked and onItem(x, y) ~= nil  then
    --     background = bg2
    --     imgx = x
    --     imgy = y
    --     clicked = true
    -- elseif button == 'l' and clicked and onItem(x, y) ~= nil then
    --     background = bg1
    --     imgx = x
    --     imgy = y
    --     clicked = false
    -- end
end

function love.draw()
	love.graphics.draw(background)
	-- draw images in a row to present a choise lter on draw figure from a list to a position
	for i=0, 3, 1 do
		love.graphics.draw(smile, 100 + 200 * i, 400)
	end
	love.graphics.print(tostring(item), 100, 200)
end