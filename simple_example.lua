--This extremely basic example(3 lines, toggles a DIO) runs at 20kHz
LJ.DIO_D_W(5, 1)        --FIO5 to output.
LJ.setLuaThrottle(10)
c = 0
t = LJ.Tick()
LJ.IntervalConfig(0, 1000) --1000ms
while true do
  LJ.DIO_S_W(5, 0)
  LJ.DIO_S_W(5, 1)
  c = c + 1
  if LJ.CheckInterval(0) then --every 1000ms or 1s
    print ("Frequency in Hz: ", c)
    print ("Ticks: ", LJ.Tick()-t)
    t = LJ.Tick()
    c = 0
  end
end

