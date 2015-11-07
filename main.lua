background = nil
clicked = false
stage = 0
-- 1 - unicornism, 2-pastafarai,3-jedism,4-blackholism, 0 - clicking unsupported position
religions = {1,2,3,4}

local function onItem(x, y)
    item = 0
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
    end
    return item
end

-- function for adding to religion values after item was selected
local function addValueToReligion(religion, value)
    if religion == 1 then
        valueUnicorn = valueUnicorn + value
    elseif religion == 2 then
        valuePasta = valuePasta + value
    elseif religion == 3 then
        valueJedi = valueJedi + value
    elseif religion == 4 then
        valueBlackhole = valueBlackhole + value
    end
end

function love.load()
    love.window.setMode(900, 600)
    bg1 = love.graphics.newImage("Background1.png")
    bg2 = love.graphics.newImage("Background2.png")
    bgBirth = love.graphics.newImage("BirthBackground.png")
    bgSchool = love.graphics.newImage("SchoolBackground.png")
    bgUni = love.graphics.newImage("UniversityBackground.png")
    bgFuneral = love.graphics.newImage("FuneralsBackground.png")
    smile = love.graphics.newImage("smile.png")
    love.graphics.setColor(255,255,255,255)
    background = bg1
    -- load item icons
    birth1 = love.graphics.newImage("birth1.png")
    birth2 = love.graphics.newImage("birth2.png")
    birth3 = love.graphics.newImage("birth3.png")
    birth4 = love.graphics.newImage("birth4.png")
    school1 = love.graphics.newImage("school1.png")
    school2 = love.graphics.newImage("school2.png")
    school3 = love.graphics.newImage("school3.png")
    school4 = love.graphics.newImage("school4.png")
    uni1 = love.graphics.newImage("uni1.png")
    uni2 = love.graphics.newImage("uni2.png")
    uni3 = love.graphics.newImage("uni3.png")
    uni4 = love.graphics.newImage("uni4.png")
    funeral1 = love.graphics.newImage("funeral1.png")
    funeral2 = love.graphics.newImage("funeral2.png")
    funeral3 = love.graphics.newImage("funeral3.png")
    funeral4 = love.graphics.newImage("funeral4.png")

    -- current values of the religions
    valueUnicorn = 0
    valuePasta = 0
    valueJedi = 0
    valueBlackhole = 0

end

function love.update(dt)
	-- test function implementing click events. Change background image on click event
	
end

function love.mousepressed(x,y,button)
    if button == 'l' then
        selectedItem = onItem(x,y)
        -- satrt the game load the first background
        if stage == 0 then
            stage = 1
            background = bgBirth
        -- choose item for the first stage
        elseif stage == 1 and selectedItem ~= 0 and clicked then
            addValueToReligion(selectedItem, 0.2)
            stage = 2
            background = bgSchool
        elseif stage == 2 and selectedItem ~= 0 and clicked then
            addValueToReligion(selectedItem, 0.6)
            stage = 3
            background = bgUni
        elseif stage == 3 and selectedItem ~= 0 and clicked then
            addValueToReligion(selectedItem, 0.4)
            stage = 4
            background = bgFuneral
        elseif stage == 4 and selectedItem ~= 0 and clicked then
            addValueToReligion(selectedItem, 0.9)
            stage = 5
            background = bg1
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

    --debug strings
    love.graphics.print("selected item", 100, 190)
	love.graphics.print(tostring(item), 270, 190)
    -- current religion values
    love.graphics.print("unicorn", 100, 220)
    love.graphics.print(tostring(valueUnicorn), 180, 220)
    love.graphics.print("pasta", 100, 240)
    love.graphics.print(tostring(valuePasta), 180, 240)
    love.graphics.print("jedi", 100, 260)
    love.graphics.print(tostring(valueJedi), 180, 260)
    love.graphics.print("blackhole", 100, 280)
    love.graphics.print(tostring(valueBlackhole), 180, 280)
end