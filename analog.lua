--This more complicated example(~20 lines, reads 5 analog inputs, and sets 2 digital outputs) only runs at ~3kHz.
LJ.DIO_D_W(3, 1)  --FIO3 to output.
MB.W(43903, 0, 1) --AIN_ALL_RESOLUTION_INDEX to 1
LJ.setLuaThrottle(100)
c = 0
ThresholdVoltage = 2.5
LJ.IntervalConfig(0, 1000) --1000ms
while true do
  V1 = MB.R(0, 3)     --read AIN0
  V2 = MB.R(2, 3)     --read AIN1
  V3 = MB.R(4, 3)
  V4 = MB.R(6, 3)
  V5 = MB.R(8, 3)
  if V4 > ThresholdVoltage then
    MB.W(2003, 0, 1)  --set FIO3 high
  else
    MB.W(2003, 0, 0)
  end
  if V5 > ThresholdVoltage then
    MB.W(2000, 0, 1)  --set FIO0 high
  else
    MB.W(2000, 0, 0)
  end
  c = c + 1
  if LJ.CheckInterval(0) then --every 1000ms or 1s
    print ("Frequency in Hz: ", c)
    c = 0
  end
end