background = nil
clicked = false
stage = 0
-- 1 - unicornism, 2-jedism,3-pastafari,4-blackholism, 0 - clicking unsupported position
religions = {1,2,3,4}
-- coefficients = {birth:0.16, school:0.6, newyear:0.4, 16th:0.3, haloween:0.18, uni:0.7, marriage:0.5, job:0.75, funerals:1}
stages = {0, 1, 2, 3, 4, 5}
coefficients = {[1] = {0.16}, [2] = {0.6}, [3] = {0.7}, [4] = {0.5}}
final_score = {}
result = {}


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
    icon1 = nil
    icon2 = nil
    icon3 = nil
    icon4 = nil
    -- load item icons
    birth1 = love.graphics.newImage("birth_unicorn.png")
    birth2 = love.graphics.newImage("birth_jedi.png")
    birth3 = love.graphics.newImage("birth_pasta.png")
    birth4 = love.graphics.newImage("birth_blackh.png")

    school1 = love.graphics.newImage("school_unicorn.png")
    school2 = love.graphics.newImage("school_jedi.png")
    school3 = love.graphics.newImage("school_pasta.png")
    school4 = love.graphics.newImage("school_blackh.png")

    uni1 = love.graphics.newImage("smile.png")
    uni2 = love.graphics.newImage("uni_jedi.png")
    uni3 = love.graphics.newImage("uni_pasta.png")
    uni4 = love.graphics.newImage("uni_blackh.png")

    funeral1 = love.graphics.newImage("funeral1.png")
    funeral2 = love.graphics.newImage("death_jedi.png")
    funeral3 = love.graphics.newImage("funeral3.png")
    funeral4 = love.graphics.newImage("death_blackh.png")

    -- heaven_unicornism = love.graphics.newImage("funeral1.png")
    -- heaven_unicornism = love.graphics.newImage("funeral1.png")
    -- heaven_unicornism = love.graphics.newImage("funeral1.png")
    heaven_blackholism = love.graphics.newImage("BlackholismHeaven.png")

    -- current values of the religions
    valueUnicorn = 0
    valuePasta = 0
    valueJedi = 0
    valueBlackhole = 0

end

function love.update(dt)
	-- test function implementing click events. Change background image on click event
	
end

-- check whether certain item was clicked
local function onItem(x, y)
    item = 0
    if y >= 470 and y < 570 then
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

local function sumUpValues()
	-- create list of final values
	table.insert(result, valueUnicorn)
	table.insert(result, valuePasta)
	table.insert(result, valueJedi)
	table.insert(result, valueBlackhole)
	res_value = math.max(unpack(result))
	if res_value == valueUnicorn then
		res_name = "Unicornism"
	elseif res_value == valuePasta then
	    res_name = "Pastafarai"
	elseif res_value == valueJedi then
	    res_name = "Jedism"
	elseif res_value == valueBlackhole then
	    res_name = "Balckholism"
	end
end

-- function for adding values to religion after item was selected
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



function love.mousepressed(x,y,button)
    if button == 'l' then
        selectedItem = onItem(x,y)
        -- satrt the game load the first background
        if stage == 0 then
            stage = 1
            background = bgBirth
            icon1 = birth1
            icon2 = birth2
            icon3 = birth3
            icon4 = birth4
        -- choose item for the first stage
        elseif stage == 1 and selectedItem ~= 0 and clicked then
            addValueToReligion(selectedItem, 0.2)
            stage = 2
            background = bgSchool
            icon1 = school1
            icon2 = school2
            icon3 = school3
            icon4 = school4
        elseif stage == 2 and selectedItem ~= 0 and clicked then
            addValueToReligion(selectedItem, 0.6)
            stage = 3
            background = bgUni
            icon1 = uni1
            icon2 = uni2
            icon3 = uni3
            icon4 = uni4
        elseif stage == 3 and selectedItem ~= 0 and clicked then
            addValueToReligion(selectedItem, 0.4)
            stage = 4
            background = bgFuneral
            icon1 = funeral1
            icon2 = funeral2
            icon3 = funeral3
            icon4 = funeral4
        elseif stage == 4 and selectedItem ~= 0 and clicked then
            addValueToReligion(selectedItem, 0.9)
            background = bg1
            stage = 5
            icon1 = smile
            icon2 = smile
            icon3 = smile
            icon4 = smile
        	sumUpValues()
        elseif stage == 5 and clicked then
        	if res_name == "Balckholism" then
        		background = heaven_blackholism
        	elseif res_name == "Pastafarian" then
        		background = bg2
        	elseif res_name == "Unicornism" then
        		background = bg2
        	elseif res_name == "Jedismus" then
        		background = bg2
        	end

    	end
    end

end

function love.draw()
	if stage == 0 then 
		love.graphics.draw(background)
		love.graphics.print("choose rituals and items carefully", 350, 50)
	elseif stage < 5 then
		love.graphics.draw(background)
	    love.graphics.draw(icon1, 100, 470)
	    love.graphics.draw(icon2, 300, 470)
	    love.graphics.draw(icon3, 500, 470)
	    love.graphics.draw(icon4, 700, 470)

	    love.graphics.print("selected item", 100, 190)
		love.graphics.print(tostring(item), 270, 190)

	    -- current religion values
		love.graphics.print("final score ist", 100, 200)

		love.graphics.print("unicorn", 100, 220)
		love.graphics.print(tostring(valueUnicorn), 180, 220)
		love.graphics.print("pasta", 100, 240)
		love.graphics.print(tostring(valuePasta), 180, 240)
		love.graphics.print("jedi", 100, 260)
		love.graphics.print(tostring(valueJedi), 180, 260)
		love.graphics.print("blackhole", 100, 280)
		love.graphics.print(tostring(valueBlackhole), 180, 280)
	elseif stage == 5 then
		love.graphics.draw(background)
	    love.graphics.print(tostring(res_name), 100, 280)
		love.graphics.print(tostring(res_value), 180, 300)
	-- draw final scenario
	elseif stage == 6 then
		love.graphics.draw(background)
	end 

    --debug strings
end