--create a square wave. LJTick is every 1/2 core timer => 80mhz clock
LJ.DIO_D_W(5, 1)        --FIO5 to output.
LJ.setLuaThrottle(10)
c = 0
while true do
  if LJ.Tick() % 4000 == 0 then
    if c == 0 then
      LJ.DIO_S_W(5, 0)
      c = 1
    else
      LJ.DIO_S_W(5, 1)
      c = 0
    end     
  end
end