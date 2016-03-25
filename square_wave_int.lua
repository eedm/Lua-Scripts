--create a square wave using Interval
LJ.DIO_D_W(5, 1)        --FIO5 to output.
LJ.setLuaThrottle(10)
--LJ.IntervalConfig(0, 0.1) --1ms
LJ.IntervalConfig(0,1000/2)  --1sec period
c = 0
while true do
  if LJ.CheckInterval(0) then
    if c == 0 then
      LJ.DIO_S_W(5, 0)
      c = 1
    else
      LJ.DIO_S_W(5, 1)
      c = 0
    end     
  end
end