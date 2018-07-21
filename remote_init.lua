gpio.mode(0, gpio.INPUT)
gpio.mode(1, gpio.INPUT)
gpio.mode(2, gpio.INPUT)
gpio.mode(3, gpio.INPUT)
gpio.mode(4, gpio.INPUT)
gpio.mode(5, gpio.INPUT)
gpio.mode(6, gpio.INPUT)
gpio.mode(7, gpio.INPUT)
gpio.mode(8, gpio.INPUT)

wifi.setmode(wifi.STATION)
wifi.setphymode(wifi.PHYMODE_B)
station_cfg={}
station_cfg.ssid="HEM"
station_cfg.pwd="toong126ntmk"
station_cfg.save=true
wifi.sta.config(station_cfg)

tmr.alarm(1,1000, 1, function() if wifi.sta.getip()==nil then print(" Wait for IP address!") else print("New IP address is "..wifi.sta.getip()) tmr.stop(1)  dofile('remote.lua') end end)