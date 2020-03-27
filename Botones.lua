--[=[
   SIMPLE LIBRARY TO SIMUL BUTTONS
   ********************************
   mhliebano@gmail.com
   github: mhliebano
   
   Paramaters
    px:position x in screen
    py:position y in screen
    ww: width button
    hh: height button
    
    properties:
        x: set / get position x in screen
        y: set / get position y in screen
        w: set / get width button
        y: set / get heigth button
        enabled: set / get if button is enabled o not (true or false)
        tag: variant tag for programmer
        group: table of group buttons
        
    methods:
        draw(): draw a square in screen (only reference) [optional]
        drawGroup(): draw a group in screen (only reference) [optional]
        click(): perform a action on event click (return true if click inside button)
        clickGroup(): perform a action on event click (return number button and tag if click inside button)
]=]

function Boton(px,py,ww,hh)
    local btn={x=px,y=py,w=ww,h=hh}
    btn.group={}
    btn.enabled=true
    btn.tag=""
    btn.draw=function()
        if btn.enabled then
            love.graphics.setColor(0,255,0)
        else
            love.graphics.setColor(255,0,0)
        end
        love.graphics.rectangle("line",btn.x,btn.y,btn.w,btn.h)
        love.graphics.setColor(255,255,255)
    end
    btn.drawGroup=function()
        for i,b in ipairs(btn.group) do
            if b.enabled then
                love.graphics.setColor(0,255,0)
            else
                love.graphics.setColor(255,0,0)
            end
            love.graphics.rectangle("line",b.x,b.y,b.w,b.h)
            love.graphics.setColor(255,255,255)
        end
    end
    btn.groupClick=function()
        local x,y=love.mouse.getPosition()
        for i,b in ipairs(btn.group) do
            if x>=b.x*sx and x<=b.x*sx+b.w*sx and y>=b.y*sy and y<=b.y*sy+b.h*sy then
                return i,btn.group[i].tag
            end
        end
    end
    btn.click=function(presionado)
        local x,y= love.mouse.getPosition()
        local p=false
        if presionado then
            p=true
        end
        if btn.enabled then
            if x>=btn.x*sx and x<=btn.x*sx+btn.w*sx and y>=btn.y*sy and y<=btn.y*sy+btn.h*sy then
                if p then
                    if love.mouse.isDown(1) then
                        return true
                    else
                        return false
                    end
                else
                    return true
                end
            else
                return false
            end
        end
    end
    return btn
end
