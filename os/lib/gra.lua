-- sOS Graphics Library

local gra = {}

-- currentSetColor = 15
-- currentPrintColor = 15

function gra.setColor(x)
  
  local rgb = {255, 255, 255}
  if (x == 0) then rgb = {0, 0, 0}
  elseif (x == 1) then rgb = {128, 0, 0}
  elseif (x == 2) then rgb = {0, 128, 0}
  elseif (x == 3) then rgb = {128, 128, 0}
  elseif (x == 4) then rgb = {0, 0, 128}
  elseif (x == 5) then rgb = {128, 0, 128}
  elseif (x == 6) then rgb = {0, 128, 128}
  elseif (x == 7) then rgb = {192, 192, 192}
  elseif (x == 8) then rgb = {128, 128, 128}
  elseif (x == 9) then rgb = {255, 0, 0}
  elseif (x == 10) then rgb = {0, 255, 0}
  elseif (x == 11) then rgb = {255, 255, 0}
  elseif (x == 12) then rgb = {0, 0, 255}
  elseif (x == 13) then rgb = {255, 0, 255}
  elseif (x == 14) then rgb = {0, 255, 255}
  else rgb = {255, 255, 255} end
  
  love.graphics.setColor(rgb[1], rgb[2], rgb[3])
  
end

--[[
function gra.getColor(x)
  
  local rgb = {255, 255, 255}
  if (x == 0) then rgb = {0, 0, 0}
  elseif (x == 1) then rgb = {128, 0, 0}
  elseif (x == 2) then rgb = {0, 128, 0}
  elseif (x == 3) then rgb = {128, 128, 0}
  elseif (x == 4) then rgb = {0, 0, 128}
  elseif (x == 5) then rgb = {128, 0, 128}
  elseif (x == 6) then rgb = {0, 128, 128}
  elseif (x == 7) then rgb = {192, 192, 192}
  elseif (x == 8) then rgb = {128, 128, 128}
  elseif (x == 9) then rgb = {255, 0, 0}
  elseif (x == 10) then rgb = {0, 255, 0}
  elseif (x == 11) then rgb = {255, 255, 0}
  elseif (x == 12) then rgb = {0, 0, 255}
  elseif (x == 13) then rgb = {255, 0, 255}
  elseif (x == 14) then rgb = {0, 255, 255}
  else rgb = {255, 255, 255} end
  
  currentPrintColor = x
  
  return (rgb)
  
end
--]]

--[[
function gra.color(color)
  currentSetColor = color
end
--]]

function gra.set(x, y, str)
  --color = color or 15
  if (y > #printOut) or (x > #printOut[1]) then
    return
  end
  if (y < 1) or (x < 1) then
    return
  end
  printOut[y][x] = str
  --colorOut[y][x] = currentSetColor
end

function gra.get(x, y)
  return (printOut[y][x])
end

function gra.charCombine(stri, strf)
  up = false
  down = false
  right = false
  left = false
  
  if (stri == "║") then up = true; down = true
  elseif (stri == "═") then right = true; left = true
  elseif (stri == "╚") then up = true; right = true
  elseif (stri == "╝") then up = true; left = true
  elseif (stri == "╗") then left = true; down = true
  elseif (stri == "╔") then right = true; down = true
  elseif (stri == "╠") then up = true; down = true; right = true
  elseif (stri == "╣") then up = true; down = true; left = true
  elseif (stri == "╩") then up = true; right = true; left = true
  elseif (stri == "╦") then down = true; right = true; left = true
  elseif (stri == "╬") then up = true; down = true; right = true; left = true
  end
    
  if (strf == "║") then up = true; down = true
  elseif (strf == "═") then right = true; left = true
  elseif (strf == "╚") then up = true; right = true
  elseif (strf == "╝") then up = true; left = true
  elseif (strf == "╗") then left = true; down = true
  elseif (strf == "╔") then right = true; down = true
  elseif (strf == "╠") then up = true; down = true; right = true
  elseif (strf == "╣") then up = true; down = true; left = true
  elseif (strf == "╩") then up = true; right = true; left = true
  elseif (strf == "╦") then down = true; right = true; left = true
  elseif (strf == "╬") then up = true; down = true; right = true; left = true
  end

  if up then
    if down then
      if right then
        if left then
          return ("╬")
        else
          return ("╠")
        end
      else
        if left then
          return ("╣")
        else
          return ("║")
        end
      end
    else
      if right then
        if left then
          return ("╩")
        else
          return ("╚")
        end
      else
        if left then
          return ("╝")
        else
          return ("#")
        end
      end
    end
  else
    if down then
      if right then
        if left then
          return ("╦")
        else
          return ("╔")
        end
      else
        if left then
          return ("╗")
        else
          return ("@")
        end
      end
    else
      if right then
        if left then
          return ("═")
        else
          return ("%")
        end
      else
        if left then
          return ("&")
        else
          return (" ")
        end
      end
    end
  end
  
end

function gra.seto(x, y, str)
  gra.set(x, y, gra.charCombine(gra.get(x, y), str))
end

function gra.makeBox(x, y, w, h)
  gra.set(x, y, "╔")
  gra.set(x+w-1, y, "╗")
  gra.set(x, y+h-1, "╚")
  gra.set(x+w-1, y+h-1, "╝")
  
  for i=1, w-2 do
    gra.set(x+i, y, "═")
    gra.set(x+i, y+h-1, "═")
  end
  
  for i=1, h-2 do
    gra.set(x, y+i, "║")
    gra.set(x+w-1, y+i, "║")
  end
  
  for i=1, w-2 do
    for j=1, h-2 do
      gra.set(x+i, y+j, " ")
    end
  end
  
end

function gra.makeBoxAdapt(x, y, w, h)
  gra.seto(x, y, "╔")
  gra.seto(x+w-1, y, "╗")
  gra.seto(x, y+h-1, "╚")
  gra.seto(x+w-1, y+h-1, "╝")
  
  for i=1, w-2 do
    gra.seto(x+i, y, "═")
    gra.seto(x+i, y+h-1, "═")
  end
  
  for i=1, h-2 do
    gra.seto(x, y+i, "║")
    gra.seto(x+w-1, y+i, "║")
  end
  
  for i=1, w-2 do
    for j=1, h-2 do
      gra.seto(x+i, y+j, " ")
    end
  end
  
end

function gra.text(x, y, str)
  for i=1, string.len(str) do
    gra.set(x+i-1, y, string.sub(str, utf8.offset(str, i), utf8.offset(str, i+1)-1))
  end
end

function gra.setArea(x, y, w, h, str)
  for i=1, h do
    for j=1, w do
      gra.set(x+j-1, y+i-1, str)
    end
  end
end

-- App Functions

function gra.appCanvasReset(pen)
  
  apps[pen].canvas = {}
  for i=1, grid.height do
    apps[pen].canvas[i] = {}
    for j=1, grid.width - 66 do
      apps[pen].canvas[i][j] = " "
    end
  end
  
  --[[
  apps[pen].canvasColor = {}
  for i=1, grid.height do
    apps[pen].canvasColor[i] = {}
    for j=1, grid.width do
      apps[pen].canvasColor[i][j] = 15
    end
  end
  --]]
  
end

function gra.appSet(pen, x, y, str)
  if (y > #apps[pen].canvas) or (x > #apps[pen].canvas[1]) then
    return
  end
  if (y < 1) or (x < 1) then
    return
  end
  apps[pen].canvas[y][x] = str
  --[[
  apps[pen].canvasColor[y][x] = currentSetColor
  --]]
end

function gra.appSeto(pen, x, y, str)
  gra.appSet(pen, x, y, gra.charCombine(gra.appGet(pen, x, y), str))
end

function gra.appGet(pen, x, y)
  return (apps[pen].canvas[y][x])
end

function gra.appMakeBox(pen, x, y, w, h)
  gra.appSet(pen, x, y, "╔")
  gra.appSet(pen, x+w-1, y, "╗")
  gra.appSet(pen, x, y+h-1, "╚")
  gra.appSet(pen, x+w-1, y+h-1, "╝")
  
  for i=1, w-2 do
    gra.appSet(pen, x+i, y, "═")
    gra.appSet(pen, x+i, y+h-1, "═")
  end
  
  for i=1, h-2 do
    gra.appSet(pen, x, y+i, "║")
    gra.appSet(pen, x+w-1, y+i, "║")
  end
  
  for i=1, w-2 do
    for j=1, h-2 do
      gra.appSet(pen, x+i, y+j, " ")
    end
  end
  
end

function gra.appMakeBoxAdapt(pen, x, y, w, h)
  gra.appSeto(pen, x, y, "╔")
  gra.appSeto(pen, x+w-1, y, "╗")
  gra.appSeto(pen, x, y+h-1, "╚")
  gra.appSeto(pen, x+w-1, y+h-1, "╝")
  
  for i=1, w-2 do
    gra.appSeto(pen, x+i, y, "═")
    gra.appSeto(pen, x+i, y+h-1, "═")
  end
  
  for i=1, h-2 do
    gra.appSeto(pen, x, y+i, "║")
    gra.appSeto(pen, x+w-1, y+i, "║")
  end
  
  for i=1, w-2 do
    for j=1, h-2 do
      gra.appSeto(pen, x+i, y+j, " ")
    end
  end
  
end

function gra.appText(pen, x, y, str)
  for i=1, utf8.len(str) do
    gra.appSet(pen, x+i-1, y, string.sub(str, utf8.offset(str, i), utf8.offset(str, i+1)-1))
  end
end

return (gra)