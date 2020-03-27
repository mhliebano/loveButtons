require "Botones"
function love.load()
    --mandatory variables, to determine the screen scaling factor
    sx = 1 
    sy = 1 
    --the button posX,posY,width,heigth
    myButton=Boton(50,150,150,50)
    
    --group buttons
    btnGroup=Boton(0,0,0,0)
    for i=1,10 do
        local b =Boton((i*60)+10,30,50,50)
        table.insert(btnGroup.group,b)
        print (b.x)
    end
    btpr=""
end

function love.update(dt)

end

function love.draw()
    love.graphics.print(btpr,70,90)
    --is optional only for reference and visualization 
    myButton.draw()
    
    --draw group button
    btnGroup.drawGroup()
    love.graphics.print("Click on buttons line green",350,570)
end

function love.mousereleased(x,y,b)
    --onclick button your action
    if myButton.click() then
        myButton.x=math.random(10,600)
        myButton.y=math.random(150,550)
    end
    local btnPressed,tag=btnGroup.groupClick()
    if btnPressed~=nil then
        btpr=" Clicked in button "..btnPressed
    end
    
    
end
